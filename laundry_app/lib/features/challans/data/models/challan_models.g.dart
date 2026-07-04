// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challan_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChallanItemPayload _$ChallanItemPayloadFromJson(Map<String, dynamic> json) =>
    _ChallanItemPayload(
      itemId: json['item_id'] as String,
      qty: (json['qty'] as num).toInt(),
      damagedQty: (json['damaged_qty'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ChallanItemPayloadToJson(_ChallanItemPayload instance) =>
    <String, dynamic>{
      'item_id': instance.itemId,
      'qty': instance.qty,
      'damaged_qty': instance.damagedQty,
    };

_ChallanDeptPayload _$ChallanDeptPayloadFromJson(Map<String, dynamic> json) =>
    _ChallanDeptPayload(
      deptId: json['dept_id'] as String,
      soiledWeight: (json['soiled_weight'] as num?)?.toDouble(),
      freshWeight: (json['fresh_weight'] as num?)?.toDouble(),
      items: (json['items'] as List<dynamic>)
          .map((e) => ChallanItemPayload.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChallanDeptPayloadToJson(_ChallanDeptPayload instance) =>
    <String, dynamic>{
      'dept_id': instance.deptId,
      'soiled_weight': instance.soiledWeight,
      'fresh_weight': instance.freshWeight,
      'items': instance.items,
    };

_PickupSubmitRequest _$PickupSubmitRequestFromJson(Map<String, dynamic> json) =>
    _PickupSubmitRequest(
      challanNumber: json['challan_number'] as String,
      hotelId: json['hotel_id'] as String,
      departments: (json['departments'] as List<dynamic>)
          .map((e) => ChallanDeptPayload.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PickupSubmitRequestToJson(
  _PickupSubmitRequest instance,
) => <String, dynamic>{
  'challan_number': instance.challanNumber,
  'hotel_id': instance.hotelId,
  'departments': instance.departments,
};

_DeliverySubmitRequest _$DeliverySubmitRequestFromJson(
  Map<String, dynamic> json,
) => _DeliverySubmitRequest(
  challanNumber: json['challan_number'] as String,
  hotelId: json['hotel_id'] as String,
  departments: (json['departments'] as List<dynamic>)
      .map((e) => ChallanDeptPayload.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DeliverySubmitRequestToJson(
  _DeliverySubmitRequest instance,
) => <String, dynamic>{
  'challan_number': instance.challanNumber,
  'hotel_id': instance.hotelId,
  'departments': instance.departments,
};

_ChallanEditRequest _$ChallanEditRequestFromJson(Map<String, dynamic> json) =>
    _ChallanEditRequest(
      departments: (json['departments'] as List<dynamic>?)
          ?.map((e) => ChallanDeptPayload.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChallanEditRequestToJson(_ChallanEditRequest instance) =>
    <String, dynamic>{'departments': instance.departments};

_ChallanItemResponse _$ChallanItemResponseFromJson(Map<String, dynamic> json) =>
    _ChallanItemResponse(
      id: json['id'] as String,
      itemId: json['item_id'] as String,
      qty: (json['qty'] as num).toInt(),
      damagedQty: (json['damaged_qty'] as num).toInt(),
    );

Map<String, dynamic> _$ChallanItemResponseToJson(
  _ChallanItemResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'item_id': instance.itemId,
  'qty': instance.qty,
  'damaged_qty': instance.damagedQty,
};

_ChallanDeptResponse _$ChallanDeptResponseFromJson(Map<String, dynamic> json) =>
    _ChallanDeptResponse(
      id: json['id'] as String,
      deptId: json['dept_id'] as String,
      soiledWeight: json['soiled_weight'] as String?,
      freshWeight: json['fresh_weight'] as String?,
      items: (json['items'] as List<dynamic>)
          .map((e) => ChallanItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChallanDeptResponseToJson(
  _ChallanDeptResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'dept_id': instance.deptId,
  'soiled_weight': instance.soiledWeight,
  'fresh_weight': instance.freshWeight,
  'items': instance.items,
};

_ChallanResponse _$ChallanResponseFromJson(Map<String, dynamic> json) =>
    _ChallanResponse(
      id: json['id'] as String,
      challanType: json['challan_type'] as String,
      challanNumber: json['challan_number'] as String,
      hotelId: json['hotel_id'] as String,
      agentId: json['agent_id'] as String,
      imageKey: json['image_key'] as String?,
      entryTimestamp: DateTime.parse(json['entry_timestamp'] as String),
      lastEditedAt: json['last_edited_at'] == null
          ? null
          : DateTime.parse(json['last_edited_at'] as String),
      editedBy: json['edited_by'] as String?,
      departments: (json['departments'] as List<dynamic>)
          .map((e) => ChallanDeptResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChallanResponseToJson(_ChallanResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'challan_type': instance.challanType,
      'challan_number': instance.challanNumber,
      'hotel_id': instance.hotelId,
      'agent_id': instance.agentId,
      'image_key': instance.imageKey,
      'entry_timestamp': instance.entryTimestamp.toIso8601String(),
      'last_edited_at': instance.lastEditedAt?.toIso8601String(),
      'edited_by': instance.editedBy,
      'departments': instance.departments,
    };

_PaginatedChallanResponse _$PaginatedChallanResponseFromJson(
  Map<String, dynamic> json,
) => _PaginatedChallanResponse(
  total: (json['total'] as num).toInt(),
  page: (json['page'] as num).toInt(),
  pageSize: (json['page_size'] as num).toInt(),
  items: (json['items'] as List<dynamic>)
      .map((e) => ChallanResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PaginatedChallanResponseToJson(
  _PaginatedChallanResponse instance,
) => <String, dynamic>{
  'total': instance.total,
  'page': instance.page,
  'page_size': instance.pageSize,
  'items': instance.items,
};

_PresignedUploadResponse _$PresignedUploadResponseFromJson(
  Map<String, dynamic> json,
) => _PresignedUploadResponse(
  uploadUrl: json['upload_url'] as String,
  s3Key: json['s3_key'] as String,
);

Map<String, dynamic> _$PresignedUploadResponseToJson(
  _PresignedUploadResponse instance,
) => <String, dynamic>{
  'upload_url': instance.uploadUrl,
  's3_key': instance.s3Key,
};

_ConfirmUploadRequest _$ConfirmUploadRequestFromJson(
  Map<String, dynamic> json,
) => _ConfirmUploadRequest(s3Key: json['s3_key'] as String);

Map<String, dynamic> _$ConfirmUploadRequestToJson(
  _ConfirmUploadRequest instance,
) => <String, dynamic>{'s3_key': instance.s3Key};
