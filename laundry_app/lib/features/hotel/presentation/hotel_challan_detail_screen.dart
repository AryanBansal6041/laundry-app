import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/utils/formatters.dart';
import '../../../core/network/api_result.dart';
import '../../agent/providers/agent_providers.dart';
import '../../auth/providers/auth_providers.dart';
import '../../challans/data/models/challan_models.dart';
import '../../setup/data/models/setup_models.dart';
import '../providers/hotel_providers.dart';

class HotelChallanDetailScreen extends ConsumerWidget {
  const HotelChallanDetailScreen({
    super.key,
    required this.challanId,
    this.challan,
  });

  final String challanId;
  final ChallanResponse? challan;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hotelId = ref.watch(hotelAdminHotelIdProvider);

    if (challan == null) {
      final challanAsync = ref.watch(challanByIdProvider(challanId));
      return challanAsync.when(
        loading: () => Scaffold(
          appBar: AppBar(title: const Text('Challan Detail')),
          body: const Center(child: CircularProgressIndicator()),
        ),
        error: (_, _) => Scaffold(
          appBar: AppBar(title: const Text('Challan Detail')),
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.error_outline,
                  size: 48,
                  color: AppColors.damageRed,
                ),
                const SizedBox(height: 12),
                Text(
                  'Failed to load challan',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                FilledButton.tonal(
                  onPressed: () =>
                      ref.invalidate(challanByIdProvider(challanId)),
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
          return _buildBody(context, ref, fetched, hotelId);
        },
      );
    }

    return _buildBody(context, ref, challan!, hotelId);
  }

  Widget _buildBody(
    BuildContext context,
    WidgetRef ref,
    ChallanResponse c,
    String hotelId,
  ) {
    final schemaAsync = ref.watch(_hotelFormSchemaProvider(hotelId));

    final isPickup = c.challanType == 'PICKUP';
    final color = isPickup ? AppColors.pickupBlue : AppColors.deliveryGreen;

    final canEdit = _canEdit(c);

    return Scaffold(
      appBar: AppBar(
        title: Text(c.challanNumber),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          // Header card
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
                          horizontal: AppSpacing.sm,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: color.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(
                            AppSpacing.chipRadius,
                          ),
                        ),
                        child: Text(
                          c.challanType,
                          style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      if (c.lastEditedAt != null) ...[
                        const SizedBox(width: AppSpacing.sm),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSpacing.sm,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.pendingYellow.withValues(
                              alpha: 0.1,
                            ),
                            borderRadius: BorderRadius.circular(
                              AppSpacing.chipRadius,
                            ),
                          ),
                          child: const Text(
                            'EDITED',
                            style: TextStyle(
                              color: AppColors.pendingYellow,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: AppSpacing.md),
                  _InfoRow(label: 'Challan Number', value: c.challanNumber),
                  _InfoRow(
                    label: 'Date',
                    value: Formatters.dateTime(c.entryTimestamp),
                  ),
                  _InfoRow(
                    label: 'Departments',
                    value: '${c.departments.length}',
                  ),
                  if (c.lastEditedAt != null)
                    _InfoRow(
                      label: 'Last Edited',
                      value: Formatters.dateTime(c.lastEditedAt!),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.md),

          // Department sections
          ...c.departments.map(
            (dept) => schemaAsync.when(
              loading: () => _DepartmentCard(
                dept: dept,
                isPickup: isPickup,
                deptName: dept.deptId,
                items: const {},
              ),
              error: (_, _) => _DepartmentCard(
                dept: dept,
                isPickup: isPickup,
                deptName: dept.deptId,
                items: const {},
              ),
              data: (schema) {
                var resolvedName = dept.deptId;
                final itemNames = <String, String>{};
                if (schema != null) {
                  for (final sd in schema.departments) {
                    if (sd.deptId == dept.deptId) {
                      resolvedName = sd.name;
                      for (final si in sd.items) {
                        itemNames[si.itemId] = si.name;
                      }
                      break;
                    }
                  }
                }
                return _DepartmentCard(
                  dept: dept,
                  isPickup: isPickup,
                  deptName: resolvedName,
                  items: itemNames,
                );
              },
            ),
          ),

          const SizedBox(height: AppSpacing.lg),

          // Edit button
          if (canEdit)
            FilledButton.icon(
              onPressed: () => context.push(
                '/hotel/challan/${c.id}/edit?hotelId=$hotelId',
                extra: c,
              ),
              icon: const Icon(Icons.edit),
              label: const Text('Edit Challan'),
            )
          else
            OutlinedButton.icon(
              onPressed: null,
              icon: const Icon(Icons.lock_clock),
              label: Text(Formatters.editCountdown(c.entryTimestamp)),
            ),
        ],
      ),
    );
  }

  bool _canEdit(ChallanResponse challan) {
    final elapsed = DateTime.now().difference(challan.entryTimestamp);
    return elapsed.inHours < 24;
  }
}

// Re-use form schema for name resolution
final _hotelFormSchemaProvider = FutureProvider.autoDispose
    .family<FormSchemaResponse?, String>((ref, hotelId) async {
      final dioClient = ref.watch(dioClientProvider);
      final result = await dioClient.get(
        '/api/v1/setup/hotels/$hotelId/form-schema',
        parser: (data) =>
            FormSchemaResponse.fromJson(data as Map<String, dynamic>),
      );
      return switch (result) {
        Success(data: final schema) => schema,
        Failure() => null,
      };
    });

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.xs),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 130,
            child: Text(
              label,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: AppColors.textSecondary),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}

class _DepartmentCard extends StatelessWidget {
  const _DepartmentCard({
    required this.dept,
    required this.isPickup,
    required this.deptName,
    required this.items,
  });

  final ChallanDeptResponse dept;
  final bool isPickup;
  final String deptName;
  final Map<String, String> items;

  @override
  Widget build(BuildContext context) {
    final totalPieces = dept.items.fold<int>(0, (s, i) => s + i.qty);
    final totalDamaged = dept.items.fold<int>(0, (s, i) => s + i.damagedQty);

    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: ExpansionTile(
        initiallyExpanded: true,
        title: Text(
          deptName,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          '$totalPieces pcs · $totalDamaged damaged',
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: AppColors.textSecondary),
        ),
        children: [
          if (dept.soiledWeight != null)
            _WeightInfoTile(label: 'Soiled Weight', weight: dept.soiledWeight!),
          if (dept.freshWeight != null)
            _WeightInfoTile(label: 'Fresh Weight', weight: dept.freshWeight!),
          const Divider(height: 1),
          // Items table
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Table(
              columnWidths: const {
                0: FlexColumnWidth(3),
                1: FlexColumnWidth(1),
                2: FlexColumnWidth(1.2),
              },
              children: [
                TableRow(
                  children: [
                    Text(
                      'Item',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Qty',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Damaged',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                ...dept.items.map(
                  (item) => TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(items[item.itemId] ?? item.itemId),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text('${item.qty}', textAlign: TextAlign.center),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          '${item.damagedQty}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: item.damagedQty > 0
                                ? AppColors.damageRed
                                : null,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _WeightInfoTile extends StatelessWidget {
  const _WeightInfoTile({required this.label, required this.weight});

  final String label;
  final String weight;

  @override
  Widget build(BuildContext context) {
    final kg = double.tryParse(weight) ?? 0;
    return ListTile(
      dense: true,
      leading: const Icon(Icons.scale, size: 18),
      title: Text(label),
      trailing: Text(
        Formatters.weight(kg),
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }
}
