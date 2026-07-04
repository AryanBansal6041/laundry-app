import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../auth/providers/auth_providers.dart';
import '../providers/agent_providers.dart';

// ---------------------------------------------------------------------------
// Connectivity provider
// ---------------------------------------------------------------------------

final _connectivityProvider = StreamProvider<InternetStatus>((ref) {
  return InternetConnection.createInstance().onStatusChange;
});

// ---------------------------------------------------------------------------
// AgentShell — bottom navigation wrapper
// ---------------------------------------------------------------------------

class AgentShell extends ConsumerWidget {
  const AgentShell({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = _calculateSelectedIndex(context);

    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => _onItemTapped(index, context),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history_outlined),
            activeIcon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            activeIcon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  int _calculateSelectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    if (location.startsWith('/agent/history')) return 1;
    if (location.startsWith('/agent/settings')) return 2;
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go('/agent/home');
      case 1:
        context.go('/agent/history');
      case 2:
        context.go('/agent/settings');
    }
  }
}

// ---------------------------------------------------------------------------
// AgentHomeScreen
// ---------------------------------------------------------------------------

class AgentHomeScreen extends ConsumerWidget {
  const AgentHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
    final displayName =
        authState is Authenticated ? authState.displayName : null;
    final hotelsAsync = ref.watch(agentHotelsProvider);
    final syncCount = ref.watch(pendingSyncCountProvider);
    final connectivity = ref.watch(_connectivityProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Hello, ${displayName ?? 'Agent'}!'),
        actions: [
          _SyncBadgeButton(syncCount: syncCount),
        ],
      ),
      body: Column(
        children: [
          _OfflineBanner(connectivity: connectivity),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                ref.invalidate(agentHotelsProvider);
                await ref.read(agentHotelsProvider.future);
              },
              child: hotelsAsync.when(
                loading: () => const _HotelListSkeleton(),
                error: (error, _) => _ErrorView(
                  message: error.toString(),
                  onRetry: () => ref.invalidate(agentHotelsProvider),
                ),
                data: (hotels) {
                  if (hotels.isEmpty) {
                    return _buildEmptyState(context);
                  }
                  return ListView.builder(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    itemCount: hotels.length,
                    itemBuilder: (context, index) =>
                        _HotelCard(hotel: hotels[index]),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.xl),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.hotel_outlined,
                      size: 64, color: AppColors.textSecondary),
                  const SizedBox(height: AppSpacing.md),
                  Text(
                    'No hotels assigned',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    'Contact your administrator.',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
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

// ---------------------------------------------------------------------------
// Sync badge icon button
// ---------------------------------------------------------------------------

class _SyncBadgeButton extends StatelessWidget {
  const _SyncBadgeButton({required this.syncCount});

  final AsyncValue<int> syncCount;

  @override
  Widget build(BuildContext context) {
    final count = syncCount.when(
      data: (v) => v,
      loading: () => 0,
      error: (_, _) => 0,
    );

    return IconButton(
      onPressed: () => context.push('/agent/pending-sync'),
      icon: Badge(
        isLabelVisible: count > 0,
        label: Text(count.toString()),
        backgroundColor: AppColors.pendingYellow,
        textColor: Colors.black,
        child: const Icon(Icons.sync),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Offline banner
// ---------------------------------------------------------------------------

class _OfflineBanner extends StatelessWidget {
  const _OfflineBanner({required this.connectivity});

  final AsyncValue<InternetStatus> connectivity;

  @override
  Widget build(BuildContext context) {
    final isOffline = connectivity.whenOrNull(
          data: (status) => status == InternetStatus.disconnected,
        ) ??
        false;

    if (!isOffline) return const SizedBox.shrink();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      color: AppColors.offlineRed,
      child: Row(
        children: [
          const Icon(Icons.wifi_off, color: Colors.white, size: 18),
          const SizedBox(width: AppSpacing.sm),
          Text(
            'You are offline. Changes will sync when connected.',
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Hotel card
// ---------------------------------------------------------------------------

class _HotelCard extends StatelessWidget {
  const _HotelCard({required this.hotel});

  final AgentHotel hotel;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
      ),
      elevation: 1,
      child: InkWell(
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
        onTap: () =>
            context.push('/agent/hotel/${hotel.hotelId}/departments'),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      hotel.name,
                      style:
                          Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                    ),
                  ),
                  if (hotel.pendingDeliveryCount > 0)
                    _PendingBadge(count: hotel.pendingDeliveryCount),
                ],
              ),
              const SizedBox(height: AppSpacing.md),
              Row(
                children: [
                  Expanded(
                    child: FilledButton.icon(
                      onPressed: () => context.push(
                        '/agent/challan/pickup/${hotel.hotelId}',
                      ),
                      icon: const Icon(Icons.add_circle_outline, size: 18),
                      label: const Text('New Pickup'),
                      style: FilledButton.styleFrom(
                        backgroundColor: AppColors.pickupBlue,
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: FilledButton.icon(
                      onPressed: () => context.push(
                        '/agent/pending-deliveries/${hotel.hotelId}',
                      ),
                      icon: const Icon(Icons.local_shipping_outlined,
                          size: 18),
                      label: const Text('Deliveries'),
                      style: FilledButton.styleFrom(
                        backgroundColor: AppColors.deliveryGreen,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Pending delivery count badge
// ---------------------------------------------------------------------------

class _PendingBadge extends StatelessWidget {
  const _PendingBadge({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.damageRed,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        '$count pending',
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Skeleton loading placeholder
// ---------------------------------------------------------------------------

class _HotelListSkeleton extends StatelessWidget {
  const _HotelListSkeleton();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(AppSpacing.md),
      itemCount: 3,
      itemBuilder: (context, index) => Card(
        margin: const EdgeInsets.only(bottom: AppSpacing.md),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _SkeletonBox(width: 180, height: 20),
              const SizedBox(height: AppSpacing.md),
              Row(
                children: [
                  Expanded(child: _SkeletonBox(height: 40)),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(child: _SkeletonBox(height: 40)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SkeletonBox extends StatelessWidget {
  const _SkeletonBox({this.width, required this.height});

  final double? width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.border.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(AppSpacing.chipRadius),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Error view with retry
// ---------------------------------------------------------------------------

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.xl),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline,
                      size: 48, color: AppColors.damageRed),
                  const SizedBox(height: AppSpacing.md),
                  Text(
                    'Something went wrong',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  FilledButton.icon(
                    onPressed: onRetry,
                    icon: const Icon(Icons.refresh),
                    label: const Text('Retry'),
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

// ---------------------------------------------------------------------------
// AgentHistoryScreen
// ---------------------------------------------------------------------------

class AgentHistoryScreen extends ConsumerWidget {
  const AgentHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hotelsAsync = ref.watch(agentHotelsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Challan History')),
      body: hotelsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => _ErrorView(
          message: error.toString(),
          onRetry: () => ref.invalidate(agentHotelsProvider),
        ),
        data: (hotels) {
          if (hotels.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.xl),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.history,
                        size: 48, color: AppColors.textSecondary),
                    const SizedBox(height: AppSpacing.md),
                    Text(
                      'No hotels assigned',
                      style:
                          Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: AppColors.textSecondary,
                              ),
                    ),
                  ],
                ),
              ),
            );
          }

          return ListView(
            padding: const EdgeInsets.all(AppSpacing.md),
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.md),
                child: Text(
                  'Select a hotel to view challan history',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                ),
              ),
              for (final hotel in hotels)
                Card(
                  margin: const EdgeInsets.only(bottom: AppSpacing.sm),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(AppSpacing.cardRadius),
                  ),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(AppSpacing.cardRadius),
                    ),
                    leading: CircleAvatar(
                      backgroundColor:
                          AppColors.primaryLight.withValues(alpha: 0.15),
                      child: const Icon(Icons.business,
                          color: AppColors.primaryLight),
                    ),
                    title: Text(hotel.name),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () =>
                        context.push('/agent/history/${hotel.hotelId}'),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// AgentSettingsScreen
// ---------------------------------------------------------------------------

class AgentSettingsScreen extends ConsumerWidget {
  const AgentSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
    final displayName =
        authState is Authenticated ? (authState).displayName : null;
    final email = authState is Authenticated ? (authState).email : null;
    final role = authState is Authenticated ? (authState).role : null;

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          // User info card
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
            ),
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 36,
                    backgroundColor:
                        AppColors.primary.withValues(alpha: 0.12),
                    child:
                        const Icon(Icons.person, size: 36, color: AppColors.primary),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Text(
                    displayName ?? 'Agent',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  if (email != null) ...[
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      email,
                      style:
                          Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: AppColors.textSecondary,
                              ),
                    ),
                  ],
                  const SizedBox(height: AppSpacing.sm),
                  Chip(
                    label: Text(
                      role?.name.toUpperCase() ?? 'AGENT',
                      style: const TextStyle(fontSize: 12),
                    ),
                    backgroundColor:
                        AppColors.accent.withValues(alpha: 0.12),
                    side: BorderSide.none,
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: AppSpacing.lg),

          // Sign out
          FilledButton.tonalIcon(
            onPressed: () => _confirmSignOut(context, ref),
            icon: const Icon(Icons.logout),
            label: const Text('Sign Out'),
            style: FilledButton.styleFrom(
              minimumSize: const Size(double.infinity, 48),
            ),
          ),

          const SizedBox(height: AppSpacing.xl),

          // App version
          Center(
            child: Text(
              'LaundroTrack v1.0.0',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.textSecondary,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _confirmSignOut(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Sign Out'),
        content: const Text('Are you sure you want to sign out?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: const Text('Sign Out'),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      ref.read(authStateProvider.notifier).logout();
    }
  }
}
