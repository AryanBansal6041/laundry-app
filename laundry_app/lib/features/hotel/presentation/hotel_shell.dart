import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/utils/responsive_builder.dart';
import '../../auth/providers/auth_providers.dart';

class _TabDef {
  const _TabDef({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.path,
  });

  final IconData icon;
  final IconData activeIcon;
  final String label;
  final String path;
}

const _tabs = [
  _TabDef(
    icon: Icons.dashboard_outlined,
    activeIcon: Icons.dashboard,
    label: 'Dashboard',
    path: '/hotel/dashboard',
  ),
  _TabDef(
    icon: Icons.inventory_2_outlined,
    activeIcon: Icons.inventory_2,
    label: 'Inventory',
    path: '/hotel/inventory',
  ),
  _TabDef(
    icon: Icons.receipt_long_outlined,
    activeIcon: Icons.receipt_long,
    label: 'Challans',
    path: '/hotel/challans',
  ),
  _TabDef(
    icon: Icons.receipt_outlined,
    activeIcon: Icons.receipt,
    label: 'Billing',
    path: '/hotel/billing',
  ),
  _TabDef(
    icon: Icons.warning_amber_outlined,
    activeIcon: Icons.warning_amber,
    label: 'Quality',
    path: '/hotel/quality',
  ),
];

const _mobileTabCount = 4;

class HotelShell extends ConsumerWidget {
  const HotelShell({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = _calculateSelectedIndex(context);

    return ResponsiveBuilder(
      mobile: _buildMobile(context, ref, currentIndex),
      tablet: Scaffold(
        body: Row(
          children: [
            NavigationRail(
              selectedIndex: currentIndex,
              onDestinationSelected: (index) =>
                  context.go(_tabs[index].path),
              labelType: NavigationRailLabelType.all,
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
              destinations: _tabs
                  .map((t) => NavigationRailDestination(
                        icon: Icon(t.icon),
                        selectedIcon: Icon(t.activeIcon),
                        label: Text(t.label),
                      ))
                  .toList(),
            ),
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(child: child),
          ],
        ),
      ),
      desktop: Scaffold(
        body: Row(
          children: [
            Container(
              width: AppSpacing.sidebarWidth,
              color: AppColors.primary,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    child: Text(
                      'LaundroTrack',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  const Divider(color: Colors.white24),
                  ...List.generate(_tabs.length, (index) {
                    final tab = _tabs[index];
                    final isSelected = index == currentIndex;
                    return ListTile(
                      leading: Icon(
                        isSelected ? tab.activeIcon : tab.icon,
                        color: isSelected ? Colors.white : Colors.white70,
                      ),
                      title: Text(
                        tab.label,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.white70,
                          fontWeight:
                              isSelected ? FontWeight.w600 : FontWeight.normal,
                        ),
                      ),
                      selected: isSelected,
                      selectedTileColor: Colors.white.withValues(alpha: 0.1),
                      onTap: () => context.go(tab.path),
                    );
                  }),
                  const Spacer(),
                  const Divider(color: Colors.white24),
                  ListTile(
                    leading: const Icon(Icons.logout, color: Colors.white70),
                    title: const Text('Sign Out',
                        style: TextStyle(color: Colors.white70)),
                    onTap: () =>
                        ref.read(authStateProvider.notifier).logout(),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                ],
              ),
            ),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }

  Widget _buildMobile(BuildContext context, WidgetRef ref, int currentIndex) {
    final isOnMore = currentIndex >= _mobileTabCount;
    final mobileIndex = isOnMore ? _mobileTabCount : currentIndex;

    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: mobileIndex,
        onTap: (index) {
          if (index < _mobileTabCount) {
            context.go(_tabs[index].path);
          } else {
            context.go('/hotel/more');
          }
        },
        items: [
          ..._tabs.take(_mobileTabCount).map(
                (t) => BottomNavigationBarItem(
                  icon: Icon(t.icon),
                  activeIcon: Icon(t.activeIcon),
                  label: t.label,
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
    if (location.startsWith('/hotel/inventory')) return 1;
    if (location.startsWith('/hotel/challans')) return 2;
    if (location.startsWith('/hotel/billing')) return 3;
    if (location.startsWith('/hotel/quality')) return 4;
    if (location.startsWith('/hotel/more')) return _mobileTabCount;
    return 0;
  }
}

// ---------------------------------------------------------------------------
// "More" screen — overflow destinations + profile + sign out
// ---------------------------------------------------------------------------

class HotelMoreScreen extends ConsumerWidget {
  const HotelMoreScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
    final displayName =
        authState is Authenticated ? authState.displayName : null;
    final email = authState is Authenticated ? authState.email : null;

    final overflowDestinations = _tabs.skip(_mobileTabCount).toList();

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
                          AppColors.accent.withValues(alpha: 0.12),
                      child: const Icon(Icons.person,
                          size: 28, color: AppColors.accent),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            displayName ?? 'Hotel Admin',
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
                              color: AppColors.accent.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              'HOTEL ADMIN',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(
                                    color: AppColors.accent,
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
          if (overflowDestinations.isNotEmpty) ...[
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
            for (final tab in overflowDestinations)
              ListTile(
                leading: Icon(tab.icon, color: AppColors.accent),
                title: Text(tab.label),
                trailing: const Icon(Icons.chevron_right, size: 20),
                onTap: () => context.go(tab.path),
              ),
            const Divider(height: 32),
          ],

          // App info + sign out
          ListTile(
            leading:
                const Icon(Icons.info_outline, color: AppColors.textSecondary),
            title: const Text('LaundroTrack v1.0.0'),
            dense: true,
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Sign Out',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.w600)),
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
