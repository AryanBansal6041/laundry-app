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

class _EditableItemState {
  _EditableItemState({required this.qty, required this.damagedQty});
  int qty;
  int damagedQty;
}

class _EditableDeptState {
  _EditableDeptState({
    this.soiledWeight,
    this.freshWeight,
    required this.items,
  });

  double? soiledWeight;
  double? freshWeight;
  final Map<String, _EditableItemState> items;
}

class EditChallanScreen extends ConsumerStatefulWidget {
  const EditChallanScreen({
    super.key,
    required this.challanId,
    required this.hotelId,
    this.initialChallan,
  });

  final String challanId;
  final String hotelId;
  final ChallanResponse? initialChallan;

  @override
  ConsumerState<EditChallanScreen> createState() => _EditChallanScreenState();
}

class _EditChallanScreenState extends ConsumerState<EditChallanScreen> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, _EditableDeptState> _departments = {};
  bool _isSubmitting = false;
  String? _submitError;
  bool _initialized = false;

  void _initializeFromChallan(ChallanResponse challan) {
    if (_initialized) return;
    _initialized = true;
    for (final dept in challan.departments) {
      final state = _EditableDeptState(
        soiledWeight: double.tryParse(dept.soiledWeight ?? ''),
        freshWeight: double.tryParse(dept.freshWeight ?? ''),
        items: {
          for (final item in dept.items)
            item.itemId: _EditableItemState(
              qty: item.qty,
              damagedQty: item.damagedQty,
            ),
        },
      );
      _departments[dept.deptId] = state;
    }
  }

  Future<void> _submit(ChallanResponse challan) async {
    HapticFeedback.mediumImpact();
    if (!_formKey.currentState!.validate()) return;

    for (final dept in _departments.entries) {
      for (final item in dept.value.items.entries) {
        if (item.value.damagedQty > item.value.qty) {
          setState(() => _submitError = 'Damaged qty cannot exceed qty');
          return;
        }
      }
    }

    setState(() {
      _isSubmitting = true;
      _submitError = null;
    });

    final payload = ChallanEditRequest(
      departments: _departments.entries.map((deptEntry) {
        return ChallanDeptPayload(
          deptId: deptEntry.key,
          soiledWeight: deptEntry.value.soiledWeight,
          freshWeight: deptEntry.value.freshWeight,
          items: deptEntry.value.items.entries
              .map(
                (itemEntry) => ChallanItemPayload(
                  itemId: itemEntry.key,
                  qty: itemEntry.value.qty,
                  damagedQty: itemEntry.value.damagedQty,
                ),
              )
              .toList(),
        );
      }).toList(),
    );

    final result = await ref
        .read(agentRepositoryProvider)
        .editChallan(challan.id, payload);

    if (!mounted) return;
    setState(() => _isSubmitting = false);

    switch (result) {
      case Success():
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Challan updated successfully'),
            backgroundColor: AppColors.onlineGreen,
          ),
        );
        context.pop();
      case Failure(exception: final ex):
        setState(() => _submitError = ex.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    final schemaAsync = ref.watch(formSchemaProvider(widget.hotelId));
    final challanAsync = widget.initialChallan == null
        ? ref.watch(challanByIdProvider(widget.challanId))
        : AsyncValue.data(widget.initialChallan);

    return challanAsync.when(
      loading: () => Scaffold(
        appBar: AppBar(title: const Text('Edit Challan')),
        body: const Center(child: CircularProgressIndicator()),
      ),
      error: (error, stackTrace) => Scaffold(
        appBar: AppBar(title: const Text('Edit Challan')),
        body: const Center(child: Text('Failed to load challan')),
      ),
      data: (challan) {
        if (challan == null) {
          return Scaffold(
            appBar: AppBar(title: const Text('Edit Challan')),
            body: const Center(child: Text('Challan not found')),
          );
        }
        _initializeFromChallan(challan);
        final deptNames = _deptNames(schemaAsync);
        final itemNames = _itemNames(schemaAsync);

        return Scaffold(
          appBar: AppBar(title: Text('Edit ${challan.challanNumber}')),
          body: Form(
            key: _formKey,
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      ..._departments.entries.map((deptEntry) {
                        final deptId = deptEntry.key;
                        final deptState = deptEntry.value;
                        final billingType = _billingTypeFor(
                          schemaAsync,
                          deptId,
                        );
                        return Card(
                          margin: const EdgeInsets.only(bottom: 12),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  deptNames[deptId] ?? deptId,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                if (billingType == BillingType.weight) ...[
                                  TextFormField(
                                    initialValue: deptState.soiledWeight
                                        ?.toString(),
                                    decoration: const InputDecoration(
                                      labelText: 'Soiled Weight (kg)',
                                      isDense: true,
                                      border: OutlineInputBorder(),
                                    ),
                                    keyboardType:
                                        const TextInputType.numberWithOptions(
                                          decimal: true,
                                        ),
                                    onChanged: (v) => deptState.soiledWeight =
                                        double.tryParse(v),
                                  ),
                                  const SizedBox(height: 8),
                                  TextFormField(
                                    initialValue: deptState.freshWeight
                                        ?.toString(),
                                    decoration: const InputDecoration(
                                      labelText: 'Fresh Weight (kg)',
                                      isDense: true,
                                      border: OutlineInputBorder(),
                                    ),
                                    keyboardType:
                                        const TextInputType.numberWithOptions(
                                          decimal: true,
                                        ),
                                    onChanged: (v) => deptState.freshWeight =
                                        double.tryParse(v),
                                  ),
                                  const SizedBox(height: 8),
                                ],
                                ...deptState.items.entries.map((itemEntry) {
                                  final itemId = itemEntry.key;
                                  final itemState = itemEntry.value;
                                  return Row(
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: Text(
                                          itemNames[itemId] ?? itemId,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: _Stepper(
                                          value: itemState.qty,
                                          onChanged: (v) =>
                                              setState(() => itemState.qty = v),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: _Stepper(
                                          value: itemState.damagedQty,
                                          max: itemState.qty,
                                          color: AppColors.damageRed,
                                          onChanged: (v) => setState(
                                            () => itemState.damagedQty = v,
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                              ],
                            ),
                          ),
                        );
                      }),
                      if (_submitError != null)
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: AppColors.damageRed.withValues(alpha: 0.08),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            _submitError!,
                            style: const TextStyle(color: AppColors.damageRed),
                          ),
                        ),
                    ],
                  ),
                ),
                SafeArea(
                  top: false,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                    child: SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: FilledButton(
                        onPressed: _isSubmitting
                            ? null
                            : () => _submit(challan),
                        child: _isSubmitting
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2.2,
                                  color: Colors.white,
                                ),
                              )
                            : const Text('Save Changes'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Map<String, String> _deptNames(AsyncValue<FormSchemaResponse?> schemaAsync) {
    final schema = switch (schemaAsync) {
      AsyncData(:final value) => value,
      _ => null,
    };
    if (schema == null) return {};
    return {for (final d in schema.departments) d.deptId: d.name};
  }

  Map<String, String> _itemNames(AsyncValue<FormSchemaResponse?> schemaAsync) {
    final schema = switch (schemaAsync) {
      AsyncData(:final value) => value,
      _ => null,
    };
    if (schema == null) return {};
    final map = <String, String>{};
    for (final dept in schema.departments) {
      for (final item in dept.items) {
        map[item.itemId] = item.name;
      }
    }
    return map;
  }

  BillingType? _billingTypeFor(
    AsyncValue<FormSchemaResponse?> schemaAsync,
    String deptId,
  ) {
    final schema = switch (schemaAsync) {
      AsyncData(:final value) => value,
      _ => null,
    };
    if (schema == null) return null;
    for (final dept in schema.departments) {
      if (dept.deptId == deptId) return dept.billingType;
    }
    return null;
  }
}

class _Stepper extends StatelessWidget {
  const _Stepper({
    required this.value,
    required this.onChanged,
    this.max,
    this.color,
  });

  final int value;
  final int? max;
  final ValueChanged<int> onChanged;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final active = color ?? AppColors.primary;
    final canAdd = max == null || value < max!;
    return Row(
      children: [
        IconButton(
          onPressed: value > 0 ? () => onChanged(value - 1) : null,
          icon: const Icon(Icons.remove_circle_outline, size: 18),
          color: active,
        ),
        Expanded(child: Text('$value', textAlign: TextAlign.center)),
        IconButton(
          onPressed: canAdd ? () => onChanged(value + 1) : null,
          icon: const Icon(Icons.add_circle_outline, size: 18),
          color: active,
        ),
      ],
    );
  }
}
