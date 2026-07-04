import 'package:freezed_annotation/freezed_annotation.dart';

part 'damage_models.freezed.dart';
part 'damage_models.g.dart';

@freezed
abstract class DamageSummaryItem with _$DamageSummaryItem {
  const factory DamageSummaryItem({
    @JsonKey(name: 'hotel_id') required String hotelId,
    @JsonKey(name: 'hotel_name') required String hotelName,
    @JsonKey(name: 'item_id') required String itemId,
    @JsonKey(name: 'item_name') required String itemName,
    @JsonKey(name: 'net_damage') required int netDamage,
  }) = _DamageSummaryItem;

  factory DamageSummaryItem.fromJson(Map<String, dynamic> json) =>
      _$DamageSummaryItemFromJson(json);
}

@freezed
abstract class AllTimeDamageItem with _$AllTimeDamageItem {
  const factory AllTimeDamageItem({
    @JsonKey(name: 'hotel_id') required String hotelId,
    @JsonKey(name: 'hotel_name') required String hotelName,
    @JsonKey(name: 'item_id') required String itemId,
    @JsonKey(name: 'item_name') required String itemName,
    @JsonKey(name: 'total_damaged_by_laundry') required int totalDamagedByLaundry,
  }) = _AllTimeDamageItem;

  factory AllTimeDamageItem.fromJson(Map<String, dynamic> json) =>
      _$AllTimeDamageItemFromJson(json);
}

@freezed
abstract class DamageReportResponse with _$DamageReportResponse {
  const factory DamageReportResponse({
    @JsonKey(name: 'challan_damage_summary')
    required List<DamageSummaryItem> challanDamageSummary,
    @JsonKey(name: 'all_time_totals')
    required List<AllTimeDamageItem> allTimeTotals,
  }) = _DamageReportResponse;

  factory DamageReportResponse.fromJson(Map<String, dynamic> json) =>
      _$DamageReportResponseFromJson(json);
}
