import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/enums.dart';
import '../../../core/network/api_result.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/utils/formatters.dart';
import '../data/models/admin_models.dart';
import '../providers/admin_providers.dart';

class AdminUsersScreen extends ConsumerStatefulWidget {
  const AdminUsersScreen({super.key});

  @override
  ConsumerState<AdminUsersScreen> createState() => _AdminUsersScreenState();
}

class _AdminUsersScreenState extends ConsumerState<AdminUsersScreen> {
  String? _roleFilter;

  @override
  Widget build(BuildContext context) {
    final usersAsync = ref.watch(usersListProvider(_roleFilter));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.invalidate(usersListProvider(_roleFilter)),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddUserDialog(context, ref),
        icon: const Icon(Icons.person_add),
        label: const Text('Add User'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
            child: Row(
              children: [
                const Text('Filter: '),
                const SizedBox(width: AppSpacing.sm),
                ChoiceChip(
                  label: const Text('All'),
                  selected: _roleFilter == null,
                  onSelected: (_) => setState(() => _roleFilter = null),
                ),
                const SizedBox(width: AppSpacing.xs),
                ...UserRole.values.map((role) => Padding(
                  padding: const EdgeInsets.only(right: AppSpacing.xs),
                  child: ChoiceChip(
                    label: Text(role.toJson()),
                    selected: _roleFilter == role.toJson(),
                    onSelected: (_) => setState(() => _roleFilter = role.toJson()),
                  ),
                )),
              ],
            ),
          ),
          Expanded(
            child: usersAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (_, _) => const Center(child: Text('Failed to load users')),
              data: (users) {
                if (users.isEmpty) {
                  return Center(
                    child: Text('No users found', style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary)),
                  );
                }
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: const [
                          DataColumn(label: Text('Email')),
                          DataColumn(label: Text('Name')),
                          DataColumn(label: Text('Role')),
                          DataColumn(label: Text('Active')),
                          DataColumn(label: Text('Created')),
                          DataColumn(label: Text('Actions')),
                        ],
                        rows: users.map((u) => DataRow(cells: [
                          DataCell(Text(u.googleEmail)),
                          DataCell(Text(u.displayName ?? '-')),
                          DataCell(_RoleBadge(role: u.role)),
                          DataCell(Icon(
                            u.isActive ? Icons.check_circle : Icons.cancel,
                            color: u.isActive ? AppColors.onlineGreen : AppColors.damageRed,
                            size: 18,
                          )),
                          DataCell(Text(Formatters.date(u.createdAt))),
                          DataCell(IconButton(
                            icon: const Icon(Icons.edit, size: 18),
                            tooltip: 'Edit User',
                            onPressed: () => _showEditUserDialog(context, ref, u),
                          )),
                        ])).toList(),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showAddUserDialog(BuildContext context, WidgetRef ref) async {
    final emailCtrl = TextEditingController();
    final nameCtrl = TextEditingController();
    final phoneCtrl = TextEditingController();
    final formKey = GlobalKey<FormState>();
    UserRole role = UserRole.serviceAgent;
    String? selectedHotelId;

    List<HotelResponse> hotels = const [];
    try {
      hotels = await ref.read(hotelsListProvider.future);
    } catch (_) {
      hotels = const [];
    }
    if (!context.mounted) return;

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setState) => AlertDialog(
          title: const Text('Add User'),
          content: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: emailCtrl,
                    decoration: const InputDecoration(labelText: 'Google Email *'),
                    validator: (v) {
                      if (v == null || v.trim().isEmpty) return 'Required';
                      if (!v.contains('@')) return 'Invalid email format';
                      return null;
                    },
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  TextFormField(
                    controller: nameCtrl,
                    decoration: const InputDecoration(labelText: 'Display Name'),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  DropdownButtonFormField<UserRole>(
                    initialValue: role,
                    decoration: const InputDecoration(labelText: 'Role'),
                    items: UserRole.values
                        .map((r) => DropdownMenuItem(value: r, child: Text(r.toJson())))
                        .toList(),
                    onChanged: (v) => setState(() => role = v!),
                  ),
                  if (role == UserRole.hotelAdmin) ...[
                    const SizedBox(height: AppSpacing.sm),
                    DropdownButtonFormField<String>(
                      initialValue: selectedHotelId,
                      decoration: const InputDecoration(labelText: 'Hotel *'),
                      validator: (v) => (v == null || v.isEmpty) ? 'Required for Hotel Admin' : null,
                      items: hotels
                          .map((h) => DropdownMenuItem(value: h.id, child: Text(h.name)))
                          .toList(),
                      onChanged: (v) => setState(() => selectedHotelId = v),
                    ),
                  ],
                  const SizedBox(height: AppSpacing.sm),
                  TextFormField(
                    controller: phoneCtrl,
                    decoration: const InputDecoration(labelText: 'Phone'),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.of(ctx).pop(), child: const Text('Cancel')),
            FilledButton(
              onPressed: () async {
                HapticFeedback.mediumImpact();
                if (!formKey.currentState!.validate()) return;
                if (role == UserRole.hotelAdmin && hotels.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('No hotels available. Create a hotel first.')),
                  );
                  return;
                }
                final request = UserCreateRequest(
                  googleEmail: emailCtrl.text.trim(),
                  displayName: nameCtrl.text.trim().isNotEmpty ? nameCtrl.text.trim() : null,
                  role: role,
                  phone: phoneCtrl.text.trim().isNotEmpty ? phoneCtrl.text.trim() : null,
                  hotelId: role == UserRole.hotelAdmin ? selectedHotelId : null,
                );
                final result = await ref.read(adminRepositoryProvider).createUser(request);
                if (!ctx.mounted) return;
                Navigator.of(ctx).pop();
                switch (result) {
                  case Success():
                    ref.invalidate(usersListProvider(_roleFilter));
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('User created')));
                  case Failure(exception: final e):
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
                }
              },
              child: const Text('Create'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showEditUserDialog(
    BuildContext context,
    WidgetRef ref,
    UserResponse user,
  ) async {
    final nameCtrl = TextEditingController(text: user.displayName ?? '');
    final phoneCtrl = TextEditingController(text: user.phone ?? '');
    UserRole role = user.role;
    bool isActive = user.isActive;
    String? selectedHotelId = user.hotelId;

    List<HotelResponse> hotels = const [];
    try {
      hotels = await ref.read(hotelsListProvider.future);
    } catch (_) {
      hotels = const [];
    }
    if (!context.mounted) return;

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setState) => AlertDialog(
          title: Text('Edit ${user.googleEmail}'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: nameCtrl,
                  decoration: const InputDecoration(labelText: 'Display Name'),
                ),
                const SizedBox(height: AppSpacing.sm),
                DropdownButtonFormField<UserRole>(
                  initialValue: role,
                  decoration: const InputDecoration(labelText: 'Role'),
                  items: UserRole.values
                      .map((r) => DropdownMenuItem(value: r, child: Text(r.toJson())))
                      .toList(),
                  onChanged: (v) => setState(() => role = v!),
                ),
                if (role == UserRole.hotelAdmin) ...[
                  const SizedBox(height: AppSpacing.sm),
                  DropdownButtonFormField<String>(
                    initialValue: selectedHotelId,
                    decoration: const InputDecoration(labelText: 'Hotel'),
                    items: hotels
                        .map((h) => DropdownMenuItem(value: h.id, child: Text(h.name)))
                        .toList(),
                    onChanged: (v) => setState(() => selectedHotelId = v),
                  ),
                ],
                const SizedBox(height: AppSpacing.sm),
                TextFormField(
                  controller: phoneCtrl,
                  decoration: const InputDecoration(labelText: 'Phone'),
                ),
                const SizedBox(height: AppSpacing.sm),
                SwitchListTile(
                  title: const Text('Active'),
                  value: isActive,
                  onChanged: (v) => setState(() => isActive = v),
                  contentPadding: EdgeInsets.zero,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.of(ctx).pop(), child: const Text('Cancel')),
            FilledButton(
              onPressed: () async {
                HapticFeedback.mediumImpact();
                final request = UserUpdateRequest(
                  displayName: nameCtrl.text.trim().isNotEmpty ? nameCtrl.text.trim() : null,
                  phone: phoneCtrl.text.trim().isNotEmpty ? phoneCtrl.text.trim() : null,
                  role: role != user.role ? role : null,
                  hotelId: role == UserRole.hotelAdmin ? selectedHotelId : null,
                  isActive: isActive != user.isActive ? isActive : null,
                );
                final result = await ref.read(adminRepositoryProvider).updateUser(user.id, request);
                if (!ctx.mounted) return;
                Navigator.of(ctx).pop();
                switch (result) {
                  case Success():
                    ref.invalidate(usersListProvider(_roleFilter));
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('User updated')));
                  case Failure(exception: final e):
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
                }
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

class _RoleBadge extends StatelessWidget {
  const _RoleBadge({required this.role});
  final UserRole role;

  @override
  Widget build(BuildContext context) {
    final color = switch (role) {
      UserRole.superAdmin => AppColors.damageRed,
      UserRole.hotelAdmin => AppColors.pickupBlue,
      UserRole.serviceAgent => AppColors.accent,
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppSpacing.chipRadius),
      ),
      child: Text(
        role.toJson(),
        style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.w600),
      ),
    );
  }
}
