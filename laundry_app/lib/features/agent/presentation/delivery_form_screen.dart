import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/enums.dart';
import '../../../core/network/api_result.dart';
import '../../../core/theme/app_colors.dart';
import '../../challans/data/models/challan_models.dart';
import '../../hotel/data/models/tracking_models.dart';
import '../../setup/data/models/setup_models.dart';
import '../providers/agent_providers.dart';

// ---------------------------------------------------------------------------
// Local form state helpers
// ---------------------------------------------------------------------------

class _ItemDeliveryState {
  int deliverQty = 0;
  int damagedQty = 0;
  final int pickedQty;

  _ItemDeliveryState({this.pickedQty = 0});
}

class _DeptDeliveryState {
  double? freshWeight;
  String searchQuery;
  bool isExpanded;
  final Map<String, _ItemDeliveryState> items;

  _DeptDeliveryState()
    : freshWeight = null,
      searchQuery = '',
      isExpanded = true,
      items = {};

  int get totalDelivering =>
      items.values.fold(0, (sum, item) => sum + item.deliverQty);

  int get totalDamaged =>
      items.values.fold(0, (sum, item) => sum + item.damagedQty);
}

// ---------------------------------------------------------------------------
// DeliveryFormScreen
// ---------------------------------------------------------------------------

class DeliveryFormScreen extends ConsumerStatefulWidget {
  const DeliveryFormScreen({super.key, required this.hotelId});

  final String hotelId;

  @override
  ConsumerState<DeliveryFormScreen> createState() => _DeliveryFormScreenState();
}

class _DeliveryFormScreenState extends ConsumerState<DeliveryFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scrollController = ScrollController();

  String? _selectedChallanNumber;
  ChallanResponse? _selectedPickup;
  final Map<String, _DeptDeliveryState> _departments = {};
  List<FormSchemaDepartment> _schemaDepts = [];

  bool _isSubmitting = false;
  String? _submitError;
  String? _inlineItemError;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // --- Computed totals ---

  int get _grandTotalDelivering =>
      _departments.values.fold(0, (sum, d) => sum + d.totalDelivering);

  int get _grandTotalDamaged =>
      _departments.values.fold(0, (sum, d) => sum + d.totalDamaged);

  // --- Schema lookup ---

  FormSchemaDepartment? _schemaDept(String deptId) {
    for (final d in _schemaDepts) {
      if (d.deptId == deptId) return d;
    }
    return null;
  }

  String _deptName(String deptId) => _schemaDept(deptId)?.name ?? deptId;

  String _itemName(String deptId, String itemId) {
    final dept = _schemaDept(deptId);
    if (dept == null) return itemId;
    for (final item in dept.items) {
      if (item.itemId == itemId) return item.name;
    }
    return itemId;
  }

  // --- Populate from selected pickup ---

  void _onChallanSelected(
    String? challanNumber,
    List<ChallanResponse> pickups,
  ) {
    if (challanNumber == null) return;

    final pickup = pickups.firstWhere((c) => c.challanNumber == challanNumber);
    final newDepts = <String, _DeptDeliveryState>{};

    for (final dept in pickup.departments) {
      final state = _DeptDeliveryState();
      for (final item in dept.items) {
        state.items[item.itemId] = _ItemDeliveryState(pickedQty: item.qty);
      }
      newDepts[dept.deptId] = state;
    }

    setState(() {
      _selectedChallanNumber = challanNumber;
      _selectedPickup = pickup;
      _departments
        ..clear()
        ..addAll(newDepts);
      _submitError = null;
    });
  }

  // --- Deliver All ---

  void _deliverAll() {
    HapticFeedback.mediumImpact();
    if (_selectedPickup == null) return;

    setState(() {
      for (final dept in _selectedPickup!.departments) {
        final deptState = _departments[dept.deptId];
        if (deptState == null) continue;
        for (final item in dept.items) {
          final itemState = deptState.items[item.itemId];
          if (itemState == null) continue;
          itemState.deliverQty = item.qty;
          itemState.damagedQty = 0;
        }
      }
    });
  }

  void _fillAllFromInventory(
    FormSchemaResponse schema,
    LiveTrackingResponse tracking,
  ) {
    HapticFeedback.mediumImpact();

    String key(String deptName, String itemName) =>
        '${deptName.trim().toLowerCase()}::${itemName.trim().toLowerCase()}';

    final qtyByDeptItem = <String, int>{};
    for (final dept in tracking.departments) {
      for (final item in dept.items) {
        qtyByDeptItem[key(dept.deptName, item.itemName)] = item.qtyInLaundry;
      }
    }

    setState(() {
      for (final schemaDept in schema.departments) {
        final deptState = _departments.putIfAbsent(
          schemaDept.deptId,
          () => _DeptDeliveryState(),
        );

        for (final schemaItem in schemaDept.items) {
          final itemState = deptState.items.putIfAbsent(
            schemaItem.itemId,
            () => _ItemDeliveryState(pickedQty: 0),
          );
          final inLaundryQty =
              qtyByDeptItem[key(schemaDept.name, schemaItem.name)] ?? 0;
          itemState.deliverQty = inLaundryQty;
          itemState.damagedQty = 0;
        }
      }
      _submitError = null;
      _inlineItemError = null;
    });
  }

  // --- Validation ---

  String? _validateForm() {
    if (_selectedChallanNumber == null) {
      return 'Please select a challan number';
    }
    if (_departments.isEmpty) {
      return 'No departments found in the selected pickup';
    }
    bool hasItems = false;
    for (final entry in _departments.entries) {
      final deptState = entry.value;
      for (final itemEntry in deptState.items.entries) {
        final item = itemEntry.value;
        if (item.deliverQty > 0) hasItems = true;
        if (item.damagedQty > item.deliverQty) {
          return 'Damaged qty exceeds deliver qty for '
              '"${_itemName(entry.key, itemEntry.key)}" '
              'in ${_deptName(entry.key)}';
        }
      }
    }
    if (!hasItems) {
      return 'At least one item must have deliver qty > 0';
    }
    return null;
  }

  // --- Submit ---

  Future<void> _submit() async {
    HapticFeedback.mediumImpact();
    if (!_formKey.currentState!.validate()) return;

    final validationError = _validateForm();
    if (validationError != null) {
      setState(() => _submitError = validationError);
      return;
    }

    setState(() {
      _isSubmitting = true;
      _submitError = null;
      _inlineItemError = null;
    });

    final deptPayloads = <ChallanDeptPayload>[];
    for (final entry in _departments.entries) {
      final deptState = entry.value;
      final itemPayloads = <ChallanItemPayload>[];
      for (final itemEntry in deptState.items.entries) {
        final item = itemEntry.value;
        if (item.deliverQty > 0 || item.damagedQty > 0) {
          itemPayloads.add(
            ChallanItemPayload(
              itemId: itemEntry.key,
              qty: item.deliverQty,
              damagedQty: item.damagedQty,
            ),
          );
        }
      }
      deptPayloads.add(
        ChallanDeptPayload(
          deptId: entry.key,
          freshWeight: deptState.freshWeight,
          items: itemPayloads,
        ),
      );
    }

    final request = DeliverySubmitRequest(
      challanNumber: _selectedChallanNumber!,
      hotelId: widget.hotelId,
      departments: deptPayloads,
    );

    final result = await ref
        .read(agentRepositoryProvider)
        .submitDelivery(request);

    if (!mounted) return;

    setState(() => _isSubmitting = false);

    switch (result) {
      case Success(data: final challan):
        await _showSuccessDialog(challan);
        if (mounted && context.mounted) {
          ref.invalidate(pendingDeliveriesProvider(widget.hotelId));
          context.pop();
        }

      case Failure(exception: final exception):
        final message = switch (exception) {
          ConflictException(:final message) => message,
          ValidationException(:final message)
              when message.contains('Cannot deliver') =>
            message,
          ValidationException(:final message)
              when message.contains('No pickup challan found') =>
            'No pickup challan found for this number. It may have been deleted.',
          ValidationException(:final message) => message,
          NetworkException() => 'No internet connection. Please try again.',
          _ => exception.message,
        };
        final isOverDelivery =
            exception is ValidationException &&
            exception.message.contains('Cannot deliver');
        setState(() {
          _submitError = message;
          _inlineItemError = isOverDelivery ? message : null;
        });
    }
  }

  Future<void> _showSuccessDialog(ChallanResponse challan) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        icon: const Icon(
          Icons.check_circle,
          color: AppColors.deliveryGreen,
          size: 48,
        ),
        title: const Text('Delivery Submitted'),
        content: Text(
          'Delivery for challan ${challan.challanNumber} has been recorded successfully.',
        ),
        actions: [
          FilledButton(
            onPressed: () => Navigator.of(ctx).pop(),
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.deliveryGreen,
            ),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  // --- Badge widgets ---

  Widget _billingBadge(BillingType type) {
    final isWeight = type == BillingType.weight;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: (isWeight ? AppColors.weightChip : AppColors.pieceChip)
            .withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        isWeight ? 'WEIGHT' : 'PIECE',
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: isWeight ? AppColors.weightChip : AppColors.pieceChip,
        ),
      ),
    );
  }

  // --- Item row ---

  Widget _buildItemRow(
    String deptId,
    String itemId,
    _ItemDeliveryState itemState,
  ) {
    final name = _itemName(deptId, itemId);
    final onSurface = Theme.of(context).colorScheme.onSurface;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(fontSize: 14, color: onSurface),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Picked: ${itemState.pickedQty}',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 3,
                child: _StepperField(
                  label: 'Deliver',
                  value: itemState.deliverQty,
                  accentColor: AppColors.deliveryGreen,
                  onChanged: (v) => setState(() => itemState.deliverQty = v),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 3,
                child: _StepperField(
                  label: 'Dmg',
                  value: itemState.damagedQty,
                  max: itemState.deliverQty,
                  accentColor: AppColors.damageRed,
                  onChanged: (v) => setState(() => itemState.damagedQty = v),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // --- Department card ---

  Widget _buildDepartmentCard(String deptId, _DeptDeliveryState deptState) {
    final schema = _schemaDept(deptId);
    final isWeight = schema?.billingType == BillingType.weight;
    final query = deptState.searchQuery.toLowerCase();

    final allItemIds = deptState.items.keys.toList();
    final filteredItemIds = allItemIds.where((itemId) {
      if (query.isEmpty) return true;
      return _itemName(deptId, itemId).toLowerCase().contains(query);
    }).toList();

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: AppColors.border),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          // Header
          InkWell(
            onTap: () =>
                setState(() => deptState.isExpanded = !deptState.isExpanded),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Row(
                children: [
                  Icon(
                    deptState.isExpanded
                        ? Icons.expand_less
                        : Icons.expand_more,
                    size: 20,
                    color: AppColors.textSecondary,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      schema?.name ?? deptId,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ),
                  if (schema != null) _billingBadge(schema.billingType),
                ],
              ),
            ),
          ),

          if (deptState.isExpanded) ...[
            const Divider(height: 1),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (isWeight)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: TextFormField(
                        initialValue: deptState.freshWeight?.toString(),
                        decoration: const InputDecoration(
                          labelText: 'Fresh Weight (kg)',
                          suffixText: 'kg',
                          isDense: true,
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp(r'^\d*\.?\d{0,2}'),
                          ),
                        ],
                        onChanged: (v) {
                          deptState.freshWeight = double.tryParse(v);
                        },
                      ),
                    ),

                  // Item search
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search items...',
                      prefixIcon: const Icon(Icons.search, size: 20),
                      isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                    ),
                    onChanged: (v) => setState(() => deptState.searchQuery = v),
                  ),
                  const SizedBox(height: 8),

                  // Column headers
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          'Item',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(
                              context,
                            ).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        flex: 3,
                        child: Text(
                          'Deliver',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(
                              context,
                            ).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        flex: 3,
                        child: Text(
                          'Damaged',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(
                              context,
                            ).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 8),

                  // Item rows
                  ...filteredItemIds.map((itemId) {
                    final itemState = deptState.items[itemId]!;
                    return _buildItemRow(deptId, itemId, itemState);
                  }),

                  // Over-delivery inline error
                  if (_inlineItemError != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 4, bottom: 4),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.damageRed.withValues(alpha: 0.08),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: AppColors.damageRed.withValues(alpha: 0.3),
                          ),
                        ),
                        child: Text(
                          _inlineItemError!,
                          style: const TextStyle(
                            color: AppColors.damageRed,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),

                  if (filteredItemIds.isEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        query.isEmpty
                            ? 'No items in this department'
                            : 'No items matching "$query"',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 13,
                        ),
                      ),
                    ),
                ],
              ),
            ),

            // Department summary
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: const BoxDecoration(
                color: Color(0xFFF5F5F5),
                border: Border(top: BorderSide(color: AppColors.border)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Delivering: ${deptState.totalDelivering}',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  if (deptState.totalDamaged > 0)
                    Text(
                      'Damaged: ${deptState.totalDamaged}',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.damageRed,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  // --- Build ---

  @override
  Widget build(BuildContext context) {
    final schemaAsync = ref.watch(formSchemaProvider(widget.hotelId));
    final pendingAsync = ref.watch(pendingDeliveriesProvider(widget.hotelId));
    final trackingAsync = ref.watch(liveTrackingProvider(widget.hotelId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('New Delivery'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: schemaAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.error_outline,
                size: 48,
                color: AppColors.damageRed,
              ),
              const SizedBox(height: 12),
              Text(
                'Failed to load form schema',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 8),
              FilledButton.tonal(
                onPressed: () =>
                    ref.invalidate(formSchemaProvider(widget.hotelId)),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
        data: (schema) {
          if (schema == null) {
            return const Center(
              child: Text('No form schema available for this hotel'),
            );
          }

          _schemaDepts = schema.departments;

          return pendingAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.error_outline,
                    size: 48,
                    color: AppColors.damageRed,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Failed to load pending deliveries',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 8),
                  FilledButton.tonal(
                    onPressed: () => ref.invalidate(
                      pendingDeliveriesProvider(widget.hotelId),
                    ),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
            data: (pickups) => _buildForm(pickups, schema, trackingAsync),
          );
        },
      ),
    );
  }

  Widget _buildForm(
    List<ChallanResponse> pickups,
    FormSchemaResponse schema,
    AsyncValue<LiveTrackingResponse?> trackingAsync,
  ) {
    final pickupChallans = pickups
        .where((c) => c.challanType == ChallanType.pickup.toJson())
        .toList();

    if (pickupChallans.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.local_shipping_outlined,
                size: 64,
                color: AppColors.textSecondary,
              ),
              const SizedBox(height: 16),
              Text(
                'No pending pickups',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'All pickups have been delivered or there are no pickups yet.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Form(
      key: _formKey,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              controller: _scrollController,
              padding: const EdgeInsets.all(16),
              children: [
                // Challan number dropdown
                DropdownButtonFormField<String>(
                  initialValue: _selectedChallanNumber,
                  decoration: const InputDecoration(
                    labelText: 'Challan Number',
                    prefixIcon: Icon(Icons.receipt_long),
                    border: OutlineInputBorder(),
                  ),
                  hint: const Text('Select pickup challan'),
                  isExpanded: true,
                  items: pickupChallans.map((c) {
                    final deptCount = c.departments.length;
                    final itemCount = c.departments.fold<int>(
                      0,
                      (sum, d) => sum + d.items.length,
                    );
                    return DropdownMenuItem(
                      value: c.challanNumber,
                      child: Text(
                        '${c.challanNumber}  ($deptCount dept, $itemCount items)',
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  }).toList(),
                  validator: (v) =>
                      v == null ? 'Please select a challan number' : null,
                  onChanged: (v) => _onChallanSelected(v, pickupChallans),
                ),
                const SizedBox(height: 12),

                // Quick fill buttons
                if (_selectedPickup != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Column(
                      children: [
                        OutlinedButton.icon(
                          onPressed: _deliverAll,
                          icon: const Icon(Icons.done_all, size: 18),
                          label: const Text('Fill From Selected Challan'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColors.deliveryGreen,
                            side: const BorderSide(
                              color: AppColors.deliveryGreen,
                            ),
                            minimumSize: const Size.fromHeight(44),
                          ),
                        ),
                        const SizedBox(height: 8),
                        FilledButton.tonalIcon(
                          onPressed: switch (trackingAsync) {
                            AsyncData(value: final tracking)
                                when tracking != null =>
                              () => _fillAllFromInventory(schema, tracking),
                            _ => null,
                          },
                          icon: const Icon(
                            Icons.inventory_2_outlined,
                            size: 18,
                          ),
                          label: const Text('Fill All From Inventory'),
                          style: FilledButton.styleFrom(
                            minimumSize: const Size.fromHeight(44),
                          ),
                        ),
                      ],
                    ),
                  ),
                if (_selectedPickup == null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: FilledButton.tonalIcon(
                      onPressed: null,
                      icon: const Icon(Icons.inventory_2_outlined, size: 18),
                      label: const Text('Select Challan To Fill Inventory'),
                      style: FilledButton.styleFrom(
                        minimumSize: const Size.fromHeight(44),
                      ),
                    ),
                  ),

                // Department cards
                ..._departments.entries.map(
                  (e) => _buildDepartmentCard(e.key, e.value),
                ),

                // Error message
                if (_submitError != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 4, bottom: 8),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.damageRed.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: AppColors.damageRed.withValues(alpha: 0.3),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.error_outline,
                            size: 18,
                            color: AppColors.damageRed,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              _submitError!,
                              style: const TextStyle(
                                color: AppColors.damageRed,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),

          // Grand total footer + submit
          _buildFooter(),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: const Border(top: BorderSide(color: AppColors.border)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (_departments.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Delivering: $_grandTotalDelivering',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    if (_grandTotalDamaged > 0)
                      Text(
                        'Damaged: $_grandTotalDamaged',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: AppColors.damageRed,
                        ),
                      ),
                  ],
                ),
              ),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: FilledButton(
                onPressed: _isSubmitting || _selectedChallanNumber == null
                    ? null
                    : _submit,
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.deliveryGreen,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: _isSubmitting
                    ? const SizedBox(
                        width: 22,
                        height: 22,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.5,
                          color: Colors.white,
                        ),
                      )
                    : const Text(
                        'Submit Delivery',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Reusable stepper field widget
// ---------------------------------------------------------------------------

class _StepperField extends StatelessWidget {
  const _StepperField({
    required this.label,
    required this.value,
    required this.onChanged,
    this.max,
    this.accentColor,
  });

  final String label;
  final int value;
  final int? max;
  final Color? accentColor;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final color = accentColor ?? AppColors.deliveryGreen;
    final canIncrement = max == null || value < max!;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _StepperButton(
          icon: Icons.remove,
          onPressed: value > 0 ? () => onChanged(value - 1) : null,
          color: color,
        ),
        Expanded(
          child: InkWell(
            onTap: () => _showManualInput(context),
            borderRadius: BorderRadius.circular(6),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Text(
                '$value',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: value > 0 ? color : AppColors.textSecondary,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.dotted,
                ),
              ),
            ),
          ),
        ),
        _StepperButton(
          icon: Icons.add,
          onPressed: canIncrement ? () => onChanged(value + 1) : null,
          color: color,
        ),
      ],
    );
  }

  Future<void> _showManualInput(BuildContext context) async {
    final controller = TextEditingController(text: '$value');
    final submitted = await showDialog<int>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Enter $label'),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          autofocus: true,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: const InputDecoration(
            hintText: '0',
            border: OutlineInputBorder(),
          ),
          onSubmitted: (_) =>
              Navigator.of(ctx).pop(int.tryParse(controller.text)),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () =>
                Navigator.of(ctx).pop(int.tryParse(controller.text)),
            child: const Text('Apply'),
          ),
        ],
      ),
    );

    if (submitted == null) return;
    var next = submitted < 0 ? 0 : submitted;
    if (max != null && next > max!) next = max!;
    onChanged(next);
  }
}

class _StepperButton extends StatelessWidget {
  const _StepperButton({
    required this.icon,
    required this.onPressed,
    required this.color,
  });

  final IconData icon;
  final VoidCallback? onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
      height: 30,
      child: IconButton.filled(
        onPressed: onPressed,
        icon: Icon(icon, size: 14),
        padding: EdgeInsets.zero,
        style: IconButton.styleFrom(
          backgroundColor: onPressed != null
              ? color.withValues(alpha: 0.12)
              : Colors.grey.shade100,
          foregroundColor: onPressed != null ? color : Colors.grey.shade400,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
      ),
    );
  }
}
