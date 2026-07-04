import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../auth/providers/auth_providers.dart';

class _AdminDestination {
  const _AdminDestination({
    required this.label,
    required this.icon,
    required this.activeIcon,
    required this.route,
  });

  final String label;
  final IconData icon;
  final IconData activeIcon;
  final String route;
}

const _destinations = [
  _AdminDestination(
    label: 'Dashboard',
    icon: Icons.dashboard_outlined,
    activeIcon: Icons.dashboard,
    route: '/admin/dashboard',
  ),
  _AdminDestination(
    label: 'Hotels',
    icon: Icons.business_outlined,
    activeIcon: Icons.business,
    route: '/admin/hotels',
  ),
  _AdminDestination(
    label: 'Items',
    icon: Icons.category_outlined,
    activeIcon: Icons.category,
    route: '/admin/items',
  ),
  _AdminDestination(
    label: 'Users',
    icon: Icons.people_outlined,
    activeIcon: Icons.people,
    route: '/admin/users',
  ),
  _AdminDestination(
    label: 'Mappings',
    icon: Icons.link_outlined,
    activeIcon: Icons.link,
    route: '/admin/agents',
  ),
  _AdminDestination(
    label: 'Quality',
    icon: Icons.verified_outlined,
    activeIcon: Icons.verified,
    route: '/admin/quality',
  ),
  _AdminDestination(
    label: 'Billing',
    icon: Icons.receipt_long_outlined,
    activeIcon: Icons.receipt_long,
    route: '/admin/reports',
  ),
];

const _mobileTabCount = 4;

class AdminShell extends ConsumerWidget {
  const AdminShell({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = _calculateSelectedIndex(context);
    final width = MediaQuery.sizeOf(context).width;
    final isExtended = width > 1200;

    if (width >= 600) {
      return Scaffold(
        body: Row(
          children: [
            NavigationRail(
              selectedIndex: currentIndex,
              onDestinationSelected: (index) {
                context.go(_destinations[index].route);
              },
              extended: isExtended,
              leading: Padding(
                padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
                child: Column(
                  children: [
                    Icon(Icons.local_laundry_service,
                        color: AppColors.primary, size: 32),
                    if (isExtended) ...[
                      const SizedBox(height: 4),
                      Text(
                        'LaundroTrack',
                        style:
                            Theme.of(context).textTheme.labelSmall?.copyWith(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w700,
                                ),
                      ),
                    ],
                  ],
                ),
              ),
              trailing: Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.md),
                    child: IconButton(
                      icon: const Icon(Icons.logout),
                      tooltip: 'Sign Out',
                      onPressed: () =>
                          ref.read(authStateProvider.notifier).logout(),
                    ),
                  ),
                ),
              ),
              destinations: _destinations
                  .map((d) => NavigationRailDestination(
                        icon: Icon(d.icon),
                        selectedIcon: Icon(d.activeIcon),
                        label: Text(d.label),
                      ))
                  .toList(),
            ),
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(child: child),
          ],
        ),
      );
    }

    final isOnMore = currentIndex >= _mobileTabCount;
    final mobileIndex = isOnMore ? _mobileTabCount : currentIndex;

    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: mobileIndex,
        onTap: (index) {
          if (index < _mobileTabCount) {
            context.go(_destinations[index].route);
          } else {
            context.go('/admin/more');
          }
        },
        items: [
          ..._destinations.take(_mobileTabCount).map(
                (d) => BottomNavigationBarItem(
                  icon: Icon(d.icon),
                  activeIcon: Icon(d.activeIcon),
                  label: d.label,
                ),
              ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz_outlined),
            activeIcon: Icon(Icons.more_horiz),
            label: 'More',
          ),
        ],
      ),
    );
  }

  int _calculateSelectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    if (location.startsWith('/admin/hotels')) return 1;
    if (location.startsWith('/admin/items')) return 2;
    if (location.startsWith('/admin/users')) return 3;
    if (location.startsWith('/admin/agents')) return 4;
    if (location.startsWith('/admin/quality')) return 5;
    if (location.startsWith('/admin/reports')) return 6;
    if (location.startsWith('/admin/more')) return _mobileTabCount;
    return 0;
  }
}

// ---------------------------------------------------------------------------
// "More" screen — overflow destinations + profile + sign out
// ---------------------------------------------------------------------------

class AdminMoreScreen extends ConsumerWidget {
  const AdminMoreScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
    final displayName =
        authState is Authenticated ? authState.displayName : null;
    final email = authState is Authenticated ? authState.email : null;

    final overflowDestinations = _destinations.skip(_mobileTabCount).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('More')),
      body: ListView(
        children: [
          // Profile card
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
              ),
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor:
                          AppColors.primary.withValues(alpha: 0.12),
                      child: const Icon(Icons.person,
                          size: 28, color: AppColors.primary),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            displayName ?? 'Super Admin',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                          if (email != null)
                            Text(
                              email,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: AppColors.textSecondary),
                            ),
                          const SizedBox(height: 4),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: AppColors.primary.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              'SUPER ADMIN',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Overflow navigation items
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            child: Text('NAVIGATION',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textSecondary,
                  letterSpacing: 1,
                )),
          ),
          const SizedBox(height: AppSpacing.xs),
          for (final dest in overflowDestinations)
            ListTile(
              leading: Icon(dest.icon, color: AppColors.primary),
              title: Text(dest.label),
              trailing: const Icon(Icons.chevron_right, size: 20),
              onTap: () => context.go(dest.route),
            ),

          const Divider(height: 32),

          // App info + sign out
          ListTile(
            leading: const Icon(Icons.info_outline, color: AppColors.textSecondary),
            title: const Text('LaundroTrack v1.0.0'),
            dense: true,
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Sign Out',
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600)),
            onTap: () => _confirmSignOut(context, ref),
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
    if (confirmed == true && context.mounted) {
      ref.read(authStateProvider.notifier).logout();
    }
  }
}
