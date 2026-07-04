import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/utils/formatters.dart';
import '../../agent/providers/agent_providers.dart';
import '../../challans/data/models/challan_models.dart';
import '../providers/admin_providers.dart';

class AdminChallanDetailScreen extends ConsumerWidget {
  const AdminChallanDetailScreen({
    super.key,
    required this.challanId,
    this.challan,
  });

  final String challanId;
  final ChallanResponse? challan;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = challan;

    return Scaffold(
      appBar: AppBar(
        title: Text(c?.challanNumber ?? 'Challan Detail'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/admin/dashboard');
            }
          },
        ),
      ),
      body: Builder(builder: (context) {
        if (c == null) {
          final challanAsync = ref.watch(challanByIdProvider(challanId));
          return challanAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (_, _) => Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.error_outline, size: 48, color: AppColors.damageRed),
                  const SizedBox(height: AppSpacing.md),
                  Text('Failed to load challan',
                      style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: AppSpacing.sm),
                  FilledButton.tonal(
                    onPressed: () => ref.invalidate(challanByIdProvider(challanId)),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
            data: (fetched) {
              if (fetched == null) {
                return const Center(child: Text('Challan not found'));
              }
              return _buildChallanBody(context, ref, fetched);
            },
          );
        }

        return _buildChallanBody(context, ref, c);
      }),
    );
  }

  Widget _buildChallanBody(BuildContext context, WidgetRef ref, ChallanResponse c) {
          final isPickup = c.challanType == 'PICKUP';
          final color = isPickup ? AppColors.pickupBlue : AppColors.deliveryGreen;
          final schemaAsync = ref.watch(adminFormSchemaProvider(c.hotelId));
          final deptNames = <String, String>{};
          final itemNames = <String, String>{};

          schemaAsync.whenOrNull(data: (schema) {
            if (schema != null) {
              for (final dept in schema.departments) {
                deptNames[dept.deptId] = dept.name;
                for (final item in dept.items) {
                  itemNames[item.itemId] = item.name;
                }
              }
            }
          });

          return ListView(
            padding: const EdgeInsets.all(AppSpacing.md),
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppSpacing.sm, vertical: 4),
                            decoration: BoxDecoration(
                              color: color.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(AppSpacing.chipRadius),
                            ),
                            child: Text(c.challanType,
                                style: TextStyle(color: color, fontWeight: FontWeight.w600)),
                          ),
                          const SizedBox(width: AppSpacing.sm),
                          Text(c.challanNumber,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      Text(Formatters.dateTime(c.entryTimestamp)),
                      if (c.lastEditedAt != null)
                        Text('Edited: ${Formatters.dateTime(c.lastEditedAt!)}',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textSecondary)),
                      const SizedBox(height: AppSpacing.sm),
                      Text('Super admin can edit anytime',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: AppColors.accent,
                                fontStyle: FontStyle.italic,
                              )),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              ...c.departments.map((dept) {
                final name = deptNames[dept.deptId] ?? dept.deptId;
                return Card(
                  margin: const EdgeInsets.only(bottom: AppSpacing.sm),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                            AppSpacing.md, AppSpacing.md, AppSpacing.md, 0),
                        child: Text(name,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(fontWeight: FontWeight.w600)),
                      ),
                      if (dept.soiledWeight != null)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                          child: Text('Soiled: ${dept.soiledWeight} kg',
                              style: Theme.of(context).textTheme.bodySmall),
                        ),
                      if (dept.freshWeight != null)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                          child: Text('Fresh: ${dept.freshWeight} kg',
                              style: Theme.of(context).textTheme.bodySmall),
                        ),
                      DataTable(
                        columnSpacing: AppSpacing.md,
                        columns: const [
                          DataColumn(label: Text('Item')),
                          DataColumn(label: Text('Qty'), numeric: true),
                          DataColumn(label: Text('Damaged'), numeric: true),
                        ],
                        rows: dept.items
                            .map((item) => DataRow(cells: [
                                  DataCell(Text(itemNames[item.itemId] ?? item.itemId)),
                                  DataCell(Text('${item.qty}')),
                                  DataCell(Text(
                                    '${item.damagedQty}',
                                    style: item.damagedQty > 0
                                        ? const TextStyle(color: AppColors.damageRed, fontWeight: FontWeight.bold)
                                        : null,
                                  )),
                                ]))
                            .toList(),
                      ),
                    ],
                  ),
                );
              }),
            ],
          );
  }
}
