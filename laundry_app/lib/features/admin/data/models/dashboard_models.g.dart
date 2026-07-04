// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SuperAdminRecentChallan _$SuperAdminRecentChallanFromJson(
  Map<String, dynamic> json,
) => _SuperAdminRecentChallan(
  challanId: json['challan_id'] as String,
  challanNumber: json['challan_number'] as String,
  challanType: json['challan_type'] as String,
  hotelName: json['hotel_name'] as String?,
  agentName: json['agent_name'] as String?,
  entryTimestamp: DateTime.parse(json['entry_timestamp'] as String),
);

Map<String, dynamic> _$SuperAdminRecentChallanToJson(
  _SuperAdminRecentChallan instance,
) => <String, dynamic>{
  'challan_id': instance.challanId,
  'challan_number': instance.challanNumber,
  'challan_type': instance.challanType,
  'hotel_name': instance.hotelName,
  'agent_name': instance.agentName,
  'entry_timestamp': instance.entryTimestamp.toIso8601String(),
};

_SuperAdminDashboardResponse _$SuperAdminDashboardResponseFromJson(
  Map<String, dynamic> json,
) => _SuperAdminDashboardResponse(
  totalItemsInLaundry: (json['total_items_in_laundry'] as num).toInt(),
  totalWeightInLaundryKg: (json['total_weight_in_laundry_kg'] as num)
      .toDouble(),
  totalHotels: (json['total_hotels'] as num).toInt(),
  recentChallans: (json['recent_challans'] as List<dynamic>)
      .map((e) => SuperAdminRecentChallan.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$SuperAdminDashboardResponseToJson(
  _SuperAdminDashboardResponse instance,
) => <String, dynamic>{
  'total_items_in_laundry': instance.totalItemsInLaundry,
  'total_weight_in_laundry_kg': instance.totalWeightInLaundryKg,
  'total_hotels': instance.totalHotels,
  'recent_challans': instance.recentChallans,
};
