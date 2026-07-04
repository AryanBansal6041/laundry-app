import 'package:freezed_annotation/freezed_annotation.dart';

import 'tracking_models.dart';

part 'hotel_dashboard_models.freezed.dart';
part 'hotel_dashboard_models.g.dart';

@freezed
abstract class HotelDashboardRecentChallan with _$HotelDashboardRecentChallan {
  const factory HotelDashboardRecentChallan({
    @JsonKey(name: 'challan_id') required String challanId,
    @JsonKey(name: 'challan_number') required String challanNumber,
    @JsonKey(name: 'challan_type') required String challanType,
    @JsonKey(name: 'agent_name') String? agentName,
    @JsonKey(name: 'entry_timestamp') required DateTime entryTimestamp,
  }) = _HotelDashboardRecentChallan;

  factory HotelDashboardRecentChallan.fromJson(Map<String, dynamic> json) =>
      _$HotelDashboardRecentChallanFromJson(json);
}

@freezed
abstract class HotelDashboardLiveTracking with _$HotelDashboardLiveTracking {
  const factory HotelDashboardLiveTracking({
    @JsonKey(name: 'total_items_in_laundry') required int totalItemsInLaundry,
    @JsonKey(name: 'total_weight_in_laundry_kg')
    required double totalWeightInLaundryKg,
    required List<TrackingDepartment> departments,
  }) = _HotelDashboardLiveTracking;

  factory HotelDashboardLiveTracking.fromJson(Map<String, dynamic> json) =>
      _$HotelDashboardLiveTrackingFromJson(json);
}

@freezed
abstract class HotelDashboardResponse with _$HotelDashboardResponse {
  const factory HotelDashboardResponse({
    @JsonKey(name: 'hotel_id') required String hotelId,
    @JsonKey(name: 'live_tracking')
    required HotelDashboardLiveTracking liveTracking,
    @JsonKey(name: 'recent_challans')
    required List<HotelDashboardRecentChallan> recentChallans,
    @JsonKey(name: 'pending_deliveries_count')
    required int pendingDeliveriesCount,
    @JsonKey(name: 'pending_deliveries')
    required List<dynamic> pendingDeliveries,
  }) = _HotelDashboardResponse;

  factory HotelDashboardResponse.fromJson(Map<String, dynamic> json) =>
      _$HotelDashboardResponseFromJson(json);
}
