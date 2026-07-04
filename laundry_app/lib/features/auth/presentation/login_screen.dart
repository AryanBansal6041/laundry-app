import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../core/constants/enums.dart';
import '../../../core/theme/app_colors.dart';
import 'google_web_button_wrapper.dart' as web;
import '../providers/auth_providers.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
    final isLoading = authState is AuthLoading;
    final errorMessage =
        authState is Unauthenticated ? authState.error : null;
    final supportsAuthenticate = GoogleSignIn.instance.supportsAuthenticate();

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 32),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _Logo(),
                  const SizedBox(height: 48),
                  if (kIsWeb && !supportsAuthenticate)
                    const _GoogleWebSignInButton()
                  else
                    _GoogleSignInButton(
                      isLoading: isLoading,
                      onPressed: () {
                        HapticFeedback.mediumImpact();
                        ref.read(authStateProvider.notifier).signInWithGoogle();
                      },
                    ),
                  if (errorMessage != null) ...[
                    const SizedBox(height: 16),
                    _ErrorBanner(
                      message: errorMessage,
                      isCancelled: errorMessage.contains('cancelled'),
                    ),
                  ],
                  if (kDebugMode) ...[
                    const SizedBox(height: 32),
                    _DevLoginSection(isLoading: isLoading),
                  ],
                  const SizedBox(height: 32),
                  Text(
                    'v1.0.0',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColors.primary, AppColors.primaryLight],
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.3),
                blurRadius: 20,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: const Icon(
            Icons.local_laundry_service,
            size: 44,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'LaundroTrack',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
                letterSpacing: -0.5,
              ),
        ),
        const SizedBox(height: 6),
        Text(
          'Commercial Laundry Management',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.textSecondary,
              ),
        ),
      ],
    );
  }
}

class _GoogleSignInButton extends StatelessWidget {
  const _GoogleSignInButton({
    required this.isLoading,
    required this.onPressed,
  });

  final bool isLoading;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: OutlinedButton(
        onPressed: isLoading ? null : onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          side: const BorderSide(color: AppColors.border, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 1,
        ),
        child: isLoading
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.5,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Signing in…',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _GoogleLogo(),
                  const SizedBox(width: 12),
                  Text(
                    'Sign in with Google',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class _GoogleWebSignInButton extends StatelessWidget {
  const _GoogleWebSignInButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Center(child: web.renderGoogleWebButton()),
    );
  }
}

class _GoogleLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20,
      height: 20,
      child: CustomPaint(painter: _GoogleLogoPainter()),
    );
  }
}

class _GoogleLogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double w = size.width;
    final double h = size.height;

    // Blue
    final bluePaint = Paint()
      ..color = const Color(0xFF4285F4)
      ..style = PaintingStyle.fill;
    final bluePath = Path()
      ..moveTo(w * 0.94, h * 0.51)
      ..cubicTo(w * 0.94, h * 0.475, w * 0.937, h * 0.443, w * 0.93, h * 0.417)
      ..lineTo(w * 0.5, h * 0.417)
      ..lineTo(w * 0.5, h * 0.594)
      ..lineTo(w * 0.747, h * 0.594)
      ..cubicTo(w * 0.735, h * 0.658, w * 0.705, h * 0.71, w * 0.655, h * 0.748)
      ..lineTo(w * 0.804, h * 0.863)
      ..cubicTo(w * 0.891, h * 0.783, w * 0.94, h * 0.665, w * 0.94, h * 0.51);
    canvas.drawPath(bluePath, bluePaint);

    // Green
    final greenPaint = Paint()
      ..color = const Color(0xFF34A853)
      ..style = PaintingStyle.fill;
    final greenPath = Path()
      ..moveTo(w * 0.5, h * 0.958)
      ..cubicTo(w * 0.624, h * 0.958, w * 0.728, h * 0.917, w * 0.804, h * 0.847)
      ..lineTo(w * 0.655, h * 0.732)
      ..cubicTo(w * 0.614, h * 0.76, w * 0.562, h * 0.776, w * 0.5, h * 0.776)
      ..cubicTo(w * 0.381, h * 0.776, w * 0.28, h * 0.696, w * 0.243, h * 0.587)
      ..lineTo(w * 0.091, h * 0.705)
      ..cubicTo(w * 0.166, h * 0.855, w * 0.321, h * 0.958, w * 0.5, h * 0.958);
    canvas.drawPath(greenPath, greenPaint);

    // Yellow
    final yellowPaint = Paint()
      ..color = const Color(0xFFFBBC05)
      ..style = PaintingStyle.fill;
    final yellowPath = Path()
      ..moveTo(w * 0.243, h * 0.587)
      ..cubicTo(w * 0.234, h * 0.56, w * 0.229, h * 0.53, w * 0.229, h * 0.5)
      ..cubicTo(w * 0.229, h * 0.47, w * 0.234, h * 0.44, w * 0.243, h * 0.413)
      ..lineTo(w * 0.091, h * 0.295)
      ..cubicTo(w * 0.055, h * 0.368, w * 0.035, h * 0.45, w * 0.035, h * 0.5)
      ..cubicTo(w * 0.035, h * 0.55, w * 0.055, h * 0.632, w * 0.091, h * 0.705)
      ..lineTo(w * 0.243, h * 0.587);
    canvas.drawPath(yellowPath, yellowPaint);

    // Red
    final redPaint = Paint()
      ..color = const Color(0xFFEA4335)
      ..style = PaintingStyle.fill;
    final redPath = Path()
      ..moveTo(w * 0.5, h * 0.224)
      ..cubicTo(w * 0.568, h * 0.224, w * 0.628, h * 0.247, w * 0.676, h * 0.292)
      ..lineTo(w * 0.807, h * 0.161)
      ..cubicTo(w * 0.727, h * 0.087, w * 0.624, h * 0.042, w * 0.5, h * 0.042)
      ..cubicTo(w * 0.321, h * 0.042, w * 0.166, h * 0.145, w * 0.091, h * 0.295)
      ..lineTo(w * 0.243, h * 0.413)
      ..cubicTo(w * 0.28, h * 0.304, w * 0.381, h * 0.224, w * 0.5, h * 0.224);
    canvas.drawPath(redPath, redPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _DevLoginSection extends ConsumerWidget {
  const _DevLoginSection({required this.isLoading});

  final bool isLoading;

  static final _roleIcons = {
    UserRole.superAdmin: Icons.admin_panel_settings,
    UserRole.hotelAdmin: Icons.hotel,
    UserRole.serviceAgent: Icons.local_shipping,
  };

  static final _roleColors = {
    UserRole.superAdmin: const Color(0xFF7B1FA2),
    UserRole.hotelAdmin: const Color(0xFF1565C0),
    UserRole.serviceAgent: const Color(0xFF2E7D32),
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.read(authStateProvider.notifier);

    return Column(
      children: [
        Row(
          children: [
            const Expanded(child: Divider()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                'DEV LOGIN',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: AppColors.textSecondary,
                      letterSpacing: 1.5,
                    ),
              ),
            ),
            const Expanded(child: Divider()),
          ],
        ),
        const SizedBox(height: 12),
        _DevRoleButton(
          title: 'Super Admin',
          subtitle: 'Single fixed admin for setup',
          icon: _roleIcons[UserRole.superAdmin]!,
          color: _roleColors[UserRole.superAdmin]!,
          enabled: !isLoading,
          onTap: () {
            HapticFeedback.mediumImpact();
            authNotifier.devLogin(devLoginProfiles.first);
          },
        ),
        const SizedBox(height: 8),
        _DevRoleButton(
          title: 'Hotel Admin',
          subtitle: 'Choose from active HOTEL_ADMIN users',
          icon: _roleIcons[UserRole.hotelAdmin]!,
          color: _roleColors[UserRole.hotelAdmin]!,
          enabled: !isLoading,
          onTap: () => _openRolePicker(
            context: context,
            ref: ref,
            role: UserRole.hotelAdmin,
          ),
        ),
        const SizedBox(height: 8),
        _DevRoleButton(
          title: 'Service Agent',
          subtitle: 'Choose from active SERVICE_AGENT users',
          icon: _roleIcons[UserRole.serviceAgent]!,
          color: _roleColors[UserRole.serviceAgent]!,
          enabled: !isLoading,
          onTap: () => _openRolePicker(
            context: context,
            ref: ref,
            role: UserRole.serviceAgent,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: double.infinity,
          child: TextButton.icon(
            onPressed: isLoading
                ? null
                : () async {
                    HapticFeedback.lightImpact();
                    await authNotifier.resetLocalState();
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Fresh start complete: local DB reset'),
                        ),
                      );
                    }
                  },
            icon: const Icon(Icons.restart_alt),
            label: const Text('Fresh Start (reset local data)'),
          ),
        ),
      ],
    );
  }

  Future<void> _openRolePicker({
    required BuildContext context,
    required WidgetRef ref,
    required UserRole role,
  }) async {
    HapticFeedback.mediumImpact();
    final authNotifier = ref.read(authStateProvider.notifier);
    final profiles = await authNotifier.loadDevProfilesForRole(role);

    if (!context.mounted) return;
    if (profiles.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No active ${role.toJson()} users found')),
      );
      return;
    }

    final picked = await showModalBottomSheet<DevLoginProfile>(
      context: context,
      showDragHandle: true,
      builder: (ctx) => SafeArea(
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: profiles.length,
          separatorBuilder: (_, index) => const Divider(height: 1),
          itemBuilder: (ctx, index) {
            final profile = profiles[index];
            return ListTile(
              leading: Icon(
                _roleIcons[profile.role],
                color: _roleColors[profile.role],
              ),
              title: Text(profile.label),
              subtitle: Text(profile.email),
              onTap: () => Navigator.of(ctx).pop(profile),
            );
          },
        ),
      ),
    );

    if (picked != null) {
      await authNotifier.devLogin(picked);
    }
  }
}

class _DevRoleButton extends StatelessWidget {
  const _DevRoleButton({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.enabled,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final bool enabled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: enabled ? onTap : null,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: color.withValues(alpha: 0.4)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        ),
        child: Row(
          children: [
            Icon(icon, size: 18, color: color),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: color,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: color),
          ],
        ),
      ),
    );
  }
}

class _ErrorBanner extends StatelessWidget {
  const _ErrorBanner({
    required this.message,
    this.isCancelled = false,
  });

  final String message;
  final bool isCancelled;

  @override
  Widget build(BuildContext context) {
    final bgColor = isCancelled ? const Color(0xFFE3F2FD) : const Color(0xFFFFEBEE);
    final fgColor = isCancelled ? const Color(0xFF1565C0) : AppColors.damageRed;
    final icon = isCancelled ? Icons.info_outline : Icons.warning_amber_rounded;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: fgColor),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: fgColor,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
