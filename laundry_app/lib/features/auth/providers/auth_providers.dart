import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../core/constants/enums.dart';
import '../../../core/constants/env_config.dart';
import '../../../core/network/api_result.dart';
import '../../../core/network/dio_client.dart';
import '../../../core/storage/app_database.dart';
import '../../../core/storage/secure_storage.dart';
import '../../../core/storage/storage_service.dart';
import '../../../core/utils/dev_jwt.dart';
import '../../../core/utils/jwt_decoder.dart';
import '../data/auth_repository.dart';
import '../data/google_auth_service.dart';
import '../../admin/data/admin_repository.dart';
import '../../admin/data/models/admin_models.dart';

// --- Core singletons ---

final secureStorageProvider = Provider<SecureStorage>(
  (_) => SecureStorage(),
);

final appDatabaseProvider = Provider<AppDatabase>(
  (_) => AppDatabase(),
);

final storageServiceProvider = Provider<StorageService>((ref) {
  return StorageService(
    secureStorage: ref.watch(secureStorageProvider),
    database: ref.watch(appDatabaseProvider),
  );
});

final dioClientProvider = Provider<DioClient>((ref) {
  return DioClient(
    baseUrl: EnvConfig.baseApiUrl,
    secureStorage: ref.watch(secureStorageProvider),
  );
});

final googleAuthServiceProvider = Provider<GoogleAuthService>((_) {
  return GoogleAuthService(
    clientId: EnvConfig.googleWebClientId,
  );
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(dioClient: ref.watch(dioClientProvider));
});

final adminRepositoryProvider = Provider<AdminRepository>((ref) {
  return AdminRepository(dioClient: ref.watch(dioClientProvider));
});

// --- Auth state ---

sealed class AuthState {
  const AuthState();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class Authenticated extends AuthState {
  const Authenticated({
    required this.userId,
    required this.role,
    this.hotelId,
    required this.token,
    this.displayName,
    this.email,
  });

  final String userId;
  final UserRole role;
  final String? hotelId;
  final String token;
  final String? displayName;
  final String? email;
}

class Unauthenticated extends AuthState {
  const Unauthenticated([this.error]);

  final String? error;
}

class AuthNotifier extends Notifier<AuthState> {
  StreamSubscription<GoogleSignInAccount?>? _googleUserSub;
  bool _isCompletingGoogleSignIn = false;

  @override
  AuthState build() {
    _listenForGoogleWebSignIn();
    _primeGoogleAuth();
    _tryRestoreSession();
    return const AuthLoading();
  }

  void _primeGoogleAuth() {
    // Web GIS button remains in "Getting ready..." until initialize() runs.
    unawaited(ref.read(googleAuthServiceProvider).attemptLightweightAuth());
  }

  void _listenForGoogleWebSignIn() {
    _googleUserSub ??= ref
        .read(googleAuthServiceProvider)
        .userChanges
        .listen((_) => unawaited(_handleGoogleUserChanged()));
    ref.onDispose(() => _googleUserSub?.cancel());
  }

  Future<void> _handleGoogleUserChanged() async {
    if (_isCompletingGoogleSignIn) return;
    if (state is Authenticated) return;

    final googleAuth = ref.read(googleAuthServiceProvider);
    final googleResult = await googleAuth.currentAuthResult();
    if (googleResult == null) return;

    await _completeGoogleSignIn(googleResult);
  }

  Future<void> _tryRestoreSession() async {
    final secureStorage = ref.read(secureStorageProvider);
    final token = await secureStorage.readToken();

    if (token == null) {
      state = const Unauthenticated();
      return;
    }

    final decoded = JwtDecoder.decode(token);
    if (decoded == null || decoded.isExpired) {
      await secureStorage.deleteToken();
      state = const Unauthenticated();
      return;
    }

    state = Authenticated(
      userId: decoded.userId,
      role: decoded.role,
      hotelId: decoded.hotelId,
      token: token,
    );
  }

  Future<void> signInWithGoogle() async {
    state = const AuthLoading();

    try {
      final googleAuth = ref.read(googleAuthServiceProvider);
      final googleResult = await googleAuth.authenticate();
      await _completeGoogleSignIn(googleResult);
    } on GoogleSignInException catch (e) {
      if (e.code == GoogleSignInExceptionCode.canceled) {
        state = const Unauthenticated('Google sign-in was cancelled');
      } else {
        state = Unauthenticated('Google sign-in failed: ${e.description}');
      }
    } on GoogleSignInUnsupportedException {
      state = const Unauthenticated(
        'Google sign-in is not supported on this platform',
      );
    } on GoogleSignInNoUserException {
      state = const Unauthenticated('Google sign-in did not return a user');
    } catch (e) {
      state = Unauthenticated('An unexpected error occurred: $e');
    }
  }

  Future<void> _completeGoogleSignIn(GoogleAuthResult googleResult) async {
    if (_isCompletingGoogleSignIn) return;
    _isCompletingGoogleSignIn = true;
    try {
      final authRepo = ref.read(authRepositoryProvider);
      final result = await authRepo.loginWithGoogle(googleResult.idToken);

      switch (result) {
        case Success(data: final tokenResponse):
          final secureStorage = ref.read(secureStorageProvider);
          await secureStorage.writeToken(tokenResponse.accessToken);

          final decoded = JwtDecoder.decode(tokenResponse.accessToken);
          if (decoded == null) {
            await secureStorage.deleteToken();
            state = const Unauthenticated(
              'Failed to decode authentication token',
            );
            return;
          }

          state = Authenticated(
            userId: decoded.userId,
            role: decoded.role,
            hotelId: decoded.hotelId,
            token: tokenResponse.accessToken,
            displayName: googleResult.displayName,
            email: googleResult.email,
          );

        case Failure(exception: final exception):
          state = Unauthenticated(_mapErrorMessage(exception));
      }
    } finally {
      _isCompletingGoogleSignIn = false;
    }
  }

  /// Debug-only: skip Google Sign-In by minting a local JWT.
  Future<void> devLogin(DevLoginProfile profile) async {
    assert(kDebugMode, 'devLogin must only be called in debug mode');
    state = const AuthLoading();

    final token = DevJwt.mint(
      sub: profile.userId,
      role: profile.role.toJson(),
      hotelId: profile.hotelId,
    );

    final secureStorage = ref.read(secureStorageProvider);
    await secureStorage.writeToken(token);

    state = Authenticated(
      userId: profile.userId,
      role: profile.role,
      hotelId: profile.hotelId,
      token: token,
      displayName: profile.label,
      email: profile.email,
    );
  }

  Future<void> logout() async {
    final storageService = ref.read(storageServiceProvider);
    await storageService.clearAll();
    state = const Unauthenticated();

    try {
      final googleAuth = ref.read(googleAuthServiceProvider);
      await googleAuth.signOut().timeout(const Duration(seconds: 3));
    } catch (_) {
      // Best-effort Google sign-out; continue regardless
    }
  }

  Future<void> resetLocalState() async {
    final storageService = ref.read(storageServiceProvider);
    await storageService.clearAll();
    state = const Unauthenticated();
  }

  Future<List<DevLoginProfile>> loadDevProfilesForRole(UserRole role) async {
    assert(kDebugMode, 'loadDevProfilesForRole is debug-only');
    if (role == UserRole.superAdmin) {
      return devLoginProfiles
          .where((p) => p.role == UserRole.superAdmin)
          .toList(growable: false);
    }

    final secureStorage = ref.read(secureStorageProvider);
    final previousToken = await secureStorage.readToken();

    // Pre-login fetch: mint a temporary super-admin JWT for local dev backend.
    final bootstrapToken = DevJwt.mint(
      sub: _devBootstrapSuperAdmin.userId,
      role: UserRole.superAdmin.toJson(),
    );

    await secureStorage.writeToken(bootstrapToken);
    try {
      final adminRepo = ref.read(adminRepositoryProvider);
      final result = await adminRepo.listUsers(
        role: role.toJson(),
        isActive: true,
        pageSize: 200,
      );

      return switch (result) {
        Success(data: final users) => users
            .map((u) => _profileFromUser(u))
            .toList(growable: false),
        Failure() => const <DevLoginProfile>[],
      };
    } finally {
      if (previousToken == null) {
        await secureStorage.deleteToken();
      } else {
        await secureStorage.writeToken(previousToken);
      }
    }
  }

  DevLoginProfile _profileFromUser(UserResponse user) {
    final display = user.displayName?.trim();
    final hasDisplay = display != null && display.isNotEmpty;
    final roleLabel = switch (user.role) {
      UserRole.hotelAdmin => 'Hotel Admin',
      UserRole.serviceAgent => 'Service Agent',
      UserRole.superAdmin => 'Super Admin',
    };

    return DevLoginProfile(
      label: hasDisplay ? '$roleLabel - $display' : '$roleLabel - ${user.googleEmail}',
      userId: user.id,
      email: user.googleEmail,
      role: user.role,
      hotelId: user.hotelId,
    );
  }

  String _mapErrorMessage(AppException exception) {
    return switch (exception) {
      UnauthorizedException(message: final msg)
          when msg.contains('inactive') =>
        'Your account has been deactivated. Contact your administrator.',
      NotFoundException() =>
        'No account found for this Google email. Contact your administrator to get access.',
      NetworkException() =>
        'Unable to connect. Check your internet connection and try again.',
      _ => exception.message,
    };
  }
}

final authStateProvider = NotifierProvider<AuthNotifier, AuthState>(
  AuthNotifier.new,
);

// --- Derived convenience providers ---

final currentUserRoleProvider = Provider<UserRole?>((ref) {
  final authState = ref.watch(authStateProvider);
  if (authState is Authenticated) return authState.role;
  return null;
});

final currentUserIdProvider = Provider<String?>((ref) {
  final authState = ref.watch(authStateProvider);
  if (authState is Authenticated) return authState.userId;
  return null;
});

final currentHotelIdProvider = Provider<String?>((ref) {
  final authState = ref.watch(authStateProvider);
  if (authState is Authenticated) return authState.hotelId;
  return null;
});

final isAuthenticatedProvider = Provider<bool>((ref) {
  return ref.watch(authStateProvider) is Authenticated;
});

// --- Dev login profiles (debug only) ---

class DevLoginProfile {
  const DevLoginProfile({
    required this.label,
    required this.userId,
    required this.email,
    required this.role,
    this.hotelId,
  });

  final String label;
  final String userId;
  final String email;
  final UserRole role;
  final String? hotelId;
}

const devLoginProfiles = [
  _devBootstrapSuperAdmin,
];

const _devBootstrapSuperAdmin = DevLoginProfile(
    label: 'Super Admin',
    userId: '500b9d30-db8d-409f-b7b7-23353ea9089f',
    email: 'superadmin@laundrotrack.com',
    role: UserRole.superAdmin,
  );
