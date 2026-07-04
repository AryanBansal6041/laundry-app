import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/api_result.dart';
import '../../auth/providers/auth_providers.dart';
import '../../reports/data/models/billing_models.dart';
import '../../hotel/data/models/damage_models.dart';
import '../../setup/data/models/setup_models.dart';
import '../../setup/data/setup_repository.dart';
import '../data/admin_repository.dart';
import '../data/models/admin_models.dart';
import '../data/models/dashboard_models.dart';

// ---------------------------------------------------------------------------
// Repositories
// ---------------------------------------------------------------------------

final adminRepositoryProvider = Provider<AdminRepository>((ref) {
  return AdminRepository(dioClient: ref.watch(dioClientProvider));
});

final setupRepositoryProvider = Provider<SetupRepository>((ref) {
  return SetupRepository(dioClient: ref.watch(dioClientProvider));
});

// ---------------------------------------------------------------------------
// Dashboard
// ---------------------------------------------------------------------------

final superAdminDashboardProvider =
    FutureProvider.autoDispose<SuperAdminDashboardResponse?>((ref) async {
  final repo = ref.watch(adminRepositoryProvider);
  final result = await repo.getDashboard();
  return switch (result) {
    Success(data: final data) => data,
    Failure() => null,
  };
});

// ---------------------------------------------------------------------------
// Hotels
// ---------------------------------------------------------------------------

final hotelsListProvider =
    FutureProvider.autoDispose<List<HotelResponse>>((ref) async {
  final repo = ref.watch(adminRepositoryProvider);
  final result = await repo.listHotels();
  return switch (result) {
    Success(data: final list) => list,
    Failure() => <HotelResponse>[],
  };
});

// ---------------------------------------------------------------------------
// Users
// ---------------------------------------------------------------------------

final usersListProvider = FutureProvider.autoDispose
    .family<List<UserResponse>, String?>((ref, roleFilter) async {
  final repo = ref.watch(adminRepositoryProvider);
  final result = await repo.listUsers(role: roleFilter);
  return switch (result) {
    Success(data: final list) => list,
    Failure() => <UserResponse>[],
  };
});

// ---------------------------------------------------------------------------
// Mappings
// ---------------------------------------------------------------------------

final mappingsListProvider =
    FutureProvider.autoDispose<List<MappingResponse>>((ref) async {
  final repo = ref.watch(adminRepositoryProvider);
  final result = await repo.listMappings();
  return switch (result) {
    Success(data: final list) => list,
    Failure() => <MappingResponse>[],
  };
});

// ---------------------------------------------------------------------------
// Items Master
// ---------------------------------------------------------------------------

final itemsListProvider =
    FutureProvider.autoDispose<List<ItemResponse>>((ref) async {
  final repo = ref.watch(setupRepositoryProvider);
  final result = await repo.listItems();
  return switch (result) {
    Success(data: final list) => list,
    Failure() => <ItemResponse>[],
  };
});

// ---------------------------------------------------------------------------
// Form Schema (for hotel detail)
// ---------------------------------------------------------------------------

final adminFormSchemaProvider = FutureProvider.autoDispose
    .family<FormSchemaResponse?, String>((ref, hotelId) async {
  final repo = ref.watch(setupRepositoryProvider);
  final result = await repo.getFormSchema(hotelId);
  return switch (result) {
    Success(data: final data) => data,
    Failure() => null,
  };
});

// ---------------------------------------------------------------------------
// Damage Report (all hotels)
// ---------------------------------------------------------------------------

final adminDamageReportProvider = FutureProvider.autoDispose
    .family<DamageReportResponse?, AdminDamageParams>((ref, params) async {
  final dioClient = ref.watch(dioClientProvider);
  final queryParams = <String, dynamic>{};
  if (params.hotelId != null) queryParams['hotel_id'] = params.hotelId;
  if (params.startDate != null) queryParams['start_date'] = params.startDate;
  if (params.endDate != null) queryParams['end_date'] = params.endDate;
  if (params.minDamage != null) queryParams['min_damage'] = params.minDamage;

  final result = await dioClient.get(
    '/api/v1/quality-control/damages',
    queryParameters: queryParams.isEmpty ? null : queryParams,
    parser: (data) =>
        DamageReportResponse.fromJson(data as Map<String, dynamic>),
  );
  return switch (result) {
    Success(data: final data) => data,
    Failure() => null,
  };
});

// ---------------------------------------------------------------------------
// Billing (all hotels)
// ---------------------------------------------------------------------------

final adminBillingProvider = FutureProvider.autoDispose
    .family<BillingResponse?, AdminBillingParams>((ref, params) async {
  final dioClient = ref.watch(dioClientProvider);
  final queryParams = <String, dynamic>{
    'start_date': params.startDate,
    'end_date': params.endDate,
  };
  if (params.hotelId != null) queryParams['hotel_id'] = params.hotelId;
  if (params.weightMode != null) queryParams['weight_mode'] = params.weightMode;

  final result = await dioClient.get(
    '/api/v1/reports/billing',
    queryParameters: queryParams,
    parser: (data) =>
        BillingResponse.fromJson(data as Map<String, dynamic>),
  );
  return switch (result) {
    Success(data: final data) => data,
    Failure() => null,
  };
});

final adminDetailedBillingProvider = FutureProvider.autoDispose
    .family<DetailedBillingResponse?, AdminBillingParams>(
        (ref, params) async {
  final dioClient = ref.watch(dioClientProvider);
  final queryParams = <String, dynamic>{
    'start_date': params.startDate,
    'end_date': params.endDate,
    'view': 'detailed',
  };
  if (params.hotelId != null) queryParams['hotel_id'] = params.hotelId;
  if (params.weightMode != null) queryParams['weight_mode'] = params.weightMode;

  final result = await dioClient.get(
    '/api/v1/reports/billing',
    queryParameters: queryParams,
    parser: (data) =>
        DetailedBillingResponse.fromJson(data as Map<String, dynamic>),
  );
  return switch (result) {
    Success(data: final data) => data,
    Failure() => null,
  };
});

// ---------------------------------------------------------------------------
// Param classes
// ---------------------------------------------------------------------------

class AdminDamageParams {
  const AdminDamageParams({this.hotelId, this.startDate, this.endDate, this.minDamage});
  final String? hotelId;
  final String? startDate;
  final String? endDate;
  final int? minDamage;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AdminDamageParams &&
          hotelId == other.hotelId &&
          startDate == other.startDate &&
          endDate == other.endDate &&
          minDamage == other.minDamage;

  @override
  int get hashCode => Object.hash(hotelId, startDate, endDate, minDamage);
}

class AdminBillingParams {
  const AdminBillingParams({
    required this.startDate,
    required this.endDate,
    this.hotelId,
    this.weightMode,
  });
  final String startDate;
  final String endDate;
  final String? hotelId;
  final String? weightMode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AdminBillingParams &&
          startDate == other.startDate &&
          endDate == other.endDate &&
          hotelId == other.hotelId &&
          weightMode == other.weightMode;

  @override
  int get hashCode => Object.hash(startDate, endDate, hotelId, weightMode);
}
