import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/utils/formatters.dart';
import '../../reports/data/models/billing_models.dart';
import '../providers/hotel_providers.dart';

class HotelBillingScreen extends ConsumerStatefulWidget {
  const HotelBillingScreen({super.key});

  @override
  ConsumerState<HotelBillingScreen> createState() =>
      _HotelBillingScreenState();
}

class _HotelBillingScreenState extends ConsumerState<HotelBillingScreen> {
  late DateTimeRange _dateRange;
  String _weightMode = 'SOILED';
  bool _isDetailed = false;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _dateRange = DateTimeRange(
      start: DateTime(now.year, now.month, 1),
      end: now,
    );
  }

  BillingParams get _params => BillingParams(
        startDate: Formatters.isoDate(_dateRange.start),
        endDate: Formatters.isoDate(_dateRange.end),
        weightMode: _weightMode,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Billing Report')),
      body: Column(
        children: [
          _ControlsBar(
            dateRange: _dateRange,
            weightMode: _weightMode,
            isDetailed: _isDetailed,
            onDateRangeChanged: (range) {
              if (range != null) setState(() => _dateRange = range);
            },
            onWeightModeChanged: (mode) =>
                setState(() => _weightMode = mode),
            onViewToggled: (detailed) =>
                setState(() => _isDetailed = detailed),
          ),
          Expanded(
            child: _isDetailed
                ? _DetailedBillingView(params: _params)
                : _SummaryBillingView(params: _params),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Controls bar
// ---------------------------------------------------------------------------

class _ControlsBar extends StatelessWidget {
  const _ControlsBar({
    required this.dateRange,
    required this.weightMode,
    required this.isDetailed,
    required this.onDateRangeChanged,
    required this.onWeightModeChanged,
    required this.onViewToggled,
  });

  final DateTimeRange dateRange;
  final String weightMode;
  final bool isDetailed;
  final ValueChanged<DateTimeRange?> onDateRangeChanged;
  final ValueChanged<String> onWeightModeChanged;
  final ValueChanged<bool> onViewToggled;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Date range
          InkWell(
            onTap: () async {
              final picked = await showDateRangePicker(
                context: context,
                firstDate: DateTime(2024),
                lastDate: DateTime.now(),
                initialDateRange: dateRange,
              );
              onDateRangeChanged(picked);
            },
            child: Row(
              children: [
                const Icon(Icons.date_range, size: 18),
                const SizedBox(width: AppSpacing.sm),
                Text(
                  '${Formatters.date(dateRange.start)} – ${Formatters.date(dateRange.end)}',
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          // View toggle + weight mode
          Row(
            children: [
              SegmentedButton<bool>(
                segments: const [
                  ButtonSegment(value: false, label: Text('Summary')),
                  ButtonSegment(value: true, label: Text('Detailed')),
                ],
                selected: {isDetailed},
                onSelectionChanged: (s) => onViewToggled(s.first),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _WeightChip(
                        label: 'Soiled',
                        color: AppColors.soiledChip,
                        isSelected: weightMode == 'SOILED',
                        onTap: () => onWeightModeChanged('SOILED'),
                      ),
                      const SizedBox(width: AppSpacing.xs),
                      _WeightChip(
                        label: 'Calculated',
                        color: AppColors.calculatedChip,
                        isSelected: weightMode == 'CALCULATED',
                        onTap: () => onWeightModeChanged('CALCULATED'),
                      ),
                      const SizedBox(width: AppSpacing.xs),
                      _WeightChip(
                        label: 'Fresh',
                        color: AppColors.freshChip,
                        isSelected: weightMode == 'FRESH',
                        onTap: () => onWeightModeChanged('FRESH'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _WeightChip extends StatelessWidget {
  const _WeightChip({
    required this.label,
    required this.color,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final Color color;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(label, style: TextStyle(
        color: isSelected ? Colors.white : color,
        fontSize: 12,
        fontWeight: FontWeight.w600,
      )),
      selected: isSelected,
      onSelected: (_) => onTap(),
      selectedColor: color,
      backgroundColor: color.withValues(alpha: 0.1),
      checkmarkColor: Colors.white,
      visualDensity: VisualDensity.compact,
    );
  }
}

// ---------------------------------------------------------------------------
// Summary view
// ---------------------------------------------------------------------------

class _SummaryBillingView extends ConsumerWidget {
  const _SummaryBillingView({required this.params});

  final BillingParams params;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final billingAsync = ref.watch(hotelBillingProvider(params));

    return billingAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (_, _) =>
          const Center(child: Text('Failed to load billing data')),
      data: (billing) {
        if (billing == null || billing.hotels.isEmpty) {
          return const Center(child: Text('No billing data for this period'));
        }

        final hotel = billing.hotels.first;

        return RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(hotelBillingProvider(params));
            await Future.delayed(const Duration(milliseconds: 300));
          },
          child: ListView(
            padding: const EdgeInsets.all(AppSpacing.md),
            children: [
              ...hotel.departments.map((dept) =>
                  _DepartmentBillingCard(dept: dept, weightMode: params.weightMode)),
              const SizedBox(height: AppSpacing.sm),
              _DamageLiabilityCard(amount: hotel.damageLiability),
              const SizedBox(height: AppSpacing.sm),
              _GrandTotalCard(amount: hotel.grandTotal),
            ],
          ),
        );
      },
    );
  }
}

class _DepartmentBillingCard extends StatelessWidget {
  const _DepartmentBillingCard({required this.dept, this.weightMode});

  final DepartmentBilling dept;
  final String? weightMode;

  @override
  Widget build(BuildContext context) {
    final isWeight = dept.billingType == 'WEIGHT';
    final badgeColor = isWeight ? AppColors.weightChip : AppColors.pieceChip;

    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
      ),
      child: ExpansionTile(
        initiallyExpanded: true,
        leading: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.sm, vertical: 2),
          decoration: BoxDecoration(
            color: badgeColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(AppSpacing.chipRadius),
          ),
          child: Text(
            dept.billingType,
            style: TextStyle(
                color: badgeColor, fontSize: 11, fontWeight: FontWeight.w600),
          ),
        ),
        title: Text(dept.deptName,
            style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(Formatters.currency(dept.subtotal),
            style: TextStyle(
                color: AppColors.primary, fontWeight: FontWeight.bold)),
        children: [
          if (isWeight) _WeightBreakdown(dept: dept, activeMode: weightMode),
          if (!isWeight && dept.items != null)
            ...dept.items!.map((item) => _PieceItemRow(item: item)),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Department Subtotal',
                    style: TextStyle(fontWeight: FontWeight.w600)),
                Text(Formatters.currency(dept.subtotal),
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _WeightBreakdown extends StatelessWidget {
  const _WeightBreakdown({required this.dept, this.activeMode});

  final DepartmentBilling dept;
  final String? activeMode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      child: Column(
        children: [
          _WeightRow(
            label: 'Soiled Weight',
            weight: dept.soiledWeightKg,
            subtotal: dept.soiledSubtotal,
            isActive: activeMode == 'SOILED',
            color: AppColors.soiledChip,
          ),
          _WeightRow(
            label: 'Calculated Weight',
            weight: dept.calculatedWeightKg,
            subtotal: dept.calculatedSubtotal,
            isActive: activeMode == 'CALCULATED',
            color: AppColors.calculatedChip,
          ),
          _WeightRow(
            label: 'Fresh Weight',
            weight: dept.freshWeightKg,
            subtotal: dept.freshSubtotal,
            isActive: activeMode == 'FRESH',
            color: AppColors.freshChip,
          ),
          if (dept.ratePerKg != null)
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.sm),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Rate per kg',
                      style: Theme.of(context).textTheme.bodySmall),
                  Text(Formatters.currency(dept.ratePerKg!),
                      style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _WeightRow extends StatelessWidget {
  const _WeightRow({
    required this.label,
    required this.weight,
    required this.subtotal,
    required this.isActive,
    required this.color,
  });

  final String label;
  final double? weight;
  final double? subtotal;
  final bool isActive;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.xs),
      padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm, vertical: AppSpacing.xs),
      decoration: isActive
          ? BoxDecoration(
              color: color.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(AppSpacing.chipRadius),
              border: Border.all(color: color.withValues(alpha: 0.3)),
            )
          : null,
      child: Row(
        children: [
          if (isActive)
            Icon(Icons.check_circle, size: 14, color: color)
          else
            const SizedBox(width: 14),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(label,
                style: TextStyle(
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
                  color: isActive ? color : null,
                )),
          ),
          Text(
            weight != null ? Formatters.weight(weight!) : '–',
            style: TextStyle(
              fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          SizedBox(
            width: 80,
            child: Text(
              subtotal != null ? Formatters.currency(subtotal!) : '–',
              textAlign: TextAlign.end,
              style: TextStyle(
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                color: isActive ? color : AppColors.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PieceItemRow extends StatelessWidget {
  const _PieceItemRow({required this.item});

  final PieceLineItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md, vertical: AppSpacing.xs),
      child: Row(
        children: [
          Expanded(child: Text(item.itemName)),
          SizedBox(
            width: 50,
            child: Text('×${item.quantity}', textAlign: TextAlign.center),
          ),
          SizedBox(
            width: 60,
            child: Text(Formatters.currency(item.rate),
                textAlign: TextAlign.end,
                style: const TextStyle(color: AppColors.textSecondary)),
          ),
          SizedBox(
            width: 80,
            child: Text(Formatters.currency(item.subtotal),
                textAlign: TextAlign.end,
                style: const TextStyle(fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );
  }
}

class _DamageLiabilityCard extends StatelessWidget {
  const _DamageLiabilityCard({required this.amount});

  final double amount;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: amount > 0
          ? AppColors.damageRed.withValues(alpha: 0.05)
          : null,
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.remove_circle_outline,
                    color: amount > 0
                        ? AppColors.damageRed
                        : AppColors.textSecondary,
                    size: 20),
                const SizedBox(width: AppSpacing.sm),
                const Text('Damage Liability'),
              ],
            ),
            Text(
              '- ${Formatters.currency(amount)}',
              style: TextStyle(
                color:
                    amount > 0 ? AppColors.damageRed : AppColors.textSecondary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GrandTotalCard extends StatelessWidget {
  const _GrandTotalCard({required this.amount});

  final double amount;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.primary.withValues(alpha: 0.05),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
        side: BorderSide(color: AppColors.primary.withValues(alpha: 0.3)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Grand Total',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              Formatters.currency(amount),
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Detailed (challan-wise) view
// ---------------------------------------------------------------------------

class _DetailedBillingView extends ConsumerWidget {
  const _DetailedBillingView({required this.params});

  final BillingParams params;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final billingAsync = ref.watch(hotelDetailedBillingProvider(params));

    return billingAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (_, _) =>
          const Center(child: Text('Failed to load detailed billing')),
      data: (billing) {
        if (billing == null || billing.hotels.isEmpty) {
          return const Center(
              child: Text('No billing data for this period'));
        }

        final hotel = billing.hotels.first;

        return RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(hotelDetailedBillingProvider(params));
            await Future.delayed(const Duration(milliseconds: 300));
          },
          child: ListView(
            padding: const EdgeInsets.all(AppSpacing.md),
            children: [
              ...hotel.challans.map((challan) =>
                  _DetailedChallanCard(challan: challan)),
              const SizedBox(height: AppSpacing.sm),
              _DamageLiabilityCard(amount: hotel.damageLiability),
              const SizedBox(height: AppSpacing.sm),
              _GrandTotalCard(amount: hotel.grandTotal),
            ],
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
      ),
      child: ExpansionTile(
        leading: CircleAvatar(
          radius: 16,
          backgroundColor: color.withValues(alpha: 0.1),
          child: Icon(
            isPickup ? Icons.upload : Icons.download,
            color: color,
            size: 16,
          ),
        ),
        title: Row(
          children: [
            Text(challan.challanNumber,
                style: const TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(width: AppSpacing.sm),
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.xs, vertical: 1),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(AppSpacing.chipRadius),
              ),
              child: Text(challan.challanType,
                  style: TextStyle(
                      color: color, fontSize: 10, fontWeight: FontWeight.w600)),
            ),
          ],
        ),
        subtitle: Text(
          '${Formatters.dateTime(challan.entryTimestamp)}${challan.agentName != null ? ' · ${challan.agentName}' : ''}',
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: AppColors.textSecondary),
        ),
        trailing: Text(
          Formatters.currency(challan.challanTotal),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        children: [
          for (final dept in challan.departments)
            _DetailedDeptSection(dept: dept),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Challan Total',
                    style: TextStyle(fontWeight: FontWeight.w600)),
                Text(Formatters.currency(challan.challanTotal),
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailedDeptSection extends StatelessWidget {
  const _DetailedDeptSection({required this.dept});

  final DetailedChallanDeptBilling dept;

  @override
  Widget build(BuildContext context) {
    final isWeight = dept.billingType == 'WEIGHT';

    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md, vertical: AppSpacing.xs),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(dept.deptName,
                      style: const TextStyle(fontWeight: FontWeight.w500)),
                  const SizedBox(width: AppSpacing.sm),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.xs, vertical: 1),
                    decoration: BoxDecoration(
                      color: (isWeight
                              ? AppColors.weightChip
                              : AppColors.pieceChip)
                          .withValues(alpha: 0.1),
                      borderRadius:
                          BorderRadius.circular(AppSpacing.chipRadius),
                    ),
                    child: Text(
                      dept.billingType,
                      style: TextStyle(
                        color: isWeight
                            ? AppColors.weightChip
                            : AppColors.pieceChip,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              Text(Formatters.currency(dept.subtotal),
                  style: const TextStyle(fontWeight: FontWeight.w500)),
            ],
          ),
          if (isWeight) ...[
            const SizedBox(height: AppSpacing.xs),
            _DetailedWeightInfo(dept: dept),
          ],
          if (dept.items != null)
            ...dept.items!.map((item) => Padding(
                  padding: const EdgeInsets.only(left: AppSpacing.md),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(item.itemName,
                              style: const TextStyle(fontSize: 13))),
                      SizedBox(
                        width: 40,
                        child: Text('×${item.qty}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 13)),
                      ),
                      if (item.rate != null)
                        SizedBox(
                          width: 60,
                          child: Text(Formatters.currency(item.rate!),
                              textAlign: TextAlign.end,
                              style: const TextStyle(fontSize: 13)),
                        ),
                      if (item.subtotal != null)
                        SizedBox(
                          width: 70,
                          child: Text(Formatters.currency(item.subtotal!),
                              textAlign: TextAlign.end,
                              style: const TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w500)),
                        ),
                    ],
                  ),
                )),
          const Divider(height: AppSpacing.md),
        ],
      ),
    );
  }
}

class _DetailedWeightInfo extends StatelessWidget {
  const _DetailedWeightInfo({required this.dept});

  final DetailedChallanDeptBilling dept;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context)
        .textTheme
        .bodySmall
        ?.copyWith(color: AppColors.textSecondary);

    return Wrap(
      spacing: AppSpacing.md,
      children: [
        if (dept.soiledWeightKg != null)
          Text('Soiled: ${Formatters.weight(dept.soiledWeightKg!)}',
              style: style),
        if (dept.calculatedWeightKg != null)
          Text('Calc: ${Formatters.weight(dept.calculatedWeightKg!)}',
              style: style),
        if (dept.freshWeightKg != null)
          Text('Fresh: ${Formatters.weight(dept.freshWeightKg!)}',
              style: style),
        if (dept.ratePerKg != null)
          Text('@ ${Formatters.currency(dept.ratePerKg!)}/kg', style: style),
      ],
    );
  }
}
