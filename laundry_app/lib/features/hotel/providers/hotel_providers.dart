import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/api_result.dart';
import '../../auth/providers/auth_providers.dart';
import '../../challans/data/models/challan_models.dart';
import '../../reports/data/models/billing_models.dart';
import '../data/hotel_repository.dart';
import '../data/models/damage_models.dart';
import '../data/models/hotel_dashboard_models.dart';
import '../data/models/tracking_models.dart';

// ---------------------------------------------------------------------------
// Core
// ---------------------------------------------------------------------------

final hotelRepositoryProvider = Provider<HotelRepository>((ref) {
  return HotelRepository(dioClient: ref.watch(dioClientProvider));
});

/// The hotel admin's own hotel ID, extracted from JWT.
final hotelAdminHotelIdProvider = Provider<String>((ref) {
  final id = ref.watch(currentHotelIdProvider);
  if (id == null || id.isEmpty) {
    throw StateError('Hotel admin must have a hotel_id in their JWT');
  }
  return id;
});

// ---------------------------------------------------------------------------
// Aggregated Hotel Dashboard (single API call)
// ---------------------------------------------------------------------------

final hotelDashboardProvider =
    FutureProvider.autoDispose<HotelDashboardResponse?>((ref) async {
  final hotelId = ref.watch(hotelAdminHotelIdProvider);
  final repo = ref.watch(hotelRepositoryProvider);
  final result = await repo.getDashboard(hotelId);
  return switch (result) {
    Success(data: final data) => data,
    Failure() => null,
  };
});

// ---------------------------------------------------------------------------
// Live Tracking (standalone — used by Live Inventory screen)
// ---------------------------------------------------------------------------

final liveTrackingProvider =
    FutureProvider.autoDispose<LiveTrackingResponse?>((ref) async {
  final hotelId = ref.watch(hotelAdminHotelIdProvider);
  final repo = ref.watch(hotelRepositoryProvider);
  final result = await repo.getLiveTracking(hotelId);
  return switch (result) {
    Success(data: final data) => data,
    Failure() => null,
  };
});

// ---------------------------------------------------------------------------
// Challan history (paginated, with filters)
// ---------------------------------------------------------------------------

final hotelChallanHistoryProvider = FutureProvider.autoDispose
    .family<PaginatedChallanResponse, HotelChallanHistoryParams>(
        (ref, params) async {
  final hotelId = ref.watch(hotelAdminHotelIdProvider);
  final repo = ref.watch(hotelRepositoryProvider);
  final result = await repo.getChallanHistory(
    hotelId,
    page: params.page,
    pageSize: params.pageSize,
    deptId: params.deptId,
    challanType: params.challanType,
    startDate: params.startDate,
    endDate: params.endDate,
  );
  return switch (result) {
    Success(data: final data) => data,
    Failure() => const PaginatedChallanResponse(
        total: 0, page: 1, pageSize: 20, items: []),
  };
});

// ---------------------------------------------------------------------------
// Pending deliveries
// ---------------------------------------------------------------------------

final hotelPendingDeliveriesProvider =
    FutureProvider.autoDispose<List<ChallanResponse>>((ref) async {
  final hotelId = ref.watch(hotelAdminHotelIdProvider);
  final repo = ref.watch(hotelRepositoryProvider);
  final result = await repo.getPendingDeliveries(hotelId);
  return switch (result) {
    Success(data: final list) => list,
    Failure() => <ChallanResponse>[],
  };
});

// ---------------------------------------------------------------------------
// Damage report
// ---------------------------------------------------------------------------

final hotelDamageReportProvider = FutureProvider.autoDispose
    .family<DamageReportResponse?, DamageReportParams>((ref, params) async {
  final hotelId = ref.watch(hotelAdminHotelIdProvider);
  final repo = ref.watch(hotelRepositoryProvider);
  final result = await repo.getDamageReport(
    hotelId: hotelId,
    startDate: params.startDate,
    endDate: params.endDate,
    minDamage: params.minDamage,
  );
  return switch (result) {
    Success(data: final data) => data,
    Failure() => null,
  };
});

// ---------------------------------------------------------------------------
// Billing
// ---------------------------------------------------------------------------

final hotelBillingProvider = FutureProvider.autoDispose
    .family<BillingResponse?, BillingParams>((ref, params) async {
  final hotelId = ref.watch(hotelAdminHotelIdProvider);
  final repo = ref.watch(hotelRepositoryProvider);
  final result = await repo.getBilling(
    startDate: params.startDate,
    endDate: params.endDate,
    hotelId: hotelId,
    weightMode: params.weightMode,
  );
  return switch (result) {
    Success(data: final data) => data,
    Failure() => null,
  };
});

final hotelDetailedBillingProvider = FutureProvider.autoDispose
    .family<DetailedBillingResponse?, BillingParams>((ref, params) async {
  final hotelId = ref.watch(hotelAdminHotelIdProvider);
  final repo = ref.watch(hotelRepositoryProvider);
  final result = await repo.getDetailedBilling(
    startDate: params.startDate,
    endDate: params.endDate,
    hotelId: hotelId,
    weightMode: params.weightMode,
  );
  return switch (result) {
    Success(data: final data) => data,
    Failure() => null,
  };
});

// ---------------------------------------------------------------------------
// Param classes
// ---------------------------------------------------------------------------

class HotelChallanHistoryParams {
  const HotelChallanHistoryParams({
    this.page = 1,
    this.pageSize = 20,
    this.deptId,
    this.challanType,
    this.startDate,
    this.endDate,
  });

  final int page;
  final int pageSize;
  final String? deptId;
  final String? challanType;
  final String? startDate;
  final String? endDate;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HotelChallanHistoryParams &&
          page == other.page &&
          pageSize == other.pageSize &&
          deptId == other.deptId &&
          challanType == other.challanType &&
          startDate == other.startDate &&
          endDate == other.endDate;

  @override
  int get hashCode =>
      Object.hash(page, pageSize, deptId, challanType, startDate, endDate);
}

class DamageReportParams {
  const DamageReportParams({this.startDate, this.endDate, this.minDamage});

  final String? startDate;
  final String? endDate;
  final int? minDamage;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DamageReportParams &&
          startDate == other.startDate &&
          endDate == other.endDate &&
          minDamage == other.minDamage;

  @override
  int get hashCode => Object.hash(startDate, endDate, minDamage);
}

class BillingParams {
  const BillingParams({
    required this.startDate,
    required this.endDate,
    this.weightMode,
  });

  final String startDate;
  final String endDate;
  final String? weightMode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BillingParams &&
          startDate == other.startDate &&
          endDate == other.endDate &&
          weightMode == other.weightMode;

  @override
  int get hashCode => Object.hash(startDate, endDate, weightMode);
}
