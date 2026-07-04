import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/api_result.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/utils/formatters.dart';
import '../data/models/admin_models.dart';
import '../providers/admin_providers.dart';

class AdminMappingsScreen extends ConsumerWidget {
  const AdminMappingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mappingsAsync = ref.watch(mappingsListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Agent-Hotel Mappings'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.invalidate(mappingsListProvider),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddMappingDialog(context, ref),
        icon: const Icon(Icons.add_link),
        label: const Text('Assign Agent'),
      ),
      body: mappingsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, _) => const Center(child: Text('Failed to load mappings')),
        data: (mappings) {
          if (mappings.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.link_off, size: 64, color: AppColors.textSecondary),
                  const SizedBox(height: AppSpacing.sm),
                  Text('No agent-hotel mappings', style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary)),
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
                    DataColumn(label: Text('Agent Email')),
                    DataColumn(label: Text('Agent Name')),
                    DataColumn(label: Text('Hotel')),
                    DataColumn(label: Text('Created')),
                  ],
                  rows: mappings.map((m) => DataRow(cells: [
                    DataCell(Text(m.agentEmail ?? m.agentId)),
                    DataCell(Text(m.agentName ?? '-')),
                    DataCell(Text(m.hotelName ?? m.hotelId)),
                    DataCell(Text(Formatters.date(m.createdAt))),
                  ])).toList(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _showAddMappingDialog(BuildContext context, WidgetRef ref) async {
    final formKey = GlobalKey<FormState>();
    String? selectedAgentId;
    String? selectedHotelId;

    List<UserResponse> agents = const [];
    List<HotelResponse> hotels = const [];
    try {
      agents = await ref.read(usersListProvider('SERVICE_AGENT').future);
      hotels = await ref.read(hotelsListProvider.future);
    } catch (_) {
      agents = const [];
      hotels = const [];
    }
    if (!context.mounted) return;

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setState) => AlertDialog(
          title: const Text('Assign Agent to Hotel'),
          content: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButtonFormField<String>(
                  initialValue: selectedAgentId,
                  decoration: const InputDecoration(labelText: 'Agent *'),
                  validator: (v) => (v == null || v.isEmpty) ? 'Required' : null,
                  items: agents
                      .map((a) => DropdownMenuItem(
                            value: a.id,
                            child: Text(a.displayName ?? a.googleEmail),
                          ))
                      .toList(),
                  onChanged: (v) => setState(() => selectedAgentId = v),
                ),
                const SizedBox(height: AppSpacing.sm),
                DropdownButtonFormField<String>(
                  initialValue: selectedHotelId,
                  decoration: const InputDecoration(labelText: 'Hotel *'),
                  validator: (v) => (v == null || v.isEmpty) ? 'Required' : null,
                  items: hotels
                      .map((h) => DropdownMenuItem(value: h.id, child: Text(h.name)))
                      .toList(),
                  onChanged: (v) => setState(() => selectedHotelId = v),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.of(ctx).pop(), child: const Text('Cancel')),
            FilledButton(
              onPressed: () async {
                HapticFeedback.mediumImpact();
                if (!formKey.currentState!.validate()) return;
                if (agents.isEmpty || hotels.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Agents or hotels are not available yet. Refresh and try again.'),
                    ),
                  );
                  return;
                }
                final request = MappingCreateRequest(
                  agentId: selectedAgentId!,
                  hotelId: selectedHotelId!,
                );
                final result = await ref.read(adminRepositoryProvider).createMapping(request);
                if (!ctx.mounted) return;
                Navigator.of(ctx).pop();
                switch (result) {
                  case Success():
                    ref.invalidate(mappingsListProvider);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Agent assigned to hotel')));
                  case Failure(exception: final e):
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
                }
              },
              child: const Text('Assign'),
            ),
          ],
        ),
      ),
    );
  }
}
