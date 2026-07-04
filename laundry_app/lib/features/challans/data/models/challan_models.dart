import 'package:freezed_annotation/freezed_annotation.dart';

part 'challan_models.freezed.dart';
part 'challan_models.g.dart';

// --- Request payloads ---

@freezed
abstract class ChallanItemPayload with _$ChallanItemPayload {
  const factory ChallanItemPayload({
    @JsonKey(name: 'item_id') required String itemId,
    required int qty,
    @JsonKey(name: 'damaged_qty') @Default(0) int damagedQty,
  }) = _ChallanItemPayload;

  factory ChallanItemPayload.fromJson(Map<String, dynamic> json) =>
      _$ChallanItemPayloadFromJson(json);
}

@freezed
abstract class ChallanDeptPayload with _$ChallanDeptPayload {
  const factory ChallanDeptPayload({
    @JsonKey(name: 'dept_id') required String deptId,
    @JsonKey(name: 'soiled_weight') double? soiledWeight,
    @JsonKey(name: 'fresh_weight') double? freshWeight,
    required List<ChallanItemPayload> items,
  }) = _ChallanDeptPayload;

  factory ChallanDeptPayload.fromJson(Map<String, dynamic> json) =>
      _$ChallanDeptPayloadFromJson(json);
}

@freezed
abstract class PickupSubmitRequest with _$PickupSubmitRequest {
  const factory PickupSubmitRequest({
    @JsonKey(name: 'challan_number') required String challanNumber,
    @JsonKey(name: 'hotel_id') required String hotelId,
    required List<ChallanDeptPayload> departments,
  }) = _PickupSubmitRequest;

  factory PickupSubmitRequest.fromJson(Map<String, dynamic> json) =>
      _$PickupSubmitRequestFromJson(json);
}

@freezed
abstract class DeliverySubmitRequest with _$DeliverySubmitRequest {
  const factory DeliverySubmitRequest({
    @JsonKey(name: 'challan_number') required String challanNumber,
    @JsonKey(name: 'hotel_id') required String hotelId,
    required List<ChallanDeptPayload> departments,
  }) = _DeliverySubmitRequest;

  factory DeliverySubmitRequest.fromJson(Map<String, dynamic> json) =>
      _$DeliverySubmitRequestFromJson(json);
}

@freezed
abstract class ChallanEditRequest with _$ChallanEditRequest {
  const factory ChallanEditRequest({
    List<ChallanDeptPayload>? departments,
  }) = _ChallanEditRequest;

  factory ChallanEditRequest.fromJson(Map<String, dynamic> json) =>
      _$ChallanEditRequestFromJson(json);
}

// --- Response models ---

@freezed
abstract class ChallanItemResponse with _$ChallanItemResponse {
  const factory ChallanItemResponse({
    required String id,
    @JsonKey(name: 'item_id') required String itemId,
    required int qty,
    @JsonKey(name: 'damaged_qty') required int damagedQty,
  }) = _ChallanItemResponse;

  factory ChallanItemResponse.fromJson(Map<String, dynamic> json) =>
      _$ChallanItemResponseFromJson(json);
}

@freezed
abstract class ChallanDeptResponse with _$ChallanDeptResponse {
  const factory ChallanDeptResponse({
    required String id,
    @JsonKey(name: 'dept_id') required String deptId,
    @JsonKey(name: 'soiled_weight') String? soiledWeight,
    @JsonKey(name: 'fresh_weight') String? freshWeight,
    required List<ChallanItemResponse> items,
  }) = _ChallanDeptResponse;

  factory ChallanDeptResponse.fromJson(Map<String, dynamic> json) =>
      _$ChallanDeptResponseFromJson(json);
}

@freezed
abstract class ChallanResponse with _$ChallanResponse {
  const factory ChallanResponse({
    required String id,
    @JsonKey(name: 'challan_type') required String challanType,
    @JsonKey(name: 'challan_number') required String challanNumber,
    @JsonKey(name: 'hotel_id') required String hotelId,
    @JsonKey(name: 'agent_id') required String agentId,
    @JsonKey(name: 'image_key') String? imageKey,
    @JsonKey(name: 'entry_timestamp') required DateTime entryTimestamp,
    @JsonKey(name: 'last_edited_at') DateTime? lastEditedAt,
    @JsonKey(name: 'edited_by') String? editedBy,
    required List<ChallanDeptResponse> departments,
  }) = _ChallanResponse;

  factory ChallanResponse.fromJson(Map<String, dynamic> json) =>
      _$ChallanResponseFromJson(json);
}

@freezed
abstract class PaginatedChallanResponse with _$PaginatedChallanResponse {
  const factory PaginatedChallanResponse({
    required int total,
    required int page,
    @JsonKey(name: 'page_size') required int pageSize,
    required List<ChallanResponse> items,
  }) = _PaginatedChallanResponse;

  factory PaginatedChallanResponse.fromJson(Map<String, dynamic> json) =>
      _$PaginatedChallanResponseFromJson(json);
}

// --- Image upload ---

@freezed
abstract class PresignedUploadResponse with _$PresignedUploadResponse {
  const factory PresignedUploadResponse({
    @JsonKey(name: 'upload_url') required String uploadUrl,
    @JsonKey(name: 's3_key') required String s3Key,
  }) = _PresignedUploadResponse;

  factory PresignedUploadResponse.fromJson(Map<String, dynamic> json) =>
      _$PresignedUploadResponseFromJson(json);
}

@freezed
abstract class ConfirmUploadRequest with _$ConfirmUploadRequest {
  const factory ConfirmUploadRequest({
    @JsonKey(name: 's3_key') required String s3Key,
  }) = _ConfirmUploadRequest;

  factory ConfirmUploadRequest.fromJson(Map<String, dynamic> json) =>
      _$ConfirmUploadRequestFromJson(json);
}
