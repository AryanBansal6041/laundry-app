import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/api_result.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/utils/formatters.dart';
import '../../setup/data/models/setup_models.dart';
import '../providers/admin_providers.dart';

class AdminItemsScreen extends ConsumerWidget {
  const AdminItemsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemsAsync = ref.watch(itemsListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Items Master'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.invalidate(itemsListProvider),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddItemDialog(context, ref),
        icon: const Icon(Icons.add),
        label: const Text('Add Item'),
      ),
      body: itemsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, _) => const Center(child: Text('Failed to load items')),
        data: (items) {
          if (items.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.category_outlined, size: 64, color: AppColors.textSecondary),
                  const SizedBox(height: AppSpacing.sm),
                  Text('No items yet', style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary)),
                ],
              ),
            );
          }
          return SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('Created')),
                ],
                rows: items.map((item) => DataRow(cells: [
                  DataCell(Text(item.name, style: const TextStyle(fontWeight: FontWeight.w600))),
                  DataCell(Text(Formatters.date(item.createdAt))),
                ])).toList(),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showAddItemDialog(BuildContext context, WidgetRef ref) {
    final nameCtrl = TextEditingController();
    final formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Add Item'),
        content: Form(
          key: formKey,
          child: TextFormField(
            controller: nameCtrl,
            decoration: const InputDecoration(labelText: 'Item name *'),
            validator: (v) => (v == null || v.trim().isEmpty) ? 'Required' : null,
            autofocus: true,
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(ctx).pop(), child: const Text('Cancel')),
          FilledButton(
            onPressed: () async {
              HapticFeedback.mediumImpact();
              if (!formKey.currentState!.validate()) return;
              final request = ItemCreateRequest(name: nameCtrl.text.trim());
              final result = await ref.read(setupRepositoryProvider).createItem(request);
              if (!ctx.mounted) return;
              Navigator.of(ctx).pop();
              switch (result) {
                case Success():
                  ref.invalidate(itemsListProvider);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Item created')));
                case Failure(exception: final e):
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
              }
            },
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }
}
