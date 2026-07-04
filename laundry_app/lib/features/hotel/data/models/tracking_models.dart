import 'package:freezed_annotation/freezed_annotation.dart';

part 'tracking_models.freezed.dart';
part 'tracking_models.g.dart';

@freezed
abstract class TrackingItem with _$TrackingItem {
  const factory TrackingItem({
    @JsonKey(name: 'item_name') required String itemName,
    @JsonKey(name: 'qty_in_laundry') required int qtyInLaundry,
    @JsonKey(name: 'total_damaged_by_laundry') required int totalDamagedByLaundry,
    @JsonKey(name: 'weight_kg') required double weightKg,
  }) = _TrackingItem;

  factory TrackingItem.fromJson(Map<String, dynamic> json) =>
      _$TrackingItemFromJson(json);
}

@freezed
abstract class TrackingDepartment with _$TrackingDepartment {
  const factory TrackingDepartment({
    @JsonKey(name: 'dept_name') required String deptName,
    @JsonKey(name: 'total_weight_kg') required double totalWeightKg,
    required List<TrackingItem> items,
  }) = _TrackingDepartment;

  factory TrackingDepartment.fromJson(Map<String, dynamic> json) =>
      _$TrackingDepartmentFromJson(json);
}

@freezed
abstract class LiveTrackingResponse with _$LiveTrackingResponse {
  const factory LiveTrackingResponse({
    @JsonKey(name: 'hotel_id') required String hotelId,
    required List<TrackingDepartment> departments,
  }) = _LiveTrackingResponse;

  factory LiveTrackingResponse.fromJson(Map<String, dynamic> json) =>
      _$LiveTrackingResponseFromJson(json);
}
