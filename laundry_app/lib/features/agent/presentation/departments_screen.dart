import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/enums.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../providers/agent_providers.dart';

class AgentDepartmentsScreen extends ConsumerWidget {
  const AgentDepartmentsScreen({super.key, required this.hotelId});

  final String hotelId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final schemaAsync = ref.watch(formSchemaProvider(hotelId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Departments'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.invalidate(formSchemaProvider(hotelId)),
          ),
        ],
      ),
      body: schemaAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) =>
            const Center(child: Text('Failed to load departments')),
        data: (schema) {
          if (schema == null || schema.departments.isEmpty) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(AppSpacing.lg),
                child: Text('No departments configured for this hotel'),
              ),
            );
          }
          return ListView(
            padding: const EdgeInsets.all(AppSpacing.md),
            children: [
              FilledButton.icon(
                onPressed: () => context.push('/agent/challan/pickup/$hotelId'),
                icon: const Icon(Icons.add_circle_outline, size: 18),
                label: const Text('New Pickup'),
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.pickupBlue,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              FilledButton.icon(
                onPressed: () =>
                    context.push('/agent/challan/delivery/$hotelId'),
                icon: const Icon(Icons.local_shipping_outlined, size: 18),
                label: const Text('New Delivery'),
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.deliveryGreen,
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              ...schema.departments.map(
                (dept) => Card(
                  margin: const EdgeInsets.only(bottom: AppSpacing.sm),
                  child: ListTile(
                    leading: Icon(
                      dept.billingType == BillingType.weight
                          ? Icons.scale
                          : Icons.grid_view,
                      color: dept.billingType == BillingType.weight
                          ? AppColors.weightChip
                          : AppColors.pieceChip,
                    ),
                    title: Text(dept.name),
                    subtitle: Text(
                      '${dept.billingType.toJson()} · ${dept.items.length} items',
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
