// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'damage_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DamageSummaryItem _$DamageSummaryItemFromJson(Map<String, dynamic> json) =>
    _DamageSummaryItem(
      hotelId: json['hotel_id'] as String,
      hotelName: json['hotel_name'] as String,
      itemId: json['item_id'] as String,
      itemName: json['item_name'] as String,
      netDamage: (json['net_damage'] as num).toInt(),
    );

Map<String, dynamic> _$DamageSummaryItemToJson(_DamageSummaryItem instance) =>
    <String, dynamic>{
      'hotel_id': instance.hotelId,
      'hotel_name': instance.hotelName,
      'item_id': instance.itemId,
      'item_name': instance.itemName,
      'net_damage': instance.netDamage,
    };

_AllTimeDamageItem _$AllTimeDamageItemFromJson(Map<String, dynamic> json) =>
    _AllTimeDamageItem(
      hotelId: json['hotel_id'] as String,
      hotelName: json['hotel_name'] as String,
      itemId: json['item_id'] as String,
      itemName: json['item_name'] as String,
      totalDamagedByLaundry: (json['total_damaged_by_laundry'] as num).toInt(),
    );

Map<String, dynamic> _$AllTimeDamageItemToJson(_AllTimeDamageItem instance) =>
    <String, dynamic>{
      'hotel_id': instance.hotelId,
      'hotel_name': instance.hotelName,
      'item_id': instance.itemId,
      'item_name': instance.itemName,
      'total_damaged_by_laundry': instance.totalDamagedByLaundry,
    };

_DamageReportResponse _$DamageReportResponseFromJson(
  Map<String, dynamic> json,
) => _DamageReportResponse(
  challanDamageSummary: (json['challan_damage_summary'] as List<dynamic>)
      .map((e) => DamageSummaryItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  allTimeTotals: (json['all_time_totals'] as List<dynamic>)
      .map((e) => AllTimeDamageItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DamageReportResponseToJson(
  _DamageReportResponse instance,
) => <String, dynamic>{
  'challan_damage_summary': instance.challanDamageSummary,
  'all_time_totals': instance.allTimeTotals,
};
