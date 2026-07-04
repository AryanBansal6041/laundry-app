import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/utils/formatters.dart';
import '../../auth/providers/auth_providers.dart';
import '../data/models/hotel_dashboard_models.dart';
import '../providers/hotel_providers.dart';

class HotelDashboardScreen extends ConsumerWidget {
  const HotelDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
    final displayName =
        authState is Authenticated ? authState.displayName : null;
    final dashboardAsync = ref.watch(hotelDashboardProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Sign out',
            onPressed: () => _confirmLogout(context, ref),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(hotelDashboardProvider);
          await Future.delayed(const Duration(milliseconds: 300));
        },
        child: dashboardAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (_, _) => ListView(
            children: const [
              SizedBox(height: 120),
              Center(child: Text('Failed to load dashboard')),
            ],
          ),
          data: (dashboard) {
            if (dashboard == null) {
              return ListView(
                children: const [
                  SizedBox(height: 120),
                  Center(child: Text('Failed to load dashboard')),
                ],
              );
            }
            return ListView(
              padding: const EdgeInsets.all(AppSpacing.md),
              children: [
                Text(
                  'Hello, ${displayName ?? 'Hotel Admin'}!',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: AppSpacing.lg),
                _StatCardsSection(dashboard: dashboard),
                const SizedBox(height: AppSpacing.lg),
                if (dashboard.pendingDeliveriesCount > 0) ...[
                  _PendingDeliveriesCard(
                      count: dashboard.pendingDeliveriesCount),
                  const SizedBox(height: AppSpacing.lg),
                ],
                _RecentChallansSection(
                    challans: dashboard.recentChallans),
              ],
            );
          },
        ),
      ),
    );
  }

  void _confirmLogout(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Sign out'),
        content: const Text('Are you sure you want to sign out?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              ref.read(authStateProvider.notifier).logout();
            },
            child: const Text('Sign out'),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Stat cards derived from aggregated dashboard
// ---------------------------------------------------------------------------

class _StatCardsSection extends StatelessWidget {
  const _StatCardsSection({required this.dashboard});

  final HotelDashboardResponse dashboard;

  @override
  Widget build(BuildContext context) {
    final tracking = dashboard.liveTracking;
    int totalDamage = 0;
    for (final dept in tracking.departments) {
      for (final item in dept.items) {
        totalDamage += item.totalDamagedByLaundry;
      }
    }

    return Wrap(
      spacing: AppSpacing.md,
      runSpacing: AppSpacing.md,
      children: [
        _StatCard(
          icon: Icons.scale,
          iconColor: AppColors.primary,
          label: 'Weight in Laundry',
          value: Formatters.weight(tracking.totalWeightInLaundryKg),
          isPrimary: true,
        ),
        _StatCard(
          icon: Icons.inventory_2,
          iconColor: AppColors.accent,
          label: 'Items in Laundry',
          value: Formatters.quantity(tracking.totalItemsInLaundry),
        ),
        _StatCard(
          icon: Icons.warning_amber,
          iconColor: AppColors.damageRed,
          label: 'Total Damage',
          value: Formatters.quantity(totalDamage),
        ),
        _StatCard(
          icon: Icons.category,
          iconColor: AppColors.pickupBlue,
          label: 'Departments',
          value: tracking.departments.length.toString(),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.value,
    this.isPrimary = false,
  });

  final IconData icon;
  final Color iconColor;
  final String label;
  final String value;
  final bool isPrimary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isPrimary ? double.infinity : 160,
      child: Card(
        elevation: isPrimary ? 2 : 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
          side: isPrimary
              ? BorderSide(
                  color: iconColor.withValues(alpha: 0.3), width: 1.5)
              : BorderSide.none,
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Row(
            mainAxisSize: isPrimary ? MainAxisSize.max : MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(AppSpacing.sm),
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(AppSpacing.sm),
                ),
                child:
                    Icon(icon, color: iconColor, size: isPrimary ? 28 : 22),
              ),
              const SizedBox(width: AppSpacing.md),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      value,
                      style: isPrimary
                          ? Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(fontWeight: FontWeight.bold)
                          : Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      label,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.textSecondary,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Pending deliveries card
// ---------------------------------------------------------------------------

class _PendingDeliveriesCard extends StatelessWidget {
  const _PendingDeliveriesCard({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.pendingYellow.withValues(alpha: 0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
        side: BorderSide(
            color: AppColors.pendingYellow.withValues(alpha: 0.4)),
      ),
      child: ListTile(
        leading: const Icon(Icons.pending_actions,
            color: AppColors.pendingYellow, size: 32),
        title: Text('$count Pending Deliveries'),
        subtitle: const Text('Pickup challans awaiting delivery'),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => context.go('/hotel/challans'),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Recent challans timeline (from dashboard response)
// ---------------------------------------------------------------------------

class _RecentChallansSection extends StatelessWidget {
  const _RecentChallansSection({required this.challans});

  final List<HotelDashboardRecentChallan> challans;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recent Challans',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            TextButton(
              onPressed: () => context.go('/hotel/challans'),
              child: const Text('View All'),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),
        if (challans.isEmpty)
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Center(
                child: Column(
                  children: [
                    Icon(Icons.receipt_long,
                        size: 48, color: AppColors.textSecondary),
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      'No challans yet',
                      style:
                          Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: AppColors.textSecondary,
                              ),
                    ),
                  ],
                ),
              ),
            ),
          )
        else
          ...challans.map(
              (challan) => _RecentChallanTile(challan: challan)),
      ],
    );
  }
}

class _RecentChallanTile extends StatelessWidget {
  const _RecentChallanTile({required this.challan});

  final HotelDashboardRecentChallan challan;

  @override
  Widget build(BuildContext context) {
    final isPickup = challan.challanType == 'PICKUP';
    final color = isPickup ? AppColors.pickupBlue : AppColors.deliveryGreen;

    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withValues(alpha: 0.1),
          child: Icon(
            isPickup ? Icons.upload : Icons.download,
            color: color,
            size: 20,
          ),
        ),
        title: Row(
          children: [
            Text(
              challan.challanNumber,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(width: AppSpacing.sm),
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.sm, vertical: 2),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(AppSpacing.chipRadius),
              ),
              child: Text(
                challan.challanType,
                style: TextStyle(
                    color: color, fontSize: 11, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        subtitle: Text(
          '${challan.agentName ?? 'Unknown'} · ${Formatters.durationSince(challan.entryTimestamp)}',
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: AppColors.textSecondary),
        ),
        trailing: const Icon(Icons.chevron_right, size: 18),
        onTap: () => context.push('/hotel/challan/${challan.challanId}'),
      ),
    );
  }
}
