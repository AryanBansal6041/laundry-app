import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/utils/formatters.dart';
import '../../challans/data/models/challan_models.dart';
import '../../setup/data/models/setup_models.dart';
import '../providers/agent_providers.dart';

class ChallanDetailScreen extends ConsumerWidget {
  const ChallanDetailScreen({
    super.key,
    required this.challanId,
    required this.hotelId,
    this.challan,
  });

  final String challanId;
  final String hotelId;

  /// Passed via GoRouter extra to avoid re-fetching.
  final ChallanResponse? challan;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final schemaAsync = ref.watch(formSchemaProvider(hotelId));
    final schema = switch (schemaAsync) {
      AsyncData(:final value) => value,
      _ => null,
    };

    if (challan != null) {
      return _buildContent(context, ref, challan!, schema);
    }

    final challanAsync = ref.watch(challanByIdProvider(challanId));

    return challanAsync.when(
      loading: () => Scaffold(
        appBar: AppBar(title: const Text('Challan Detail')),
        body: const Center(child: CircularProgressIndicator()),
      ),
      error: (err, _) => Scaffold(
        appBar: AppBar(title: const Text('Challan Detail')),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, size: 48, color: AppColors.damageRed),
              const SizedBox(height: 12),
              Text('Failed to load challan', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              FilledButton.tonal(
                onPressed: () => ref.invalidate(challanByIdProvider(challanId)),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
      data: (fetched) {
        if (fetched == null) {
          return Scaffold(
            appBar: AppBar(title: const Text('Challan Detail')),
            body: const Center(child: Text('Challan not found')),
          );
        }
        return _buildContent(context, ref, fetched, schema);
      },
    );
  }

  Widget _buildContent(
    BuildContext context,
    WidgetRef ref,
    ChallanResponse challan,
    FormSchemaResponse? schema,
  ) {
    final isPickup = challan.challanType == 'PICKUP';
    final badgeColor = isPickup ? AppColors.pickupBlue : AppColors.deliveryGreen;
    final canEdit = _isWithin24Hours(challan.entryTimestamp);

    final deptLookup = _buildDeptLookup(schema);
    final itemLookup = _buildItemLookup(schema);

    final grandTotal = challan.departments.fold<int>(
      0,
      (sum, dept) => sum + dept.items.fold<int>(0, (s, i) => s + i.qty),
    );
    final grandDamaged = challan.departments.fold<int>(
      0,
      (sum, dept) => sum + dept.items.fold<int>(0, (s, i) => s + i.damagedQty),
    );

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Challan #${challan.challanNumber}'),
            const SizedBox(width: 8),
            _TypeBadge(type: challan.challanType, color: badgeColor),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _HeaderCard(challan: challan, badgeColor: badgeColor),
          const SizedBox(height: 16),

          // Department sections
          for (final dept in challan.departments) ...[
            _DepartmentSection(
              dept: dept,
              isPickup: isPickup,
              deptName: deptLookup[dept.deptId] ?? dept.deptId,
              itemLookup: itemLookup,
            ),
            const SizedBox(height: 12),
          ],

          // Grand total
          Card(
            color: AppColors.primary.withAlpha(20),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Text(
                    'Grand Total',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        Formatters.pieces(grandTotal),
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      if (grandDamaged > 0)
                        Text(
                          '$grandDamaged damaged',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: AppColors.damageRed,
                              ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Edit button
          if (canEdit)
            FilledButton.icon(
              onPressed: () => context.push(
                '/agent/challan/$challanId/edit',
                extra: {'challan': challan, 'hotelId': hotelId},
              ),
              icon: const Icon(Icons.edit),
              label: const Text('Edit Challan'),
            )
          else
            Tooltip(
              message: 'Can only edit within 24 hours of creation',
              child: FilledButton.icon(
                onPressed: null,
                icon: const Icon(Icons.edit_off),
                label: Text(Formatters.editCountdown(challan.entryTimestamp)),
              ),
            ),
        ],
      ),
    );
  }

  bool _isWithin24Hours(DateTime entryTimestamp) {
    return DateTime.now().difference(entryTimestamp).inHours < 24;
  }

  Map<String, String> _buildDeptLookup(FormSchemaResponse? schema) {
    if (schema == null) return {};
    return {for (final d in schema.departments) d.deptId: d.name};
  }

  Map<String, String> _buildItemLookup(FormSchemaResponse? schema) {
    if (schema == null) return {};
    final map = <String, String>{};
    for (final dept in schema.departments) {
      for (final item in dept.items) {
        map[item.itemId] = item.name;
      }
    }
    return map;
  }
}

// ---------------------------------------------------------------------------
// Sub-widgets
// ---------------------------------------------------------------------------

class _TypeBadge extends StatelessWidget {
  const _TypeBadge({required this.type, required this.color});

  final String type;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color.withAlpha(30),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: color.withAlpha(80)),
      ),
      child: Text(
        type,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}

class _HeaderCard extends StatelessWidget {
  const _HeaderCard({required this.challan, required this.badgeColor});

  final ChallanResponse challan;
  final Color badgeColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  challan.challanType == 'PICKUP'
                      ? Icons.upload_rounded
                      : Icons.download_rounded,
                  color: badgeColor,
                ),
                const SizedBox(width: 8),
                Text(
                  challan.challanType == 'PICKUP' ? 'Pickup' : 'Delivery',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: badgeColor,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _InfoRow(label: 'Hotel ID', value: challan.hotelId),
            _InfoRow(
              label: 'Timestamp',
              value: Formatters.dateTime(challan.entryTimestamp),
            ),
            _InfoRow(label: 'Agent ID', value: challan.agentId),
            if (challan.lastEditedAt != null) ...[
              const SizedBox(height: 8),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: AppColors.pendingYellow.withAlpha(40),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'Edited',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: AppColors.pendingYellow,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    Formatters.dateTime(challan.lastEditedAt!),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                  ),
                ],
              ),
              if (challan.editedBy != null)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    'by ${challan.editedBy}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                  ),
                ),
            ],
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.textSecondary,
                  ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}

class _DepartmentSection extends StatelessWidget {
  const _DepartmentSection({
    required this.dept,
    required this.isPickup,
    required this.deptName,
    required this.itemLookup,
  });

  final ChallanDeptResponse dept;
  final bool isPickup;
  final String deptName;
  final Map<String, String> itemLookup;

  @override
  Widget build(BuildContext context) {
    final deptTotal = dept.items.fold<int>(0, (s, i) => s + i.qty);
    final deptDamaged = dept.items.fold<int>(0, (s, i) => s + i.damagedQty);

    return Card(
      clipBehavior: Clip.antiAlias,
      child: ExpansionTile(
        initiallyExpanded: true,
        tilePadding: const EdgeInsets.symmetric(horizontal: 16),
        title: Text(
          deptName,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        subtitle: Row(
          children: [
            Text(
              '${Formatters.pieces(deptTotal)}${deptDamaged > 0 ? ' · $deptDamaged damaged' : ''}',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: deptDamaged > 0
                        ? AppColors.damageRed
                        : AppColors.textSecondary,
                  ),
            ),
          ],
        ),
        children: [
          if (isPickup && dept.soiledWeight != null)
            _WeightRow(
              label: 'Soiled Weight',
              value: dept.soiledWeight!,
              color: AppColors.soiledChip,
            ),
          if (!isPickup && dept.freshWeight != null)
            _WeightRow(
              label: 'Fresh Weight',
              value: dept.freshWeight!,
              color: AppColors.freshChip,
            ),
          const Divider(height: 1),
          // Item table header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text('Item',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: AppColors.textSecondary,
                          )),
                ),
                Expanded(
                  child: Text('Qty',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: AppColors.textSecondary,
                          )),
                ),
                Expanded(
                  child: Text('Dmg',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: AppColors.textSecondary,
                          )),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          for (final item in dept.items)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      itemLookup[item.itemId] ?? item.itemId,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '${item.qty}',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '${item.damagedQty}',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: item.damagedQty > 0
                                ? AppColors.damageRed
                                : null,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class _WeightRow extends StatelessWidget {
  const _WeightRow({
    required this.label,
    required this.value,
    required this.color,
  });

  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Row(
        children: [
          Icon(Icons.scale, size: 16, color: color),
          const SizedBox(width: 6),
          Text(label, style: Theme.of(context).textTheme.bodySmall),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: color.withAlpha(25),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              '$value kg',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: color,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
