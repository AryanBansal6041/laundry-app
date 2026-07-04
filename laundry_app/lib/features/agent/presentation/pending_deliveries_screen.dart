import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/utils/formatters.dart';
import '../../challans/data/models/challan_models.dart';
import '../../setup/data/models/setup_models.dart';
import '../providers/agent_providers.dart';

class PendingDeliveriesScreen extends ConsumerWidget {
  const PendingDeliveriesScreen({super.key, required this.hotelId});

  final String hotelId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pendingAsync = ref.watch(pendingDeliveriesProvider(hotelId));
    final schemaAsync = ref.watch(formSchemaProvider(hotelId));
    final schema = switch (schemaAsync) {
      AsyncData(:final value) => value,
      _ => null,
    };
    final deptLookup = _buildDeptLookup(schema);

    return Scaffold(
      appBar: AppBar(title: const Text('Pending Deliveries')),
      body: pendingAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => _ErrorView(
          onRetry: () =>
              ref.invalidate(pendingDeliveriesProvider(hotelId)),
        ),
        data: (challans) {
          if (challans.isEmpty) {
            return const _EmptyView();
          }
          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(pendingDeliveriesProvider(hotelId));
              await ref.read(pendingDeliveriesProvider(hotelId).future);
            },
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: challans.length,
              itemBuilder: (context, index) {
                final challan = challans[index];
                return _PendingChallanCard(
                  challan: challan,
                  hotelId: hotelId,
                  deptLookup: deptLookup,
                );
              },
            ),
          );
        },
      ),
    );
  }

  Map<String, String> _buildDeptLookup(FormSchemaResponse? schema) {
    if (schema == null) return {};
    return {for (final d in schema.departments) d.deptId: d.name};
  }
}

// ---------------------------------------------------------------------------
// Card for each pending pickup
// ---------------------------------------------------------------------------

class _PendingChallanCard extends StatelessWidget {
  const _PendingChallanCard({
    required this.challan,
    required this.hotelId,
    required this.deptLookup,
  });

  final ChallanResponse challan;
  final String hotelId;
  final Map<String, String> deptLookup;

  @override
  Widget build(BuildContext context) {
    final totalItems = challan.departments.fold<int>(
      0,
      (sum, dept) => sum + dept.items.fold<int>(0, (s, i) => s + i.qty),
    );

    final deptNames = challan.departments
        .map((d) => deptLookup[d.deptId] ?? d.deptId)
        .join(', ');

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header row: challan number + timestamp
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: AppColors.pickupBlue.withAlpha(25),
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: AppColors.pickupBlue.withAlpha(60)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.upload_rounded,
                          size: 14, color: AppColors.pickupBlue),
                      const SizedBox(width: 4),
                      Text(
                        '#${challan.challanNumber}',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: AppColors.pickupBlue,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Text(
                  Formatters.durationSince(challan.entryTimestamp),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Departments + total
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (deptNames.isNotEmpty)
                        Text(
                          deptNames,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: AppColors.textPrimary,
                                  ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      const SizedBox(height: 2),
                      Text(
                        Formatters.dateTime(challan.entryTimestamp),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppColors.textSecondary,
                            ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.pieceChip.withAlpha(20),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Text(
                        '$totalItems',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.pieceChip,
                            ),
                      ),
                      Text(
                        'items',
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: AppColors.pieceChip,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Action buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => context.push(
                      '/agent/challan/${challan.id}?hotelId=$hotelId',
                      extra: challan,
                    ),
                    icon: const Icon(Icons.visibility_outlined, size: 18),
                    label: const Text('View'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FilledButton.icon(
                    onPressed: () => context.push(
                      '/agent/challan/delivery/$hotelId?cn=${Uri.encodeComponent(challan.challanNumber)}',
                    ),
                    icon: const Icon(Icons.download_rounded, size: 18),
                    label: const Text('Deliver All'),
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
    );
  }
}

// ---------------------------------------------------------------------------
// Empty & Error states
// ---------------------------------------------------------------------------

class _EmptyView extends StatelessWidget {
  const _EmptyView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.check_circle_outline,
                size: 72, color: AppColors.deliveryGreen.withAlpha(160)),
            const SizedBox(height: 16),
            Text(
              'No pending deliveries!',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 6),
            Text(
              'All pickups have been delivered.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondary,
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.error_outline, size: 48, color: AppColors.damageRed),
          const SizedBox(height: 12),
          Text('Failed to load pending deliveries',
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          FilledButton.tonal(
            onPressed: onRetry,
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
