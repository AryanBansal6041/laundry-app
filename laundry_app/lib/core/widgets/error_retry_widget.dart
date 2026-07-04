import 'package:flutter/material.dart';

import '../network/api_result.dart';
import '../theme/app_colors.dart';

class ErrorRetryWidget extends StatelessWidget {
  const ErrorRetryWidget({
    super.key,
    required this.message,
    this.onRetry,
    this.icon,
  });

  final String message;
  final VoidCallback? onRetry;
  final IconData? icon;

  factory ErrorRetryWidget.fromException(
    AppException exception, {
    VoidCallback? onRetry,
  }) {
    final (msg, ico) = switch (exception) {
      NetworkException() => (
          'No internet connection. Check your network and try again.',
          Icons.wifi_off,
        ),
      UnauthorizedException(message: final m) when m.contains('inactive') => (
          'Your account has been deactivated. Contact your administrator.',
          Icons.block,
        ),
      UnauthorizedException() => (
          'Session expired. Please sign in again.',
          Icons.lock_outline,
        ),
      ForbiddenException() => (
          'You don\'t have permission to access this resource.',
          Icons.no_accounts,
        ),
      NotFoundException() => (
          'The requested resource was not found.',
          Icons.search_off,
        ),
      ConflictException(message: final m) => (m, Icons.warning_amber),
      ValidationException(message: final m) => (m, Icons.error_outline),
      ServerException() => (
          'Something went wrong on our end. Please try again later.',
          Icons.cloud_off,
        ),
    };
    return ErrorRetryWidget(message: msg, onRetry: onRetry, icon: ico);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon ?? Icons.error_outline,
              size: 64,
              color: AppColors.textSecondary,
            ),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.textSecondary,
                  ),
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: const Text('Retry'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
