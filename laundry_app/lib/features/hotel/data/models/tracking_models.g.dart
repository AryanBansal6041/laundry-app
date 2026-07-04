// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracking_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrackingItem _$TrackingItemFromJson(Map<String, dynamic> json) =>
    _TrackingItem(
      itemName: json['item_name'] as String,
      qtyInLaundry: (json['qty_in_laundry'] as num).toInt(),
      totalDamagedByLaundry: (json['total_damaged_by_laundry'] as num).toInt(),
      weightKg: (json['weight_kg'] as num).toDouble(),
    );

Map<String, dynamic> _$TrackingItemToJson(_TrackingItem instance) =>
    <String, dynamic>{
      'item_name': instance.itemName,
      'qty_in_laundry': instance.qtyInLaundry,
      'total_damaged_by_laundry': instance.totalDamagedByLaundry,
      'weight_kg': instance.weightKg,
    };

_TrackingDepartment _$TrackingDepartmentFromJson(Map<String, dynamic> json) =>
    _TrackingDepartment(
      deptName: json['dept_name'] as String,
      totalWeightKg: (json['total_weight_kg'] as num).toDouble(),
      items: (json['items'] as List<dynamic>)
          .map((e) => TrackingItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TrackingDepartmentToJson(_TrackingDepartment instance) =>
    <String, dynamic>{
      'dept_name': instance.deptName,
      'total_weight_kg': instance.totalWeightKg,
      'items': instance.items,
    };

_LiveTrackingResponse _$LiveTrackingResponseFromJson(
  Map<String, dynamic> json,
) => _LiveTrackingResponse(
  hotelId: json['hotel_id'] as String,
  departments: (json['departments'] as List<dynamic>)
      .map((e) => TrackingDepartment.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$LiveTrackingResponseToJson(
  _LiveTrackingResponse instance,
) => <String, dynamic>{
  'hotel_id': instance.hotelId,
  'departments': instance.departments,
};
