import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/utils/formatters.dart';
import '../../challans/data/models/challan_models.dart';
import '../../setup/data/models/setup_models.dart';
import '../providers/agent_providers.dart';

class ChallanHistoryScreen extends ConsumerStatefulWidget {
  const ChallanHistoryScreen({super.key, required this.hotelId});

  final String hotelId;

  @override
  ConsumerState<ChallanHistoryScreen> createState() =>
      _ChallanHistoryScreenState();
}

class _ChallanHistoryScreenState extends ConsumerState<ChallanHistoryScreen> {
  String? _selectedType; // null = All
  DateTimeRange? _dateRange;
  int _currentPage = 1;
  final List<ChallanResponse> _loadedItems = [];
  int _total = 0;
  static const _pageSize = 20;

  ChallanHistoryParams get _params => ChallanHistoryParams(
        hotelId: widget.hotelId,
        page: _currentPage,
        pageSize: _pageSize,
        challanType: _selectedType,
        startDate: _dateRange != null
            ? Formatters.isoDate(_dateRange!.start)
            : null,
        endDate:
            _dateRange != null ? Formatters.isoDate(_dateRange!.end) : null,
      );

  void _resetAndReload() {
    setState(() {
      _currentPage = 1;
      _loadedItems.clear();
    });
    ref.invalidate(challanHistoryProvider(_params));
  }

  @override
  Widget build(BuildContext context) {
    final historyAsync = ref.watch(challanHistoryProvider(_params));
    final schemaAsync = ref.watch(formSchemaProvider(widget.hotelId));
    final schema = switch (schemaAsync) {
      AsyncData(:final value) => value,
      _ => null,
    };

    return Scaffold(
      appBar: AppBar(title: const Text('Challan History')),
      body: Column(
        children: [
          _FilterBar(
            selectedType: _selectedType,
            dateRange: _dateRange,
            onTypeChanged: (type) {
              _selectedType = type;
              _resetAndReload();
            },
            onDateRangeChanged: (range) {
              _dateRange = range;
              _resetAndReload();
            },
          ),
          const Divider(height: 1),
          Expanded(
            child: historyAsync.when(
              loading: () {
                if (_loadedItems.isNotEmpty) {
                  return _buildList(context, schema);
                }
                return const Center(child: CircularProgressIndicator());
              },
              error: (err, _) {
                if (_loadedItems.isNotEmpty) {
                  return _buildList(context, schema);
                }
                return _ErrorView(
                  onRetry: () =>
                      ref.invalidate(challanHistoryProvider(_params)),
                );
              },
              data: (paginated) {
                _total = paginated.total;
                if (_currentPage == 1) {
                  _loadedItems.clear();
                }
                // Append new page items (avoid duplicates on rebuild)
                for (final item in paginated.items) {
                  if (!_loadedItems.any((c) => c.id == item.id)) {
                    _loadedItems.add(item);
                  }
                }

                if (_loadedItems.isEmpty) {
                  return _EmptyView(hasFilters: _selectedType != null || _dateRange != null);
                }

                return _buildList(context, schema);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildList(BuildContext context, FormSchemaResponse? schema) {
    final deptLookup = _buildDeptLookup(schema);
    final hasMore = _loadedItems.length < _total;

    return RefreshIndicator(
      onRefresh: () async {
        _currentPage = 1;
        _loadedItems.clear();
        ref.invalidate(challanHistoryProvider(_params));
        // Wait for rebuild
        await ref.read(challanHistoryProvider(_params).future);
      },
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        itemCount: _loadedItems.length + (hasMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == _loadedItems.length) {
            return _LoadMoreButton(
              onPressed: () {
                setState(() => _currentPage++);
              },
            );
          }

          final challan = _loadedItems[index];
          return _ChallanTile(
            challan: challan,
            deptLookup: deptLookup,
            onTap: () => context.push(
              '/agent/challan/${challan.id}?hotelId=${widget.hotelId}',
              extra: challan,
            ),
          );
        },
      ),
    );
  }

  Map<String, String> _buildDeptLookup(FormSchemaResponse? schema) {
    if (schema == null) return {};
    return {for (final d in schema.departments) d.deptId: d.name};
  }
}

// ---------------------------------------------------------------------------
// Filter bar
// ---------------------------------------------------------------------------

class _FilterBar extends StatelessWidget {
  const _FilterBar({
    required this.selectedType,
    required this.dateRange,
    required this.onTypeChanged,
    required this.onDateRangeChanged,
  });

  final String? selectedType;
  final DateTimeRange? dateRange;
  final ValueChanged<String?> onTypeChanged;
  final ValueChanged<DateTimeRange?> onDateRangeChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Type filter
          Wrap(
            spacing: 8,
            children: [
              ChoiceChip(
                label: const Text('All'),
                selected: selectedType == null,
                onSelected: (_) => onTypeChanged(null),
              ),
              ChoiceChip(
                label: const Text('Pickup'),
                selected: selectedType == 'PICKUP',
                selectedColor: AppColors.pickupBlue.withAlpha(40),
                onSelected: (_) => onTypeChanged(
                  selectedType == 'PICKUP' ? null : 'PICKUP',
                ),
              ),
              ChoiceChip(
                label: const Text('Delivery'),
                selected: selectedType == 'DELIVERY',
                selectedColor: AppColors.deliveryGreen.withAlpha(40),
                onSelected: (_) => onTypeChanged(
                  selectedType == 'DELIVERY' ? null : 'DELIVERY',
                ),
              ),
              ActionChip(
                avatar: Icon(
                  dateRange != null
                      ? Icons.date_range
                      : Icons.calendar_today_outlined,
                  size: 18,
                ),
                label: Text(
                  dateRange != null
                      ? '${Formatters.date(dateRange!.start)} – ${Formatters.date(dateRange!.end)}'
                      : 'Date Range',
                ),
                onPressed: () => _pickDateRange(context),
              ),
              if (dateRange != null)
                IconButton(
                  icon: const Icon(Icons.clear, size: 18),
                  visualDensity: VisualDensity.compact,
                  onPressed: () => onDateRangeChanged(null),
                  tooltip: 'Clear date range',
                ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _pickDateRange(BuildContext context) async {
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2024),
      lastDate: DateTime.now(),
      initialDateRange: dateRange,
    );
    if (picked != null) {
      onDateRangeChanged(picked);
    }
  }
}

// ---------------------------------------------------------------------------
// List tile
// ---------------------------------------------------------------------------

class _ChallanTile extends StatelessWidget {
  const _ChallanTile({
    required this.challan,
    required this.deptLookup,
    required this.onTap,
  });

  final ChallanResponse challan;
  final Map<String, String> deptLookup;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isPickup = challan.challanType == 'PICKUP';
    final badgeColor = isPickup ? AppColors.pickupBlue : AppColors.deliveryGreen;

    final totalItems = challan.departments.fold<int>(
      0,
      (sum, dept) => sum + dept.items.fold<int>(0, (s, i) => s + i.qty),
    );

    final deptNames = challan.departments
        .map((d) => deptLookup[d.deptId] ?? d.deptId)
        .join(', ');

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Container(
                width: 4,
                height: 48,
                decoration: BoxDecoration(
                  color: badgeColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          '#${challan.challanNumber}',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 1),
                          decoration: BoxDecoration(
                            color: badgeColor.withAlpha(25),
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: badgeColor.withAlpha(60)),
                          ),
                          child: Text(
                            challan.challanType,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(
                                  color: badgeColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10,
                                ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    if (deptNames.isNotEmpty)
                      Text(
                        deptNames,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppColors.textSecondary,
                            ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    Formatters.pieces(totalItems),
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    Formatters.durationSince(challan.entryTimestamp),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                  ),
                ],
              ),
              const SizedBox(width: 4),
              const Icon(Icons.chevron_right, color: AppColors.textSecondary),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Load more, Empty, Error
// ---------------------------------------------------------------------------

class _LoadMoreButton extends StatelessWidget {
  const _LoadMoreButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Center(
        child: OutlinedButton.icon(
          onPressed: onPressed,
          icon: const Icon(Icons.expand_more),
          label: const Text('Load More'),
        ),
      ),
    );
  }
}

class _EmptyView extends StatelessWidget {
  const _EmptyView({required this.hasFilters});

  final bool hasFilters;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.receipt_long_outlined,
              size: 64, color: AppColors.textSecondary.withAlpha(120)),
          const SizedBox(height: 12),
          Text(
            hasFilters ? 'No challans match the filters' : 'No challans yet',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.textSecondary,
                ),
          ),
          if (hasFilters)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                'Try adjusting the filters',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.textSecondary,
                    ),
              ),
            ),
        ],
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.error_outline, size: 48, color: AppColors.damageRed),
          const SizedBox(height: 12),
          Text('Failed to load history',
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          FilledButton.tonal(
            onPressed: onRetry,
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
