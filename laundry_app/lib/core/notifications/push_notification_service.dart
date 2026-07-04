/// Push notification service — deferred to future phase.
///
/// Planned notifications:
/// - Hotel Admin: "New challan submitted for [Hotel]"
/// - Super Admin: "Damage threshold exceeded at [Hotel]"
///
/// Implementation requirements:
/// - Firebase Cloud Messaging (FCM) integration
/// - Backend: POST /api/v1/notifications/register-device endpoint
/// - Backend: Notification trigger on challan submission and damage threshold
/// - Platform-specific setup (APNs for iOS, FCM for Android/Web)
///
/// This file intentionally left as a stub. Uncomment and implement when ready.
class PushNotificationService {
  const PushNotificationService._();

  // Future<void> initialize() async { ... }
  // Future<void> registerDevice(String token) async { ... }
  // Future<void> handleMessage(RemoteMessage message) async { ... }
}
