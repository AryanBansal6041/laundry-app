import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/enums.dart';
import '../../../core/network/api_result.dart';
import '../../../core/theme/app_colors.dart';
import '../../challans/data/models/challan_models.dart';
import '../../setup/data/models/setup_models.dart';
import '../providers/agent_providers.dart';

// ---------------------------------------------------------------------------
// Local form state helpers
// ---------------------------------------------------------------------------

class _ItemFormState {
  int qty = 0;
  int damagedQty = 0;
}

class _DeptFormState {
  double? soiledWeight;
  String searchQuery;
  bool isExpanded;
  final Map<String, _ItemFormState> items;

  _DeptFormState()
    : soiledWeight = null,
      searchQuery = '',
      isExpanded = true,
      items = {};

  int get totalPieces => items.values.fold(0, (sum, item) => sum + item.qty);

  int get totalDamaged =>
      items.values.fold(0, (sum, item) => sum + item.damagedQty);
}

// ---------------------------------------------------------------------------
// PickupFormScreen
// ---------------------------------------------------------------------------

class PickupFormScreen extends ConsumerStatefulWidget {
  const PickupFormScreen({super.key, required this.hotelId});

  final String hotelId;

  @override
  ConsumerState<PickupFormScreen> createState() => _PickupFormScreenState();
}

class _PickupFormScreenState extends ConsumerState<PickupFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _challanController = TextEditingController();
  final _scrollController = ScrollController();

  final Map<String, _DeptFormState> _departments = {};
  List<FormSchemaDepartment> _schemaDepts = [];

  bool _isSubmitting = false;
  String? _submitError;

  @override
  void dispose() {
    _challanController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  // --- Computed totals ---

  int get _grandTotalPieces =>
      _departments.values.fold(0, (sum, d) => sum + d.totalPieces);

  int get _grandTotalDamaged =>
      _departments.values.fold(0, (sum, d) => sum + d.totalDamaged);

  // --- Schema lookup ---

  FormSchemaDepartment? _schemaDept(String deptId) {
    for (final d in _schemaDepts) {
      if (d.deptId == deptId) return d;
    }
    return null;
  }

  List<FormSchemaDepartment> get _availableDepts {
    return _schemaDepts
        .where((d) => !_departments.containsKey(d.deptId))
        .toList();
  }

  // --- Actions ---

  void _addDepartment(FormSchemaDepartment dept) {
    setState(() {
      final state = _DeptFormState();
      for (final item in dept.items) {
        state.items[item.itemId] = _ItemFormState();
      }
      _departments[dept.deptId] = state;
    });
  }

  void _removeDepartment(String deptId) {
    setState(() => _departments.remove(deptId));
  }

  void _showAddDepartmentSheet() {
    final available = _availableDepts;
    if (available.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('All departments have been added')),
      );
      return;
    }

    showModalBottomSheet(
      context: context,
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Text(
                'Add Department',
                style: Theme.of(
                  ctx,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            const Divider(height: 1),
            ...available.map(
              (dept) => ListTile(
                title: Text(dept.name),
                trailing: _billingBadge(dept.billingType),
                onTap: () {
                  Navigator.pop(ctx);
                  _addDepartment(dept);
                },
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  // --- Validation ---

  String? _validateForm() {
    if (_challanController.text.trim().isEmpty) {
      return 'Challan number is required';
    }
    if (_departments.isEmpty) {
      return 'Add at least one department';
    }
    bool hasItems = false;
    for (final entry in _departments.entries) {
      final deptState = entry.value;
      for (final itemEntry in deptState.items.entries) {
        final item = itemEntry.value;
        if (item.qty > 0) hasItems = true;
        if (item.damagedQty > item.qty) {
          final dept = _schemaDept(entry.key);
          final itemSchema = dept?.items
              .where((i) => i.itemId == itemEntry.key)
              .firstOrNull;
          return 'Damaged qty exceeds qty for "${itemSchema?.name ?? itemEntry.key}" in ${dept?.name ?? entry.key}';
        }
      }
    }
    if (!hasItems) {
      return 'At least one item must have qty > 0';
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
    });

    final deptPayloads = <ChallanDeptPayload>[];
    for (final entry in _departments.entries) {
      final deptState = entry.value;
      final itemPayloads = <ChallanItemPayload>[];
      for (final itemEntry in deptState.items.entries) {
        final item = itemEntry.value;
        if (item.qty > 0 || item.damagedQty > 0) {
          itemPayloads.add(
            ChallanItemPayload(
              itemId: itemEntry.key,
              qty: item.qty,
              damagedQty: item.damagedQty,
            ),
          );
        }
      }
      deptPayloads.add(
        ChallanDeptPayload(
          deptId: entry.key,
          soiledWeight: deptState.soiledWeight,
          items: itemPayloads,
        ),
      );
    }

    final request = PickupSubmitRequest(
      challanNumber: _challanController.text.trim(),
      hotelId: widget.hotelId,
      departments: deptPayloads,
    );

    final result = await ref
        .read(agentRepositoryProvider)
        .submitPickup(request);

    if (!mounted) return;

    setState(() => _isSubmitting = false);

    switch (result) {
      case Success(data: final challan):
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Pickup ${challan.challanNumber} submitted successfully',
            ),
            backgroundColor: AppColors.onlineGreen,
          ),
        );
        if (context.mounted) context.pop();

      case Failure(exception: final exception):
        final message = switch (exception) {
          ConflictException(:final message) => message,
          ValidationException(:final message) => message,
          NetworkException() => 'No internet connection. Please try again.',
          _ => exception.message,
        };
        setState(() => _submitError = message);
    }
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

  Widget _weightSourceBadge(WeightSource source) {
    final (label, color) = switch (source) {
      WeightSource.soiled => ('SOILED', AppColors.soiledChip),
      WeightSource.calculated => ('CALCULATED', AppColors.calculatedChip),
      WeightSource.fresh => ('FRESH', AppColors.freshChip),
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }

  // --- Item row ---

  Widget _buildItemRow(
    String deptId,
    FormSchemaItem schemaItem,
    _ItemFormState itemState,
  ) {
    final onSurface = Theme.of(context).colorScheme.onSurface;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              schemaItem.name,
              style: TextStyle(fontSize: 14, color: onSurface),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 8),
          // Qty stepper
          Expanded(
            flex: 3,
            child: _StepperField(
              label: 'Qty',
              value: itemState.qty,
              onChanged: (v) => setState(() => itemState.qty = v),
            ),
          ),
          const SizedBox(width: 8),
          // Damaged stepper
          Expanded(
            flex: 3,
            child: _StepperField(
              label: 'Dmg',
              value: itemState.damagedQty,
              max: itemState.qty,
              accentColor: AppColors.damageRed,
              onChanged: (v) => setState(() => itemState.damagedQty = v),
            ),
          ),
        ],
      ),
    );
  }

  // --- Department card ---

  Widget _buildDepartmentCard(String deptId, _DeptFormState deptState) {
    final schema = _schemaDept(deptId);
    if (schema == null) return const SizedBox.shrink();

    final isWeight = schema.billingType == BillingType.weight;
    final query = deptState.searchQuery.toLowerCase();

    final filteredItems = schema.items.where((item) {
      if (query.isEmpty) {
        final state = deptState.items[item.itemId];
        return state != null && (state.qty > 0 || state.damagedQty > 0) ||
            query.isEmpty;
      }
      return item.name.toLowerCase().contains(query);
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
                      schema.name,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ),
                  _billingBadge(schema.billingType),
                  if (schema.weightSource != null) ...[
                    const SizedBox(width: 6),
                    _weightSourceBadge(schema.weightSource!),
                  ],
                  const SizedBox(width: 8),
                  InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () => _removeDepartment(deptId),
                    child: const Padding(
                      padding: EdgeInsets.all(4),
                      child: Icon(
                        Icons.close,
                        size: 18,
                        color: AppColors.damageRed,
                      ),
                    ),
                  ),
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
                  // Soiled weight for WEIGHT departments
                  if (isWeight)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: TextFormField(
                        initialValue: deptState.soiledWeight?.toString(),
                        decoration: const InputDecoration(
                          labelText: 'Soiled Weight',
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
                          deptState.soiledWeight = double.tryParse(v);
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
                          'Qty',
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
                  ...filteredItems.map((schemaItem) {
                    final itemState = deptState.items.putIfAbsent(
                      schemaItem.itemId,
                      () => _ItemFormState(),
                    );
                    return _buildItemRow(deptId, schemaItem, itemState);
                  }),

                  if (filteredItems.isEmpty)
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
                    'Pieces: ${deptState.totalPieces}',
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('New Pickup'),
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

          return Form(
            key: _formKey,
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    controller: _scrollController,
                    padding: const EdgeInsets.all(16),
                    children: [
                      // Challan number
                      TextFormField(
                        controller: _challanController,
                        decoration: const InputDecoration(
                          labelText: 'Challan Number',
                          hintText: 'e.g. CN-001',
                          prefixIcon: Icon(Icons.receipt_long),
                          border: OutlineInputBorder(),
                        ),
                        textInputAction: TextInputAction.next,
                        validator: (v) => (v == null || v.trim().isEmpty)
                            ? 'Challan number is required'
                            : null,
                      ),
                      const SizedBox(height: 16),

                      // Add department button
                      OutlinedButton.icon(
                        onPressed: _showAddDepartmentSheet,
                        icon: const Icon(Icons.add),
                        label: Text(
                          _departments.isEmpty
                              ? 'Add Department'
                              : 'Add Another Department'
                                    ' (${_availableDepts.length} available)',
                        ),
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size.fromHeight(44),
                        ),
                      ),
                      const SizedBox(height: 12),

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
                              color: AppColors.damageRed.withValues(
                                alpha: 0.08,
                              ),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: AppColors.damageRed.withValues(
                                  alpha: 0.3,
                                ),
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
        },
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
                      'Total Pieces: $_grandTotalPieces',
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
                onPressed: _isSubmitting ? null : _submit,
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.pickupBlue,
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
                        'Submit Pickup',
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
    final color = accentColor ?? AppColors.pickupBlue;
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
