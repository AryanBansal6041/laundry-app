import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_models.freezed.dart';
part 'dashboard_models.g.dart';

@freezed
abstract class SuperAdminRecentChallan with _$SuperAdminRecentChallan {
  const factory SuperAdminRecentChallan({
    @JsonKey(name: 'challan_id') required String challanId,
    @JsonKey(name: 'challan_number') required String challanNumber,
    @JsonKey(name: 'challan_type') required String challanType,
    @JsonKey(name: 'hotel_name') String? hotelName,
    @JsonKey(name: 'agent_name') String? agentName,
    @JsonKey(name: 'entry_timestamp') required DateTime entryTimestamp,
  }) = _SuperAdminRecentChallan;

  factory SuperAdminRecentChallan.fromJson(Map<String, dynamic> json) =>
      _$SuperAdminRecentChallanFromJson(json);
}

@freezed
abstract class SuperAdminDashboardResponse with _$SuperAdminDashboardResponse {
  const factory SuperAdminDashboardResponse({
    @JsonKey(name: 'total_items_in_laundry') required int totalItemsInLaundry,
    @JsonKey(name: 'total_weight_in_laundry_kg')
    required double totalWeightInLaundryKg,
    @JsonKey(name: 'total_hotels') required int totalHotels,
    @JsonKey(name: 'recent_challans')
    required List<SuperAdminRecentChallan> recentChallans,
  }) = _SuperAdminDashboardResponse;

  factory SuperAdminDashboardResponse.fromJson(Map<String, dynamic> json) =>
      _$SuperAdminDashboardResponseFromJson(json);
}
