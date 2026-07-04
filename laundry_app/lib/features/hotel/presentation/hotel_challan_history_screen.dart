import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/utils/formatters.dart';
import '../../challans/data/models/challan_models.dart';
import '../providers/hotel_providers.dart';

class HotelChallanHistoryScreen extends ConsumerStatefulWidget {
  const HotelChallanHistoryScreen({super.key});

  @override
  ConsumerState<HotelChallanHistoryScreen> createState() =>
      _HotelChallanHistoryScreenState();
}

class _HotelChallanHistoryScreenState
    extends ConsumerState<HotelChallanHistoryScreen> {
  String? _selectedType;
  DateTimeRange? _dateRange;
  int _currentPage = 1;
  final List<ChallanResponse> _allChallans = [];
  int _totalCount = 0;
  bool _hasMore = false;

  HotelChallanHistoryParams get _params => HotelChallanHistoryParams(
        page: _currentPage,
        challanType: _selectedType,
        startDate:
            _dateRange != null ? Formatters.isoDate(_dateRange!.start) : null,
        endDate:
            _dateRange != null ? Formatters.isoDate(_dateRange!.end) : null,
      );

  void _resetAndRefresh() {
    setState(() {
      _currentPage = 1;
      _allChallans.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final historyAsync = ref.watch(hotelChallanHistoryProvider(_params));

    return Scaffold(
      appBar: AppBar(title: const Text('Challan History')),
      body: Column(
        children: [
          _FilterBar(
            selectedType: _selectedType,
            dateRange: _dateRange,
            onTypeChanged: (type) {
              setState(() => _selectedType = type);
              _resetAndRefresh();
            },
            onDateRangeChanged: (range) {
              setState(() => _dateRange = range);
              _resetAndRefresh();
            },
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                _resetAndRefresh();
                ref.invalidate(hotelChallanHistoryProvider(_params));
                await Future.delayed(const Duration(milliseconds: 300));
              },
              child: historyAsync.when(
                loading: () => _allChallans.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : _buildList(),
                error: (_, _) => _allChallans.isEmpty
                    ? const Center(child: Text('Failed to load challans'))
                    : _buildList(),
                data: (response) {
                  if (_currentPage == 1) {
                    _allChallans.clear();
                  }
                  final existingIds = _allChallans.map((c) => c.id).toSet();
                  for (final c in response.items) {
                    if (!existingIds.contains(c.id)) {
                      _allChallans.add(c);
                    }
                  }
                  _totalCount = response.total;
                  _hasMore = _allChallans.length < _totalCount;
                  return _buildList();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildList() {
    if (_allChallans.isEmpty) {
      return ListView(
        children: [
          const SizedBox(height: 100),
          Center(
            child: Column(
              children: [
                Icon(Icons.receipt_long,
                    size: 64, color: AppColors.textSecondary),
                const SizedBox(height: AppSpacing.md),
                Text(
                  'No challans found',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: AppColors.textSecondary),
                ),
              ],
            ),
          ),
        ],
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(AppSpacing.md),
      itemCount: _allChallans.length + (_hasMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == _allChallans.length) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: OutlinedButton(
                onPressed: () {
                  setState(() => _currentPage++);
                },
                child: const Text('Load More'),
              ),
            ),
          );
        }
        return _ChallanTile(
          challan: _allChallans[index],
          routePrefix: '/hotel',
        );
      },
    );
  }
}

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
      padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md, vertical: AppSpacing.sm),
      child: Row(
        children: [
          ChoiceChip(
            label: const Text('All'),
            selected: selectedType == null,
            onSelected: (_) => onTypeChanged(null),
          ),
          const SizedBox(width: AppSpacing.sm),
          ChoiceChip(
            label: const Text('Pickup'),
            selected: selectedType == 'PICKUP',
            onSelected: (_) =>
                onTypeChanged(selectedType == 'PICKUP' ? null : 'PICKUP'),
            selectedColor: AppColors.pickupBlue.withValues(alpha: 0.2),
          ),
          const SizedBox(width: AppSpacing.sm),
          ChoiceChip(
            label: const Text('Delivery'),
            selected: selectedType == 'DELIVERY',
            onSelected: (_) =>
                onTypeChanged(selectedType == 'DELIVERY' ? null : 'DELIVERY'),
            selectedColor: AppColors.deliveryGreen.withValues(alpha: 0.2),
          ),
          const Spacer(),
          IconButton(
            icon: Icon(
              Icons.date_range,
              color: dateRange != null ? AppColors.primary : null,
            ),
            tooltip: dateRange != null
                ? '${Formatters.date(dateRange!.start)} – ${Formatters.date(dateRange!.end)}'
                : 'Filter by date',
            onPressed: () async {
              final picked = await showDateRangePicker(
                context: context,
                firstDate: DateTime(2024),
                lastDate: DateTime.now(),
                initialDateRange: dateRange,
              );
              onDateRangeChanged(picked);
            },
          ),
          if (dateRange != null)
            IconButton(
              icon: const Icon(Icons.clear, size: 18),
              tooltip: 'Clear date filter',
              onPressed: () => onDateRangeChanged(null),
            ),
        ],
      ),
    );
  }
}

class _ChallanTile extends StatelessWidget {
  const _ChallanTile({required this.challan, required this.routePrefix});

  final ChallanResponse challan;
  final String routePrefix;

  @override
  Widget build(BuildContext context) {
    final isPickup = challan.challanType == 'PICKUP';
    final color = isPickup ? AppColors.pickupBlue : AppColors.deliveryGreen;
    final totalPieces = challan.departments.fold<int>(
      0,
      (sum, dept) => sum + dept.items.fold<int>(0, (s, i) => s + i.qty),
    );

    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withValues(alpha: 0.1),
          child: Icon(
            isPickup ? Icons.upload : Icons.download,
            color: color,
            size: 20,
          ),
        ),
        title: Row(
          children: [
            Text(
              challan.challanNumber,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(width: AppSpacing.sm),
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.sm, vertical: 2),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(AppSpacing.chipRadius),
              ),
              child: Text(
                challan.challanType,
                style: TextStyle(
                    color: color, fontSize: 11, fontWeight: FontWeight.w600),
              ),
            ),
            if (challan.lastEditedAt != null) ...[
              const SizedBox(width: AppSpacing.xs),
              const Icon(Icons.edit, size: 14, color: AppColors.textSecondary),
            ],
          ],
        ),
        subtitle: Text(
          '${challan.departments.length} dept · $totalPieces pcs · ${Formatters.dateTime(challan.entryTimestamp)}',
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: AppColors.textSecondary),
        ),
        trailing: const Icon(Icons.chevron_right, size: 18),
        onTap: () => context.push(
          '$routePrefix/challan/${challan.id}',
          extra: challan,
        ),
      ),
    );
  }
}
