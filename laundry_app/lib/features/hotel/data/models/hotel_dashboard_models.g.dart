// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_dashboard_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HotelDashboardRecentChallan _$HotelDashboardRecentChallanFromJson(
  Map<String, dynamic> json,
) => _HotelDashboardRecentChallan(
  challanId: json['challan_id'] as String,
  challanNumber: json['challan_number'] as String,
  challanType: json['challan_type'] as String,
  agentName: json['agent_name'] as String?,
  entryTimestamp: DateTime.parse(json['entry_timestamp'] as String),
);

Map<String, dynamic> _$HotelDashboardRecentChallanToJson(
  _HotelDashboardRecentChallan instance,
) => <String, dynamic>{
  'challan_id': instance.challanId,
  'challan_number': instance.challanNumber,
  'challan_type': instance.challanType,
  'agent_name': instance.agentName,
  'entry_timestamp': instance.entryTimestamp.toIso8601String(),
};

_HotelDashboardLiveTracking _$HotelDashboardLiveTrackingFromJson(
  Map<String, dynamic> json,
) => _HotelDashboardLiveTracking(
  totalItemsInLaundry: (json['total_items_in_laundry'] as num).toInt(),
  totalWeightInLaundryKg: (json['total_weight_in_laundry_kg'] as num)
      .toDouble(),
  departments: (json['departments'] as List<dynamic>)
      .map((e) => TrackingDepartment.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$HotelDashboardLiveTrackingToJson(
  _HotelDashboardLiveTracking instance,
) => <String, dynamic>{
  'total_items_in_laundry': instance.totalItemsInLaundry,
  'total_weight_in_laundry_kg': instance.totalWeightInLaundryKg,
  'departments': instance.departments,
};

_HotelDashboardResponse _$HotelDashboardResponseFromJson(
  Map<String, dynamic> json,
) => _HotelDashboardResponse(
  hotelId: json['hotel_id'] as String,
  liveTracking: HotelDashboardLiveTracking.fromJson(
    json['live_tracking'] as Map<String, dynamic>,
  ),
  recentChallans: (json['recent_challans'] as List<dynamic>)
      .map(
        (e) => HotelDashboardRecentChallan.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  pendingDeliveriesCount: (json['pending_deliveries_count'] as num).toInt(),
  pendingDeliveries: json['pending_deliveries'] as List<dynamic>,
);

Map<String, dynamic> _$HotelDashboardResponseToJson(
  _HotelDashboardResponse instance,
) => <String, dynamic>{
  'hotel_id': instance.hotelId,
  'live_tracking': instance.liveTracking,
  'recent_challans': instance.recentChallans,
  'pending_deliveries_count': instance.pendingDeliveriesCount,
  'pending_deliveries': instance.pendingDeliveries,
};
