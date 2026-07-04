import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/storage/app_database.dart';
import '../../../core/theme/app_spacing.dart';
import '../providers/agent_providers.dart';

final pendingSyncListProvider = FutureProvider<List<PendingChallan>>((
  ref,
) async {
  final service = ref.watch(pendingChallanServiceProvider);
  return service.getAll();
});

class PendingSyncScreen extends ConsumerWidget {
  const PendingSyncScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listAsync = ref.watch(pendingSyncListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pending Sync'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.invalidate(pendingSyncListProvider),
          ),
        ],
      ),
      body: listAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) =>
            const Center(child: Text('Failed to load pending sync items')),
        data: (items) {
          if (items.isEmpty) {
            return const Center(child: Text('No pending items'));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(AppSpacing.md),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              String challanNumber = '-';
              try {
                final map =
                    jsonDecode(item.payloadJson) as Map<String, dynamic>;
                challanNumber = (map['challan_number'] as String?) ?? '-';
              } catch (_) {}

              return Card(
                margin: const EdgeInsets.only(bottom: AppSpacing.sm),
                child: ListTile(
                  title: Text('$challanNumber (${item.challanType})'),
                  subtitle: Text(
                    'Status: ${item.status} • Retry: ${item.retryCount}'
                    '${item.errorMessage == null ? '' : '\n${item.errorMessage}'}',
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
