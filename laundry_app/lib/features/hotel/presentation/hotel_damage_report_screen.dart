import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/utils/formatters.dart';
import '../data/models/damage_models.dart';
import '../providers/hotel_providers.dart';

class HotelDamageReportScreen extends ConsumerStatefulWidget {
  const HotelDamageReportScreen({super.key});

  @override
  ConsumerState<HotelDamageReportScreen> createState() =>
      _HotelDamageReportScreenState();
}

class _HotelDamageReportScreenState
    extends ConsumerState<HotelDamageReportScreen> {
  DateTimeRange? _dateRange;
  bool _hideZeroDamage = false;

  DamageReportParams get _params => DamageReportParams(
        startDate:
            _dateRange != null ? Formatters.isoDate(_dateRange!.start) : null,
        endDate:
            _dateRange != null ? Formatters.isoDate(_dateRange!.end) : null,
        minDamage: _hideZeroDamage ? 1 : null,
      );

  @override
  Widget build(BuildContext context) {
    final reportAsync = ref.watch(hotelDamageReportProvider(_params));

    return Scaffold(
      appBar: AppBar(title: const Text('Damage Report')),
      body: Column(
        children: [
          _DateFilterBar(
            dateRange: _dateRange,
            onDateRangeChanged: (range) =>
                setState(() => _dateRange = range),
            hideZeroDamage: _hideZeroDamage,
            onHideZeroDamageChanged: (v) =>
                setState(() => _hideZeroDamage = v),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                ref.invalidate(hotelDamageReportProvider(_params));
                await Future.delayed(const Duration(milliseconds: 300));
              },
              child: reportAsync.when(
                loading: () =>
                    const Center(child: CircularProgressIndicator()),
                error: (_, _) => const Center(
                    child: Text('Failed to load damage report')),
                data: (report) {
                  if (report == null) {
                    return const Center(
                        child: Text('Failed to load damage report'));
                  }
                  return _DamageReportBody(report: report);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DateFilterBar extends StatelessWidget {
  const _DateFilterBar({
    required this.dateRange,
    required this.onDateRangeChanged,
    required this.hideZeroDamage,
    required this.onHideZeroDamageChanged,
  });

  final DateTimeRange? dateRange;
  final ValueChanged<DateTimeRange?> onDateRangeChanged;
  final bool hideZeroDamage;
  final ValueChanged<bool> onHideZeroDamageChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md, vertical: AppSpacing.sm),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.info_outline,
                  size: 16, color: AppColors.textSecondary),
              const SizedBox(width: AppSpacing.xs),
              Expanded(
                child: Text(
                  dateRange != null
                      ? 'Showing damage from ${Formatters.date(dateRange!.start)} to ${Formatters.date(dateRange!.end)}'
                      : 'Showing all-time challan damage summary',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: AppColors.textSecondary),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.date_range,
                  color: dateRange != null ? AppColors.primary : null,
                ),
                tooltip: 'Filter date range',
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
          Row(
            children: [
              FilterChip(
                label: const Text('Hide zero damage'),
                selected: hideZeroDamage,
                onSelected: onHideZeroDamageChanged,
                avatar: hideZeroDamage
                    ? const Icon(Icons.filter_alt, size: 16)
                    : const Icon(Icons.filter_alt_off, size: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DamageReportBody extends StatelessWidget {
  const _DamageReportBody({required this.report});

  final DamageReportResponse report;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppSpacing.md),
      children: [
        _SectionHeader(
          title: 'Challan Damage Summary',
          subtitle: 'Net damage attributed to laundry (from delivery challans)',
        ),
        if (report.challanDamageSummary.isEmpty)
          _EmptyCard(message: 'No damage recorded in this period')
        else
          ...report.challanDamageSummary.map((item) =>
              _DamageSummaryTile(item: item)),
        const SizedBox(height: AppSpacing.lg),
        _SectionHeader(
          title: 'All-Time Damage Totals',
          subtitle: 'Cumulative damage across all time (not affected by date filter)',
        ),
        if (report.allTimeTotals.isEmpty)
          _EmptyCard(message: 'No all-time damage recorded')
        else
          ...report.allTimeTotals.map((item) =>
              _AllTimeDamageTile(item: item)),
      ],
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          Text(
            subtitle,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}

class _DamageSummaryTile extends StatelessWidget {
  const _DamageSummaryTile({required this.item});

  final DamageSummaryItem item;

  @override
  Widget build(BuildContext context) {
    final color = item.netDamage > 5
        ? AppColors.damageRed
        : item.netDamage > 0
            ? AppColors.damageYellow
            : AppColors.damageGreen;

    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: ListTile(
        leading: Container(
          width: 8,
          height: 40,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        title: Text(
          item.itemName,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        trailing: Text(
          '${item.netDamage}',
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

class _AllTimeDamageTile extends StatelessWidget {
  const _AllTimeDamageTile({required this.item});

  final AllTimeDamageItem item;

  @override
  Widget build(BuildContext context) {
    final color = item.totalDamagedByLaundry > 10
        ? AppColors.damageRed
        : item.totalDamagedByLaundry > 0
            ? AppColors.damageYellow
            : AppColors.damageGreen;

    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: ListTile(
        leading: Icon(
          Icons.warning_amber,
          color: color,
        ),
        title: Text(item.itemName),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '${item.totalDamagedByLaundry}',
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(
              'all-time',
              style: Theme.of(context)
                  .textTheme
                  .labelSmall
                  ?.copyWith(color: AppColors.textSecondary),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyCard extends StatelessWidget {
  const _EmptyCard({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Center(
          child: Text(
            message,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: AppColors.textSecondary),
          ),
        ),
      ),
    );
  }
}
