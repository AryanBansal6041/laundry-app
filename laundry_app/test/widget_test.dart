import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:laundry_app/core/constants/enums.dart';
import 'package:laundry_app/features/auth/providers/auth_providers.dart';
import 'package:laundry_app/main.dart';

void main() {
  group('7D: Login screen widget tests', () {
    testWidgets('shows branding and sign-in button when unauthenticated',
        (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            authStateProvider.overrideWith(() => _FakeUnauthNotifier()),
          ],
          child: const LaundroTrackApp(),
        ),
      );
      await tester.pump();

      expect(find.text('LaundroTrack'), findsOneWidget);
      expect(find.text('Commercial Laundry Management'), findsOneWidget);
      expect(find.text('Sign in with Google'), findsOneWidget);
      expect(find.text('v1.0.0'), findsOneWidget);
    });

    testWidgets('shows loading indicator during auth loading', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            authStateProvider.overrideWith(() => _FakeLoadingAuthNotifier()),
          ],
          child: const LaundroTrackApp(),
        ),
      );
      await tester.pump();

      expect(find.text('Signing in…'), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Sign in with Google'), findsNothing);
    });

    testWidgets('shows error banner on auth failure', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            authStateProvider.overrideWith(() => _FakeErrorAuthNotifier()),
          ],
          child: const LaundroTrackApp(),
        ),
      );
      await tester.pump();

      expect(find.text('No account found for this email'), findsOneWidget);
      expect(find.byIcon(Icons.warning_amber_rounded), findsOneWidget);
    });

    testWidgets('shows info banner when sign-in cancelled', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            authStateProvider.overrideWith(() => _FakeCancelledAuthNotifier()),
          ],
          child: const LaundroTrackApp(),
        ),
      );
      await tester.pump();

      expect(find.textContaining('cancelled'), findsOneWidget);
      expect(find.byIcon(Icons.info_outline), findsOneWidget);
    });
  });

  group('7D: Authenticated routing tests', () {
    testWidgets('agent role redirects away from login', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            authStateProvider.overrideWith(() => _FakeAgentAuthNotifier()),
          ],
          child: const LaundroTrackApp(),
        ),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.text('Sign in with Google'), findsNothing);
    });

    testWidgets('hotel admin role redirects away from login', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            authStateProvider.overrideWith(() => _FakeHotelAdminAuthNotifier()),
          ],
          child: const LaundroTrackApp(),
        ),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.text('Sign in with Google'), findsNothing);
    });

    testWidgets('super admin role redirects away from login', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            authStateProvider.overrideWith(() => _FakeSuperAdminAuthNotifier()),
          ],
          child: const LaundroTrackApp(),
        ),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.text('Sign in with Google'), findsNothing);
    });
  });
}

class _FakeUnauthNotifier extends AuthNotifier {
  @override
  AuthState build() => const Unauthenticated();
}

class _FakeLoadingAuthNotifier extends AuthNotifier {
  @override
  AuthState build() => const AuthLoading();
}

class _FakeErrorAuthNotifier extends AuthNotifier {
  @override
  AuthState build() => const Unauthenticated('No account found for this email');
}

class _FakeCancelledAuthNotifier extends AuthNotifier {
  @override
  AuthState build() =>
      const Unauthenticated('Google sign-in was cancelled');
}

class _FakeAgentAuthNotifier extends AuthNotifier {
  @override
  AuthState build() => const Authenticated(
        userId: 'u-1',
        role: UserRole.serviceAgent,
        token: 'fake-token',
        hotelId: null,
      );
}

class _FakeHotelAdminAuthNotifier extends AuthNotifier {
  @override
  AuthState build() => const Authenticated(
        userId: 'u-2',
        role: UserRole.hotelAdmin,
        hotelId: 'h-1',
        token: 'fake-token',
      );
}

class _FakeSuperAdminAuthNotifier extends AuthNotifier {
  @override
  AuthState build() => const Authenticated(
        userId: 'u-3',
        role: UserRole.superAdmin,
        token: 'fake-token',
      );
}
