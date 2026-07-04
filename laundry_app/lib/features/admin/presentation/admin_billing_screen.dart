import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/utils/formatters.dart';
import '../../reports/data/models/billing_models.dart';
import '../providers/admin_providers.dart';

class AdminBillingScreen extends ConsumerStatefulWidget {
  const AdminBillingScreen({super.key});

  @override
  ConsumerState<AdminBillingScreen> createState() => _AdminBillingScreenState();
}

class _AdminBillingScreenState extends ConsumerState<AdminBillingScreen> {
  late DateTimeRange _dateRange;
  bool _isDetailed = false;
  String? _weightMode;
  String? _hotelFilter;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _dateRange = DateTimeRange(
      start: DateTime(now.year, now.month, 1),
      end: now,
    );
  }

  AdminBillingParams get _params => AdminBillingParams(
        startDate: Formatters.isoDate(_dateRange.start),
        endDate: Formatters.isoDate(_dateRange.end),
        hotelId: _hotelFilter,
        weightMode: _weightMode,
      );

  @override
  Widget build(BuildContext context) {
    final hotelsAsync = ref.watch(hotelsListProvider);
    final hotels = hotelsAsync.asData?.value ?? [];

    return Scaffold(
      appBar: AppBar(title: const Text('Billing Reports')),
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
                  label: Text(
                      '${Formatters.date(_dateRange.start)} – ${Formatters.date(_dateRange.end)}'),
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
                SegmentedButton<bool>(
                  segments: const [
                    ButtonSegment(value: false, label: Text('Summary')),
                    ButtonSegment(value: true, label: Text('Detailed')),
                  ],
                  selected: {_isDetailed},
                  onSelectionChanged: (v) =>
                      setState(() => _isDetailed = v.first),
                ),
                ...['SOILED', 'CALCULATED', 'FRESH'].map((mode) => ChoiceChip(
                      label: Text(mode),
                      selected: _weightMode == mode,
                      onSelected: (selected) =>
                          setState(() => _weightMode = selected ? mode : null),
                    )),
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
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: _isDetailed
                ? _DetailedBillingView(params: _params, ref: ref)
                : _SummaryBillingView(
                    params: _params,
                    ref: ref,
                    weightMode: _weightMode,
                  ),
          ),
        ],
      ),
    );
  }
}

class _SummaryBillingView extends StatelessWidget {
  const _SummaryBillingView({
    required this.params,
    required this.ref,
    this.weightMode,
  });
  final AdminBillingParams params;
  final WidgetRef ref;
  final String? weightMode;

  @override
  Widget build(BuildContext context) {
    final billingAsync = ref.watch(adminBillingProvider(params));

    return billingAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (_, _) => const Center(child: Text('Failed to load billing')),
      data: (billing) {
        if (billing == null) {
          return const Center(child: Text('Failed to load billing'));
        }
        final sortedHotels = [...billing.hotels]
          ..sort((a, b) => b.grandTotal.compareTo(a.grandTotal));

        return RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(adminBillingProvider(params));
            await Future.delayed(const Duration(milliseconds: 300));
          },
          child: ListView(
            padding: const EdgeInsets.all(AppSpacing.md),
            children: [
              Text('Hotel Leaderboard',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.w600)),
              const SizedBox(height: AppSpacing.sm),
              ...sortedHotels.asMap().entries.map((entry) {
                final index = entry.key;
                final hotel = entry.value;
                return _HotelBillingCard(
                  hotel: hotel,
                  rank: index + 1,
                  weightMode: weightMode,
                );
              }),
            ],
          ),
        );
      },
    );
  }
}

class _HotelBillingCard extends StatelessWidget {
  const _HotelBillingCard({
    required this.hotel,
    required this.rank,
    this.weightMode,
  });
  final HotelBilling hotel;
  final int rank;
  final String? weightMode;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: ExpansionTile(
        leading: CircleAvatar(
          backgroundColor: rank <= 3
              ? AppColors.primary.withValues(alpha: 0.1)
              : AppColors.bgLight,
          child: Text(
            '#$rank',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: rank <= 3 ? AppColors.primary : AppColors.textSecondary,
            ),
          ),
        ),
        title: Text(hotel.hotelName,
            style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(Formatters.currency(hotel.grandTotal)),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(Formatters.currency(hotel.grandTotal),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold)),
            if (hotel.damageLiability > 0)
              Text(
                'Damage: -${Formatters.currency(hotel.damageLiability)}',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: AppColors.damageRed),
              ),
          ],
        ),
        children: hotel.departments.map((dept) {
          final isWeight = dept.billingType == 'WEIGHT';
          return ListTile(
            dense: true,
            leading: Icon(
              isWeight ? Icons.scale : Icons.grid_view,
              size: 18,
              color: isWeight ? AppColors.weightChip : AppColors.pieceChip,
            ),
            title: Text(dept.deptName),
            subtitle: isWeight
                ? Text(
                    'S: ${Formatters.weight(dept.soiledWeightKg ?? 0)} · '
                    'C: ${Formatters.weight(dept.calculatedWeightKg ?? 0)} · '
                    'F: ${Formatters.weight(dept.freshWeightKg ?? 0)}',
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                : null,
            trailing: Text(Formatters.currency(dept.subtotal)),
          );
        }).toList(),
      ),
    );
  }
}

class _DetailedBillingView extends StatelessWidget {
  const _DetailedBillingView({required this.params, required this.ref});
  final AdminBillingParams params;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    final billingAsync = ref.watch(adminDetailedBillingProvider(params));

    return billingAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (_, _) => const Center(child: Text('Failed to load billing')),
      data: (billing) {
        if (billing == null) {
          return const Center(child: Text('Failed to load billing'));
        }
        return RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(adminDetailedBillingProvider(params));
            await Future.delayed(const Duration(milliseconds: 300));
          },
          child: ListView(
            padding: const EdgeInsets.all(AppSpacing.md),
            children: billing.hotels.expand((hotel) {
              return [
                Padding(
                  padding: const EdgeInsets.only(top: AppSpacing.md, bottom: AppSpacing.sm),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(hotel.hotelName,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold)),
                      Text(Formatters.currency(hotel.grandTotal),
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold, color: AppColors.primary)),
                    ],
                  ),
                ),
                ...hotel.challans.map((challan) => _DetailedChallanCard(challan: challan)),
              ];
            }).toList(),
          ),
        );
      },
    );
  }
}

class _DetailedChallanCard extends StatelessWidget {
  const _DetailedChallanCard({required this.challan});
  final DetailedChallanBilling challan;

  @override
  Widget build(BuildContext context) {
    final isPickup = challan.challanType == 'PICKUP';
    final color = isPickup ? AppColors.pickupBlue : AppColors.deliveryGreen;

    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: 2),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(AppSpacing.chipRadius),
                  ),
                  child: Text(challan.challanType,
                      style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.w600)),
                ),
                const SizedBox(width: AppSpacing.sm),
                Text(challan.challanNumber,
                    style: const TextStyle(fontWeight: FontWeight.w600)),
                const Spacer(),
                Text(Formatters.currency(challan.challanTotal),
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              '${Formatters.dateTime(challan.entryTimestamp)} · ${challan.agentName ?? '-'}',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textSecondary),
            ),
            const Divider(),
            ...challan.departments.map((dept) => Padding(
                  padding: const EdgeInsets.only(left: AppSpacing.sm, bottom: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(dept.deptName, style: Theme.of(context).textTheme.bodySmall),
                      Text(Formatters.currency(dept.subtotal),
                          style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
