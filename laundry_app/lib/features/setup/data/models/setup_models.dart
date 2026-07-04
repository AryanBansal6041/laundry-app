import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/constants/enums.dart';

part 'setup_models.freezed.dart';
part 'setup_models.g.dart';

// --- Departments ---

@freezed
abstract class DepartmentCreateRequest with _$DepartmentCreateRequest {
  const factory DepartmentCreateRequest({
    required String name,
    @JsonKey(name: 'billing_type') required BillingType billingType,
    @JsonKey(name: 'price_per_kg') double? pricePerKg,
    @JsonKey(name: 'weight_source') WeightSource? weightSource,
  }) = _DepartmentCreateRequest;

  factory DepartmentCreateRequest.fromJson(Map<String, dynamic> json) =>
      _$DepartmentCreateRequestFromJson(json);
}

@freezed
abstract class DepartmentResponse with _$DepartmentResponse {
  const factory DepartmentResponse({
    required String id,
    @JsonKey(name: 'hotel_id') required String hotelId,
    required String name,
    @JsonKey(name: 'billing_type') required BillingType billingType,
    @JsonKey(name: 'price_per_kg') String? pricePerKg,
    @JsonKey(name: 'weight_source') WeightSource? weightSource,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _DepartmentResponse;

  factory DepartmentResponse.fromJson(Map<String, dynamic> json) =>
      _$DepartmentResponseFromJson(json);
}

// --- Items ---

@freezed
abstract class ItemCreateRequest with _$ItemCreateRequest {
  const factory ItemCreateRequest({
    required String name,
  }) = _ItemCreateRequest;

  factory ItemCreateRequest.fromJson(Map<String, dynamic> json) =>
      _$ItemCreateRequestFromJson(json);
}

@freezed
abstract class ItemResponse with _$ItemResponse {
  const factory ItemResponse({
    required String id,
    required String name,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _ItemResponse;

  factory ItemResponse.fromJson(Map<String, dynamic> json) =>
      _$ItemResponseFromJson(json);
}

// --- Dept-Item Links ---

@freezed
abstract class DeptItemLinkRequest with _$DeptItemLinkRequest {
  const factory DeptItemLinkRequest({
    @JsonKey(name: 'item_id') required String itemId,
    @JsonKey(name: 'price_per_piece') double? pricePerPiece,
    @JsonKey(name: 'calculated_weight') double? calculatedWeight,
  }) = _DeptItemLinkRequest;

  factory DeptItemLinkRequest.fromJson(Map<String, dynamic> json) =>
      _$DeptItemLinkRequestFromJson(json);
}

@freezed
abstract class DeptItemLinkResponse with _$DeptItemLinkResponse {
  const factory DeptItemLinkResponse({
    required String id,
    @JsonKey(name: 'dept_id') required String deptId,
    @JsonKey(name: 'item_id') required String itemId,
    @JsonKey(name: 'price_per_piece') String? pricePerPiece,
    @JsonKey(name: 'calculated_weight') String? calculatedWeight,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _DeptItemLinkResponse;

  factory DeptItemLinkResponse.fromJson(Map<String, dynamic> json) =>
      _$DeptItemLinkResponseFromJson(json);
}

// --- Form Schema ---

@freezed
abstract class FormSchemaResponse with _$FormSchemaResponse {
  const factory FormSchemaResponse({
    @JsonKey(name: 'hotel_id') required String hotelId,
    required List<FormSchemaDepartment> departments,
  }) = _FormSchemaResponse;

  factory FormSchemaResponse.fromJson(Map<String, dynamic> json) =>
      _$FormSchemaResponseFromJson(json);
}

@freezed
abstract class FormSchemaDepartment with _$FormSchemaDepartment {
  const factory FormSchemaDepartment({
    @JsonKey(name: 'dept_id') required String deptId,
    required String name,
    @JsonKey(name: 'billing_type') required BillingType billingType,
    @JsonKey(name: 'price_per_kg') String? pricePerKg,
    @JsonKey(name: 'weight_source') WeightSource? weightSource,
    required List<FormSchemaItem> items,
  }) = _FormSchemaDepartment;

  factory FormSchemaDepartment.fromJson(Map<String, dynamic> json) =>
      _$FormSchemaDepartmentFromJson(json);
}

@freezed
abstract class FormSchemaItem with _$FormSchemaItem {
  const factory FormSchemaItem({
    @JsonKey(name: 'item_id') required String itemId,
    required String name,
    @JsonKey(name: 'price_per_piece') String? pricePerPiece,
    @JsonKey(name: 'calculated_weight') String? calculatedWeight,
  }) = _FormSchemaItem;

  factory FormSchemaItem.fromJson(Map<String, dynamic> json) =>
      _$FormSchemaItemFromJson(json);
}
