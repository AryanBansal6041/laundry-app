import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/utils/formatters.dart';
import '../../hotel/data/models/damage_models.dart';
import '../providers/admin_providers.dart';

class AdminQualityScreen extends ConsumerStatefulWidget {
  const AdminQualityScreen({super.key});

  @override
  ConsumerState<AdminQualityScreen> createState() => _AdminQualityScreenState();
}

class _AdminQualityScreenState extends ConsumerState<AdminQualityScreen> {
  DateTimeRange? _dateRange;
  String? _hotelFilter;
  bool _hideZeroDamage = false;

  AdminDamageParams get _params => AdminDamageParams(
        hotelId: _hotelFilter,
        startDate: _dateRange != null ? Formatters.isoDate(_dateRange!.start) : null,
        endDate: _dateRange != null ? Formatters.isoDate(_dateRange!.end) : null,
        minDamage: _hideZeroDamage ? 1 : null,
      );

  @override
  Widget build(BuildContext context) {
    final reportAsync = ref.watch(adminDamageReportProvider(_params));
    final hotelsAsync = ref.watch(hotelsListProvider);
    final hotels = hotelsAsync.asData?.value ?? [];

    return Scaffold(
      appBar: AppBar(title: const Text('Quality Reports')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSpacing.sm),
            child: Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                ActionChip(
                  avatar: const Icon(Icons.date_range, size: 16),
                  label: Text(_dateRange != null
                      ? '${Formatters.date(_dateRange!.start)} – ${Formatters.date(_dateRange!.end)}'
                      : 'All time'),
                  onPressed: () async {
                    final picked = await showDateRangePicker(
                      context: context,
                      firstDate: DateTime(2024),
                      lastDate: DateTime.now(),
                      initialDateRange: _dateRange,
                    );
                    if (picked != null) setState(() => _dateRange = picked);
                  },
                ),
                if (_dateRange != null)
                  IconButton(
                    icon: const Icon(Icons.clear, size: 18),
                    onPressed: () => setState(() => _dateRange = null),
                  ),
                if (hotels.isNotEmpty)
                  DropdownButton<String>(
                    value: _hotelFilter,
                    hint: const Text('All Hotels'),
                    underline: const SizedBox.shrink(),
                    items: [
                      const DropdownMenuItem(value: null, child: Text('All Hotels')),
                      ...hotels.map((h) =>
                          DropdownMenuItem(value: h.id, child: Text(h.name))),
                    ],
                    onChanged: (v) => setState(() => _hotelFilter = v),
                  ),
                FilterChip(
                  label: const Text('Hide zero damage'),
                  selected: _hideZeroDamage,
                  onSelected: (v) => setState(() => _hideZeroDamage = v),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                ref.invalidate(adminDamageReportProvider(_params));
                await Future.delayed(const Duration(milliseconds: 300));
              },
              child: reportAsync.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (_, _) => const Center(child: Text('Failed to load damage report')),
                data: (report) {
                  if (report == null) {
                    return const Center(child: Text('Failed to load damage report'));
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

class _DamageReportBody extends StatelessWidget {
  const _DamageReportBody({required this.report});
  final DamageReportResponse report;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppSpacing.md),
      children: [
        Text('Challan Damage Summary',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
        Text('Net damage attributed to laundry',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textSecondary)),
        const SizedBox(height: AppSpacing.sm),
        if (report.challanDamageSummary.isEmpty)
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Center(
                child: Text('No damage recorded',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary)),
              ),
            ),
          )
        else
          Card(
            clipBehavior: Clip.antiAlias,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Hotel')),
                  DataColumn(label: Text('Item')),
                  DataColumn(label: Text('Net Damage'), numeric: true),
                ],
                rows: report.challanDamageSummary.map((item) {
                  final color = item.netDamage > 5
                      ? AppColors.damageRed
                      : item.netDamage > 0
                          ? AppColors.damageYellow
                          : AppColors.damageGreen;
                  return DataRow(cells: [
                    DataCell(Text(item.hotelName)),
                    DataCell(Text(item.itemName)),
                    DataCell(Text('${item.netDamage}',
                        style: TextStyle(color: color, fontWeight: FontWeight.bold))),
                  ]);
                }).toList(),
              ),
            ),
          ),
        const SizedBox(height: AppSpacing.lg),
        Text('All-Time Damage Totals',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
        Text('Cumulative across all time',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textSecondary)),
        const SizedBox(height: AppSpacing.sm),
        if (report.allTimeTotals.isEmpty)
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Center(
                child: Text('No damage recorded',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary)),
              ),
            ),
          )
        else
          Card(
            clipBehavior: Clip.antiAlias,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Hotel')),
                  DataColumn(label: Text('Item')),
                  DataColumn(label: Text('Total Damaged'), numeric: true),
                ],
                rows: report.allTimeTotals.map((item) {
                  final color = item.totalDamagedByLaundry > 5
                      ? AppColors.damageRed
                      : item.totalDamagedByLaundry > 0
                          ? AppColors.damageYellow
                          : AppColors.damageGreen;
                  return DataRow(
                    color: item.totalDamagedByLaundry > 10
                        ? WidgetStateProperty.all(AppColors.damageRed.withValues(alpha: 0.05))
                        : null,
                    cells: [
                      DataCell(Text(item.hotelName)),
                      DataCell(Text(item.itemName)),
                      DataCell(Text('${item.totalDamagedByLaundry}',
                          style: TextStyle(color: color, fontWeight: FontWeight.bold))),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
      ],
    );
  }
}
