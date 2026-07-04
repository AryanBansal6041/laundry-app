import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/network/api_result.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/utils/formatters.dart';
import '../data/models/admin_models.dart';
import '../providers/admin_providers.dart';

class AdminHotelsScreen extends ConsumerWidget {
  const AdminHotelsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hotelsAsync = ref.watch(hotelsListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hotels'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.invalidate(hotelsListProvider),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddHotelDialog(context, ref),
        icon: const Icon(Icons.add),
        label: const Text('Add Hotel'),
      ),
      body: hotelsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, _) => const Center(child: Text('Failed to load hotels')),
        data: (hotels) {
          if (hotels.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.business_outlined, size: 64, color: AppColors.textSecondary),
                  const SizedBox(height: AppSpacing.sm),
                  Text('No hotels yet', style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary)),
                ],
              ),
            );
          }
          return SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('Name')),
                    DataColumn(label: Text('Address')),
                    DataColumn(label: Text('Contact')),
                    DataColumn(label: Text('Created')),
                    DataColumn(label: Text('Actions')),
                  ],
                  rows: hotels.map((h) => DataRow(cells: [
                    DataCell(Text(h.name, style: const TextStyle(fontWeight: FontWeight.w600))),
                    DataCell(Text(h.address ?? '-')),
                    DataCell(Text(h.contactNumber ?? '-')),
                    DataCell(Text(Formatters.date(h.createdAt))),
                    DataCell(Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, size: 18),
                          tooltip: 'Edit Hotel',
                          onPressed: () => _showEditHotelDialog(context, ref, h),
                        ),
                        IconButton(
                          icon: const Icon(Icons.open_in_new, size: 18),
                          tooltip: 'View Detail',
                          onPressed: () => context.push('/admin/hotels/${h.id}'),
                        ),
                      ],
                    )),
                  ])).toList(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showEditHotelDialog(BuildContext context, WidgetRef ref, HotelResponse hotel) {
    final nameCtrl = TextEditingController(text: hotel.name);
    final addressCtrl = TextEditingController(text: hotel.address ?? '');
    final contactCtrl = TextEditingController(text: hotel.contactNumber ?? '');
    final formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Edit Hotel'),
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
              TextFormField(
                controller: addressCtrl,
                decoration: const InputDecoration(labelText: 'Address'),
              ),
              const SizedBox(height: AppSpacing.sm),
              TextFormField(
                controller: contactCtrl,
                decoration: const InputDecoration(labelText: 'Contact Number'),
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
              final request = HotelUpdateRequest(
                name: nameCtrl.text.trim() != hotel.name ? nameCtrl.text.trim() : null,
                address: addressCtrl.text.trim() != (hotel.address ?? '')
                    ? (addressCtrl.text.trim().isNotEmpty ? addressCtrl.text.trim() : null)
                    : null,
                contactNumber: contactCtrl.text.trim() != (hotel.contactNumber ?? '')
                    ? (contactCtrl.text.trim().isNotEmpty ? contactCtrl.text.trim() : null)
                    : null,
              );
              final result = await ref.read(adminRepositoryProvider).updateHotel(hotel.id, request);
              if (!ctx.mounted) return;
              Navigator.of(ctx).pop();
              switch (result) {
                case Success():
                  ref.invalidate(hotelsListProvider);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Hotel updated')),
                  );
                case Failure(exception: final e):
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(e.message)),
                  );
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void _showAddHotelDialog(BuildContext context, WidgetRef ref) {
    final nameCtrl = TextEditingController();
    final addressCtrl = TextEditingController();
    final contactCtrl = TextEditingController();
    final formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Add Hotel'),
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
              TextFormField(
                controller: addressCtrl,
                decoration: const InputDecoration(labelText: 'Address'),
              ),
              const SizedBox(height: AppSpacing.sm),
              TextFormField(
                controller: contactCtrl,
                decoration: const InputDecoration(labelText: 'Contact Number'),
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
              final request = HotelCreateRequest(
                name: nameCtrl.text.trim(),
                address: addressCtrl.text.trim().isNotEmpty ? addressCtrl.text.trim() : null,
                contactNumber: contactCtrl.text.trim().isNotEmpty ? contactCtrl.text.trim() : null,
              );
              final result = await ref.read(adminRepositoryProvider).createHotel(request);
              if (!ctx.mounted) return;
              Navigator.of(ctx).pop();
              switch (result) {
                case Success():
                  ref.invalidate(hotelsListProvider);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Hotel created')),
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
    );
  }
}
