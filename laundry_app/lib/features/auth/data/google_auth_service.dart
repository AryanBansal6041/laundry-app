import 'dart:async';

import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthResult {
  const GoogleAuthResult({
    required this.idToken,
    required this.email,
    this.displayName,
  });

  final String idToken;
  final String email;
  final String? displayName;
}

class GoogleAuthService {
  GoogleAuthService({this.clientId, this.serverClientId});

  final String? clientId;
  final String? serverClientId;
  bool _initialized = false;
  GoogleSignInAccount? _currentUser;
  final _userController = StreamController<GoogleSignInAccount?>.broadcast();

  GoogleSignIn get _signIn => GoogleSignIn.instance;

  Stream<GoogleSignInAccount?> get userChanges => _userController.stream;
  GoogleSignInAccount? get currentUser => _currentUser;

  Future<void> initialize() async {
    if (_initialized) return;
    _initialized = true;

    await _signIn.initialize(
      clientId: clientId,
      serverClientId: serverClientId,
    );

    _signIn.authenticationEvents
        .listen(_onAuthEvent)
        .onError(_onAuthError);
  }

  void _onAuthEvent(GoogleSignInAuthenticationEvent event) {
    _currentUser = switch (event) {
      GoogleSignInAuthenticationEventSignIn(:final user) => user,
      GoogleSignInAuthenticationEventSignOut() => null,
    };
    _userController.add(_currentUser);
  }

  void _onAuthError(Object error) {
    _currentUser = null;
    _userController.add(null);
  }

  Future<GoogleAuthResult> authenticate() async {
    await initialize();

    if (!_signIn.supportsAuthenticate()) {
      throw GoogleSignInUnsupportedException();
    }

    await _signIn.authenticate();

    final user = _currentUser;
    if (user == null) {
      throw GoogleSignInNoUserException();
    }

    final idToken = user.authentication.idToken;
    if (idToken == null) {
      throw GoogleSignInNoTokenException();
    }

    return GoogleAuthResult(
      idToken: idToken,
      email: user.email,
      displayName: user.displayName,
    );
  }

  /// Attempts a lightweight (non-interactive) authentication.
  /// Returns the user with ID token if already signed in, null otherwise.
  Future<GoogleAuthResult?> attemptLightweightAuth() async {
    await initialize();

    final future = _signIn.attemptLightweightAuthentication();

    GoogleSignInAccount? account;
    if (future != null) {
      account = await future;
    }

    account ??= _currentUser;
    if (account == null) return null;

    final idToken = account.authentication.idToken;
    if (idToken == null) return null;

    return GoogleAuthResult(
      idToken: idToken,
      email: account.email,
      displayName: account.displayName,
    );
  }

  Future<GoogleAuthResult?> currentAuthResult() async {
    await initialize();
    final account = _currentUser;
    if (account == null) return null;

    final idToken = account.authentication.idToken;
    if (idToken == null) return null;

    return GoogleAuthResult(
      idToken: idToken,
      email: account.email,
      displayName: account.displayName,
    );
  }

  Future<void> signOut() async {
    await _signIn.disconnect();
  }

  void dispose() {
    _userController.close();
  }
}

class GoogleSignInCancelledException implements Exception {
  @override
  String toString() => 'Google sign-in was cancelled';
}

class GoogleSignInUnsupportedException implements Exception {
  @override
  String toString() =>
      'This platform does not support direct Google Sign-In authentication';
}

class GoogleSignInNoUserException implements Exception {
  @override
  String toString() => 'No user returned after Google sign-in';
}

class GoogleSignInNoTokenException implements Exception {
  @override
  String toString() => 'Failed to obtain Google ID token';
}
