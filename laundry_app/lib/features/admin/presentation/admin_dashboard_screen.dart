import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/utils/formatters.dart';
import '../../auth/providers/auth_providers.dart';
import '../data/models/dashboard_models.dart';
import '../providers/admin_providers.dart';

class AdminDashboardScreen extends ConsumerWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
    final displayName =
        authState is Authenticated ? authState.displayName : null;
    final dashboardAsync = ref.watch(superAdminDashboardProvider);
    final damageAsync = ref.watch(
      adminDamageReportProvider(const AdminDamageParams(minDamage: 1)),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Super Admin Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Refresh',
            onPressed: () {
              ref.invalidate(superAdminDashboardProvider);
              ref.invalidate(adminDamageReportProvider);
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(superAdminDashboardProvider);
          ref.invalidate(adminDamageReportProvider);
          await Future.delayed(const Duration(milliseconds: 300));
        },
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.md),
          children: [
            Text(
              'Hello, ${displayName ?? 'Admin'}!',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: AppSpacing.lg),
            dashboardAsync.when(
              loading: () =>
                  const SizedBox(height: 100, child: Center(child: CircularProgressIndicator())),
              error: (_, _) => _ErrorCard(message: 'Failed to load dashboard'),
              data: (dashboard) {
                if (dashboard == null) {
                  return _ErrorCard(message: 'Failed to load dashboard');
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _StatCards(dashboard: dashboard),
                    const SizedBox(height: AppSpacing.lg),
                    _RecentChallansTable(challans: dashboard.recentChallans),
                  ],
                );
              },
            ),
            const SizedBox(height: AppSpacing.lg),
            damageAsync.when(
              loading: () => const SizedBox.shrink(),
              error: (_, _) => const SizedBox.shrink(),
              data: (report) {
                if (report == null ||
                    report.allTimeTotals.isEmpty) {
                  return const SizedBox.shrink();
                }
                return _DamageRedFlags(report: report);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _StatCards extends StatelessWidget {
  const _StatCards({required this.dashboard});
  final SuperAdminDashboardResponse dashboard;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSpacing.md,
      runSpacing: AppSpacing.md,
      children: [
        _StatCard(
          icon: Icons.scale,
          iconColor: AppColors.primary,
          label: 'Total Weight in Laundry',
          value: Formatters.weight(dashboard.totalWeightInLaundryKg),
          isPrimary: true,
        ),
        _StatCard(
          icon: Icons.inventory_2,
          iconColor: AppColors.accent,
          label: 'Items in Laundry',
          value: Formatters.quantity(dashboard.totalItemsInLaundry),
        ),
        _StatCard(
          icon: Icons.business,
          iconColor: AppColors.pickupBlue,
          label: 'Hotels',
          value: dashboard.totalHotels.toString(),
        ),
        _StatCard(
          icon: Icons.receipt_long,
          iconColor: AppColors.deliveryGreen,
          label: 'Recent Challans',
          value: dashboard.recentChallans.length.toString(),
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
      width: isPrimary ? double.infinity : 180,
      child: Card(
        elevation: isPrimary ? 2 : 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
          side: isPrimary
              ? BorderSide(color: iconColor.withValues(alpha: 0.3), width: 1.5)
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
                child: Icon(icon, color: iconColor, size: isPrimary ? 28 : 22),
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

class _RecentChallansTable extends StatelessWidget {
  const _RecentChallansTable({required this.challans});
  final List<SuperAdminRecentChallan> challans;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recent Challans',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: AppSpacing.sm),
        if (challans.isEmpty)
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Center(
                child: Text('No challans yet',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: AppColors.textSecondary)),
              ),
            ),
          )
        else
          Card(
            clipBehavior: Clip.antiAlias,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Time')),
                  DataColumn(label: Text('Challan #')),
                  DataColumn(label: Text('Hotel')),
                  DataColumn(label: Text('Agent')),
                  DataColumn(label: Text('Type')),
                ],
                rows: challans
                    .map((c) => DataRow(
                          onSelectChanged: (_) =>
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('${c.challanNumber} — view from hotel detail page'),
                                  duration: const Duration(seconds: 2),
                                ),
                              ),
                          cells: [
                            DataCell(Text(Formatters.durationSince(c.entryTimestamp))),
                            DataCell(Text(c.challanNumber,
                                style: const TextStyle(fontWeight: FontWeight.w600))),
                            DataCell(Text(c.hotelName ?? '-')),
                            DataCell(Text(c.agentName ?? '-')),
                            DataCell(_TypeBadge(type: c.challanType)),
                          ],
                        ))
                    .toList(),
              ),
            ),
          ),
      ],
    );
  }
}

class _TypeBadge extends StatelessWidget {
  const _TypeBadge({required this.type});
  final String type;

  @override
  Widget build(BuildContext context) {
    final isPickup = type == 'PICKUP';
    final color = isPickup ? AppColors.pickupBlue : AppColors.deliveryGreen;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppSpacing.chipRadius),
      ),
      child: Text(
        type,
        style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class _DamageRedFlags extends StatelessWidget {
  const _DamageRedFlags({required this.report});
  final dynamic report;

  @override
  Widget build(BuildContext context) {
    final totals = (report as dynamic).allTimeTotals as List<dynamic>;
    if (totals.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.warning_amber, color: AppColors.damageRed, size: 20),
            const SizedBox(width: AppSpacing.xs),
            Text(
              'Damage Red Flags',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),
        Card(
          clipBehavior: Clip.antiAlias,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: const [
                DataColumn(label: Text('Hotel')),
                DataColumn(label: Text('Item')),
                DataColumn(label: Text('Damaged'), numeric: true),
              ],
              rows: totals
                  .map((item) {
                    final damaged = (item as dynamic).totalDamagedByLaundry as int;
                    final isHigh = damaged > 5;
                    return DataRow(
                      color: isHigh
                          ? WidgetStateProperty.all(
                              AppColors.damageRed.withValues(alpha: 0.05))
                          : null,
                      cells: [
                        DataCell(Text((item as dynamic).hotelName as String? ?? '-')),
                        DataCell(Text((item as dynamic).itemName as String)),
                        DataCell(Text(
                          '$damaged',
                          style: TextStyle(
                            color: isHigh ? AppColors.damageRed : null,
                            fontWeight: isHigh ? FontWeight.bold : null,
                          ),
                        )),
                      ],
                    );
                  })
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}

class _ErrorCard extends StatelessWidget {
  const _ErrorCard({required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Row(
          children: [
            const Icon(Icons.error_outline, color: AppColors.damageRed),
            const SizedBox(width: AppSpacing.sm),
            Text(message),
          ],
        ),
      ),
    );
  }
}
