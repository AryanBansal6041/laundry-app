import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/utils/formatters.dart';
import '../data/models/tracking_models.dart';
import '../providers/hotel_providers.dart';

class LiveInventoryScreen extends ConsumerStatefulWidget {
  const LiveInventoryScreen({super.key});

  @override
  ConsumerState<LiveInventoryScreen> createState() =>
      _LiveInventoryScreenState();
}

class _LiveInventoryScreenState extends ConsumerState<LiveInventoryScreen> {
  Timer? _autoRefreshTimer;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _autoRefreshTimer = Timer.periodic(const Duration(seconds: 30), (_) {
      ref.invalidate(liveTrackingProvider);
    });
  }

  @override
  void dispose() {
    _autoRefreshTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final trackingAsync = ref.watch(liveTrackingProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Inventory'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Refresh',
            onPressed: () => ref.invalidate(liveTrackingProvider),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
                AppSpacing.md, AppSpacing.sm, AppSpacing.md, 0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search items...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppSpacing.inputRadius),
                ),
                isDense: true,
              ),
              onChanged: (value) => setState(() => _searchQuery = value),
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                ref.invalidate(liveTrackingProvider);
                await Future.delayed(const Duration(milliseconds: 300));
              },
              child: trackingAsync.when(
                loading: () =>
                    const Center(child: CircularProgressIndicator()),
                error: (e, _) => _ErrorView(
                  onRetry: () => ref.invalidate(liveTrackingProvider),
                ),
                data: (tracking) {
                  if (tracking == null) {
                    return _ErrorView(
                      onRetry: () => ref.invalidate(liveTrackingProvider),
                    );
                  }
                  if (tracking.departments.isEmpty) {
                    return const _EmptyView();
                  }
                  return _DepartmentList(
                    departments: tracking.departments,
                    searchQuery: _searchQuery,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DepartmentList extends StatelessWidget {
  const _DepartmentList({
    required this.departments,
    required this.searchQuery,
  });

  final List<TrackingDepartment> departments;
  final String searchQuery;

  @override
  Widget build(BuildContext context) {
    final query = searchQuery.toLowerCase();
    final filtered = departments
        .map((dept) {
          final items = query.isEmpty
              ? dept.items
              : dept.items
                  .where((i) => i.itemName.toLowerCase().contains(query))
                  .toList();
          return (dept: dept, items: items);
        })
        .where((d) => d.items.isNotEmpty)
        .toList();

    if (filtered.isEmpty) {
      return Center(
        child: Text(
          'No items match "$searchQuery"',
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: AppColors.textSecondary),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(AppSpacing.md),
      itemCount: filtered.length,
      itemBuilder: (context, index) {
        final entry = filtered[index];
        return _DepartmentExpansionTile(
          department: entry.dept,
          filteredItems: entry.items,
        );
      },
    );
  }
}

class _DepartmentExpansionTile extends StatelessWidget {
  const _DepartmentExpansionTile({
    required this.department,
    required this.filteredItems,
  });

  final TrackingDepartment department;
  final List<TrackingItem> filteredItems;

  @override
  Widget build(BuildContext context) {
    final totalQty =
        filteredItems.fold<int>(0, (s, i) => s + i.qtyInLaundry);
    final totalDamage =
        filteredItems.fold<int>(0, (s, i) => s + i.totalDamagedByLaundry);

    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
      ),
      child: ExpansionTile(
        initiallyExpanded: true,
        leading: Container(
          padding: const EdgeInsets.all(AppSpacing.sm),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(AppSpacing.sm),
          ),
          child: const Icon(Icons.category, color: AppColors.primary, size: 20),
        ),
        title: Text(
          department.deptName,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          '${Formatters.weight(department.totalWeightKg)} · $totalQty items · $totalDamage damaged',
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: AppColors.textSecondary),
        ),
        children: filteredItems
            .map((item) => _ItemTile(item: item))
            .toList(),
      ),
    );
  }
}

class _ItemTile extends StatelessWidget {
  const _ItemTile({required this.item});

  final TrackingItem item;

  @override
  Widget build(BuildContext context) {
    final damageColor = _damageColor(item.totalDamagedByLaundry);

    return ListTile(
      dense: true,
      title: Text(item.itemName),
      subtitle: Text(
        Formatters.weight(item.weightKg),
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(color: AppColors.textSecondary),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${item.qtyInLaundry}',
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                'in laundry',
                style: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(color: AppColors.textSecondary),
              ),
            ],
          ),
          const SizedBox(width: AppSpacing.md),
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: damageColor,
            ),
          ),
          const SizedBox(width: AppSpacing.xs),
          SizedBox(
            width: 40,
            child: Text(
              '${item.totalDamagedByLaundry}',
              style: TextStyle(
                color: damageColor,
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _damageColor(int damaged) {
    if (damaged == 0) return AppColors.damageGreen;
    if (damaged < 5) return AppColors.damageYellow;
    return AppColors.damageRed;
  }
}

class _EmptyView extends StatelessWidget {
  const _EmptyView();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 100),
        Center(
          child: Column(
            children: [
              Icon(Icons.inventory_2_outlined,
                  size: 64, color: AppColors.textSecondary),
              const SizedBox(height: AppSpacing.md),
              Text(
                'No items in laundry',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: AppColors.textSecondary),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                'Items will appear here once pickup challans are created',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: AppColors.textSecondary),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 100),
        Center(
          child: Column(
            children: [
              const Icon(Icons.error_outline,
                  size: 48, color: AppColors.damageRed),
              const SizedBox(height: AppSpacing.md),
              Text('Failed to load inventory',
                  style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: AppSpacing.sm),
              FilledButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: const Text('Retry'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
