import 'package:freezed_annotation/freezed_annotation.dart';

part 'billing_models.freezed.dart';
part 'billing_models.g.dart';

// --- Summary billing ---

@freezed
abstract class BillingPeriod with _$BillingPeriod {
  const factory BillingPeriod({
    required DateTime start,
    required DateTime end,
  }) = _BillingPeriod;

  factory BillingPeriod.fromJson(Map<String, dynamic> json) =>
      _$BillingPeriodFromJson(json);
}

@freezed
abstract class PieceLineItem with _$PieceLineItem {
  const factory PieceLineItem({
    @JsonKey(name: 'item_name') required String itemName,
    required int quantity,
    required double rate,
    required double subtotal,
  }) = _PieceLineItem;

  factory PieceLineItem.fromJson(Map<String, dynamic> json) =>
      _$PieceLineItemFromJson(json);
}

@freezed
abstract class DepartmentBilling with _$DepartmentBilling {
  const factory DepartmentBilling({
    @JsonKey(name: 'dept_name') required String deptName,
    @JsonKey(name: 'billing_type') required String billingType,
    @JsonKey(name: 'total_weight_kg') double? totalWeightKg,
    @JsonKey(name: 'rate_per_kg') double? ratePerKg,
    @JsonKey(name: 'soiled_weight_kg') double? soiledWeightKg,
    @JsonKey(name: 'soiled_subtotal') double? soiledSubtotal,
    @JsonKey(name: 'calculated_weight_kg') double? calculatedWeightKg,
    @JsonKey(name: 'calculated_subtotal') double? calculatedSubtotal,
    @JsonKey(name: 'fresh_weight_kg') double? freshWeightKg,
    @JsonKey(name: 'fresh_subtotal') double? freshSubtotal,
    List<PieceLineItem>? items,
    required double subtotal,
  }) = _DepartmentBilling;

  factory DepartmentBilling.fromJson(Map<String, dynamic> json) =>
      _$DepartmentBillingFromJson(json);
}

@freezed
abstract class HotelBilling with _$HotelBilling {
  const factory HotelBilling({
    @JsonKey(name: 'hotel_name') required String hotelName,
    required List<DepartmentBilling> departments,
    @JsonKey(name: 'damage_liability') required double damageLiability,
    @JsonKey(name: 'grand_total') required double grandTotal,
  }) = _HotelBilling;

  factory HotelBilling.fromJson(Map<String, dynamic> json) =>
      _$HotelBillingFromJson(json);
}

@freezed
abstract class BillingResponse with _$BillingResponse {
  const factory BillingResponse({
    required BillingPeriod period,
    required List<HotelBilling> hotels,
  }) = _BillingResponse;

  factory BillingResponse.fromJson(Map<String, dynamic> json) =>
      _$BillingResponseFromJson(json);
}

// --- Detailed (challan-wise) billing ---

@freezed
abstract class DetailedChallanItemBilling with _$DetailedChallanItemBilling {
  const factory DetailedChallanItemBilling({
    @JsonKey(name: 'item_name') required String itemName,
    required int qty,
    double? rate,
    double? subtotal,
  }) = _DetailedChallanItemBilling;

  factory DetailedChallanItemBilling.fromJson(Map<String, dynamic> json) =>
      _$DetailedChallanItemBillingFromJson(json);
}

@freezed
abstract class DetailedChallanDeptBilling with _$DetailedChallanDeptBilling {
  const factory DetailedChallanDeptBilling({
    @JsonKey(name: 'dept_name') required String deptName,
    @JsonKey(name: 'billing_type') required String billingType,
    @JsonKey(name: 'soiled_weight_kg') double? soiledWeightKg,
    @JsonKey(name: 'fresh_weight_kg') double? freshWeightKg,
    @JsonKey(name: 'calculated_weight_kg') double? calculatedWeightKg,
    @JsonKey(name: 'rate_per_kg') double? ratePerKg,
    List<DetailedChallanItemBilling>? items,
    required double subtotal,
  }) = _DetailedChallanDeptBilling;

  factory DetailedChallanDeptBilling.fromJson(Map<String, dynamic> json) =>
      _$DetailedChallanDeptBillingFromJson(json);
}

@freezed
abstract class DetailedChallanBilling with _$DetailedChallanBilling {
  const factory DetailedChallanBilling({
    @JsonKey(name: 'challan_number') required String challanNumber,
    @JsonKey(name: 'challan_type') required String challanType,
    @JsonKey(name: 'entry_timestamp') required DateTime entryTimestamp,
    @JsonKey(name: 'agent_name') String? agentName,
    required List<DetailedChallanDeptBilling> departments,
    @JsonKey(name: 'challan_total') required double challanTotal,
  }) = _DetailedChallanBilling;

  factory DetailedChallanBilling.fromJson(Map<String, dynamic> json) =>
      _$DetailedChallanBillingFromJson(json);
}

@freezed
abstract class DetailedHotelBilling with _$DetailedHotelBilling {
  const factory DetailedHotelBilling({
    @JsonKey(name: 'hotel_name') required String hotelName,
    required List<DetailedChallanBilling> challans,
    @JsonKey(name: 'damage_liability') required double damageLiability,
    @JsonKey(name: 'grand_total') required double grandTotal,
  }) = _DetailedHotelBilling;

  factory DetailedHotelBilling.fromJson(Map<String, dynamic> json) =>
      _$DetailedHotelBillingFromJson(json);
}

@freezed
abstract class DetailedBillingResponse with _$DetailedBillingResponse {
  const factory DetailedBillingResponse({
    required BillingPeriod period,
    required List<DetailedHotelBilling> hotels,
  }) = _DetailedBillingResponse;

  factory DetailedBillingResponse.fromJson(Map<String, dynamic> json) =>
      _$DetailedBillingResponseFromJson(json);
}
