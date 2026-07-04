import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/enums.dart';
import '../../../core/network/api_result.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../setup/data/models/setup_models.dart';
import '../providers/admin_providers.dart';

class AdminHotelDetailScreen extends ConsumerWidget {
  const AdminHotelDetailScreen({super.key, required this.hotelId});
  final String hotelId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hotelsAsync = ref.watch(hotelsListProvider);
    final schemaAsync = ref.watch(adminFormSchemaProvider(hotelId));
    final mappingsAsync = ref.watch(mappingsListProvider);

    final hotel = hotelsAsync.whenOrNull(
      data: (hotels) => hotels.where((h) => h.id == hotelId).firstOrNull,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(hotel?.name ?? 'Hotel Detail'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/admin/hotels');
            }
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          if (hotel != null)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(hotel.name,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    if (hotel.address != null) ...[
                      const SizedBox(height: AppSpacing.xs),
                      Row(children: [
                        const Icon(Icons.location_on, size: 16, color: AppColors.textSecondary),
                        const SizedBox(width: 4),
                        Text(hotel.address!, style: Theme.of(context).textTheme.bodyMedium),
                      ]),
                    ],
                    if (hotel.contactNumber != null) ...[
                      const SizedBox(height: AppSpacing.xs),
                      Row(children: [
                        const Icon(Icons.phone, size: 16, color: AppColors.textSecondary),
                        const SizedBox(width: 4),
                        Text(hotel.contactNumber!, style: Theme.of(context).textTheme.bodyMedium),
                      ]),
                    ],
                  ],
                ),
              ),
            ),
          if (hotel == null && hotelsAsync.isLoading)
            const Padding(
              padding: EdgeInsets.only(bottom: AppSpacing.md),
              child: LinearProgressIndicator(minHeight: 2),
            ),
          if (hotel == null && !hotelsAsync.isLoading)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Text(
                  'Hotel details are not available yet. Please refresh hotels list and try again.',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: AppColors.textSecondary),
                ),
              ),
            ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            'Departments',
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: AppSpacing.xs),
          Align(
            alignment: Alignment.centerRight,
            child: FilledButton.icon(
              onPressed: () => _showAddDepartmentDialog(context, ref),
              icon: const Icon(Icons.add, size: 18),
              label: const Text('Add'),
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          schemaAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (_, _) => const Text('Failed to load departments'),
            data: (schema) {
              if (schema == null || schema.departments.isEmpty) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(AppSpacing.lg),
                    child: Center(
                      child: Text('No departments configured',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary)),
                    ),
                  ),
                );
              }
              return Column(
                children: schema.departments
                    .map(
                      (dept) => _DepartmentCard(
                        dept: dept,
                        onLinkItem: () =>
                            _showLinkItemDialog(context, ref, dept),
                      ),
                    )
                    .toList(),
              );
            },
          ),
          const SizedBox(height: AppSpacing.lg),
          Text('Assigned Agents',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
          const SizedBox(height: AppSpacing.sm),
          mappingsAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (_, _) => const Text('Failed to load mappings'),
            data: (mappings) {
              final hotelMappings = mappings.where((m) => m.hotelId == hotelId).toList();
              if (hotelMappings.isEmpty) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(AppSpacing.lg),
                    child: Center(
                      child: Text('No agents assigned',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary)),
                    ),
                  ),
                );
              }
              return Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: hotelMappings
                      .map((m) => ListTile(
                            leading: CircleAvatar(
                              backgroundColor: AppColors.accent.withValues(alpha: 0.1),
                              child: const Icon(Icons.person, color: AppColors.accent),
                            ),
                            title: Text(m.agentName ?? m.agentEmail ?? 'Unknown'),
                            subtitle: m.agentEmail != null ? Text(m.agentEmail!) : null,
                          ))
                      .toList(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _showAddDepartmentDialog(BuildContext context, WidgetRef ref) {
    final nameCtrl = TextEditingController();
    final priceCtrl = TextEditingController();
    final formKey = GlobalKey<FormState>();
    BillingType billingType = BillingType.weight;
    WeightSource weightSource = WeightSource.soiled;

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setState) => AlertDialog(
          title: const Text('Add Department'),
          content: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: nameCtrl,
                  decoration: const InputDecoration(labelText: 'Name *'),
                  validator: (v) => (v == null || v.trim().isEmpty) ? 'Required' : null,
                ),
                const SizedBox(height: AppSpacing.sm),
                DropdownButtonFormField<BillingType>(
                  initialValue: billingType,
                  decoration: const InputDecoration(labelText: 'Billing Type'),
                  items: BillingType.values
                      .map((b) => DropdownMenuItem(value: b, child: Text(b.toJson())))
                      .toList(),
                  onChanged: (v) => setState(() => billingType = v!),
                ),
                if (billingType == BillingType.weight) ...[
                  const SizedBox(height: AppSpacing.sm),
                  TextFormField(
                    controller: priceCtrl,
                    decoration: const InputDecoration(labelText: 'Price per kg'),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  DropdownButtonFormField<WeightSource>(
                    initialValue: weightSource,
                    decoration: const InputDecoration(labelText: 'Weight Source'),
                    items: WeightSource.values
                        .map((w) => DropdownMenuItem(value: w, child: Text(w.toJson())))
                        .toList(),
                    onChanged: (v) => setState(() => weightSource = v!),
                  ),
                ],
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () async {
                HapticFeedback.mediumImpact();
                if (!formKey.currentState!.validate()) return;
                final request = DepartmentCreateRequest(
                  name: nameCtrl.text.trim(),
                  billingType: billingType,
                  pricePerKg: billingType == BillingType.weight && priceCtrl.text.isNotEmpty
                      ? double.tryParse(priceCtrl.text)
                      : null,
                  weightSource: billingType == BillingType.weight ? weightSource : null,
                );
                final result = await ref.read(setupRepositoryProvider).createDepartment(hotelId, request);
                if (!ctx.mounted) return;
                Navigator.of(ctx).pop();
                switch (result) {
                  case Success():
                    ref.invalidate(adminFormSchemaProvider(hotelId));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Department created')),
                    );
                  case Failure(exception: final e):
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(e.message)),
                    );
                }
              },
              child: const Text('Create'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showLinkItemDialog(
    BuildContext context,
    WidgetRef ref,
    FormSchemaDepartment dept,
  ) async {
    List<ItemResponse> allItems = const [];
    try {
      allItems = await ref.read(itemsListProvider.future);
    } catch (_) {
      allItems = const [];
    }
    if (!context.mounted) return;

    final linkedItemIds = dept.items.map((e) => e.itemId).toSet();
    final availableItems =
        allItems.where((item) => !linkedItemIds.contains(item.id)).toList();

    if (availableItems.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No unlinked items available for this department')),
      );
      return;
    }

    final formKey = GlobalKey<FormState>();
    String? selectedItemId;
    final valueCtrl = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setState) => AlertDialog(
          title: Text('Link Item to ${dept.name}'),
          content: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButtonFormField<String>(
                  initialValue: selectedItemId,
                  decoration: const InputDecoration(labelText: 'Item *'),
                  validator: (v) => (v == null || v.isEmpty) ? 'Required' : null,
                  items: availableItems
                      .map((item) => DropdownMenuItem(
                            value: item.id,
                            child: Text(item.name),
                          ))
                      .toList(),
                  onChanged: (v) => setState(() => selectedItemId = v),
                ),
                const SizedBox(height: AppSpacing.sm),
                TextFormField(
                  controller: valueCtrl,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    labelText: dept.billingType == BillingType.piece
                        ? 'Price per piece *'
                        : 'Calculated weight per piece (kg) *',
                  ),
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) return 'Required';
                    if (double.tryParse(v.trim()) == null) return 'Enter a valid number';
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () async {
                HapticFeedback.mediumImpact();
                if (!formKey.currentState!.validate()) return;
                final parsed = double.parse(valueCtrl.text.trim());
                final request = DeptItemLinkRequest(
                  itemId: selectedItemId!,
                  pricePerPiece:
                      dept.billingType == BillingType.piece ? parsed : null,
                  calculatedWeight:
                      dept.billingType == BillingType.weight ? parsed : null,
                );
                final result = await ref
                    .read(setupRepositoryProvider)
                    .linkItemToDept(dept.deptId, request);
                if (!ctx.mounted) return;
                Navigator.of(ctx).pop();
                switch (result) {
                  case Success():
                    ref.invalidate(adminFormSchemaProvider(hotelId));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Item linked to department')),
                    );
                  case Failure(exception: final e):
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(e.message)),
                    );
                }
              },
              child: const Text('Link'),
            ),
          ],
        ),
      ),
    );
  }
}

class _DepartmentCard extends StatelessWidget {
  const _DepartmentCard({
    required this.dept,
    required this.onLinkItem,
  });
  final FormSchemaDepartment dept;
  final VoidCallback onLinkItem;

  @override
  Widget build(BuildContext context) {
    final isWeight = dept.billingType == BillingType.weight;
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: ExpansionTile(
        leading: Icon(
          isWeight ? Icons.scale : Icons.grid_view,
          color: isWeight ? AppColors.weightChip : AppColors.pieceChip,
        ),
        title: Text(dept.name, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(
          isWeight
              ? '${dept.billingType.toJson()} · ₹${dept.pricePerKg ?? '-'}/kg · ${dept.weightSource?.toJson() ?? '-'}'
              : dept.billingType.toJson(),
          style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textSecondary),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.md,
              AppSpacing.xs,
              AppSpacing.md,
              AppSpacing.xs,
            ),
            child: Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                onPressed: onLinkItem,
                icon: const Icon(Icons.add_link, size: 16),
                label: const Text('Link Item'),
              ),
            ),
          ),
          ...dept.items.isEmpty
              ? [
                Padding(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  child: Text('No items linked',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textSecondary)),
                )
              ]
              : dept.items
                  .map((item) => ListTile(
                        dense: true,
                        title: Text(item.name),
                        trailing: Text(
                          isWeight
                              ? '${item.calculatedWeight ?? '-'} kg/pc'
                              : '₹${item.pricePerPiece ?? '-'}/pc',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ))
                  .toList(),
        ],
      ),
    );
  }
}
