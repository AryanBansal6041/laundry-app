// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setup_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DepartmentCreateRequest _$DepartmentCreateRequestFromJson(
  Map<String, dynamic> json,
) => _DepartmentCreateRequest(
  name: json['name'] as String,
  billingType: $enumDecode(_$BillingTypeEnumMap, json['billing_type']),
  pricePerKg: (json['price_per_kg'] as num?)?.toDouble(),
  weightSource: $enumDecodeNullable(
    _$WeightSourceEnumMap,
    json['weight_source'],
  ),
);

Map<String, dynamic> _$DepartmentCreateRequestToJson(
  _DepartmentCreateRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'billing_type': instance.billingType,
  'price_per_kg': instance.pricePerKg,
  'weight_source': instance.weightSource,
};

const _$BillingTypeEnumMap = {
  BillingType.weight: 'WEIGHT',
  BillingType.piece: 'PIECE',
};

const _$WeightSourceEnumMap = {
  WeightSource.soiled: 'SOILED',
  WeightSource.calculated: 'CALCULATED',
  WeightSource.fresh: 'FRESH',
};

_DepartmentResponse _$DepartmentResponseFromJson(Map<String, dynamic> json) =>
    _DepartmentResponse(
      id: json['id'] as String,
      hotelId: json['hotel_id'] as String,
      name: json['name'] as String,
      billingType: $enumDecode(_$BillingTypeEnumMap, json['billing_type']),
      pricePerKg: json['price_per_kg'] as String?,
      weightSource: $enumDecodeNullable(
        _$WeightSourceEnumMap,
        json['weight_source'],
      ),
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$DepartmentResponseToJson(_DepartmentResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hotel_id': instance.hotelId,
      'name': instance.name,
      'billing_type': instance.billingType,
      'price_per_kg': instance.pricePerKg,
      'weight_source': instance.weightSource,
      'created_at': instance.createdAt.toIso8601String(),
    };

_ItemCreateRequest _$ItemCreateRequestFromJson(Map<String, dynamic> json) =>
    _ItemCreateRequest(name: json['name'] as String);

Map<String, dynamic> _$ItemCreateRequestToJson(_ItemCreateRequest instance) =>
    <String, dynamic>{'name': instance.name};

_ItemResponse _$ItemResponseFromJson(Map<String, dynamic> json) =>
    _ItemResponse(
      id: json['id'] as String,
      name: json['name'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$ItemResponseToJson(_ItemResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'created_at': instance.createdAt.toIso8601String(),
    };

_DeptItemLinkRequest _$DeptItemLinkRequestFromJson(Map<String, dynamic> json) =>
    _DeptItemLinkRequest(
      itemId: json['item_id'] as String,
      pricePerPiece: (json['price_per_piece'] as num?)?.toDouble(),
      calculatedWeight: (json['calculated_weight'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$DeptItemLinkRequestToJson(
  _DeptItemLinkRequest instance,
) => <String, dynamic>{
  'item_id': instance.itemId,
  'price_per_piece': instance.pricePerPiece,
  'calculated_weight': instance.calculatedWeight,
};

_DeptItemLinkResponse _$DeptItemLinkResponseFromJson(
  Map<String, dynamic> json,
) => _DeptItemLinkResponse(
  id: json['id'] as String,
  deptId: json['dept_id'] as String,
  itemId: json['item_id'] as String,
  pricePerPiece: json['price_per_piece'] as String?,
  calculatedWeight: json['calculated_weight'] as String?,
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$DeptItemLinkResponseToJson(
  _DeptItemLinkResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'dept_id': instance.deptId,
  'item_id': instance.itemId,
  'price_per_piece': instance.pricePerPiece,
  'calculated_weight': instance.calculatedWeight,
  'created_at': instance.createdAt.toIso8601String(),
};

_FormSchemaResponse _$FormSchemaResponseFromJson(Map<String, dynamic> json) =>
    _FormSchemaResponse(
      hotelId: json['hotel_id'] as String,
      departments: (json['departments'] as List<dynamic>)
          .map((e) => FormSchemaDepartment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FormSchemaResponseToJson(_FormSchemaResponse instance) =>
    <String, dynamic>{
      'hotel_id': instance.hotelId,
      'departments': instance.departments,
    };

_FormSchemaDepartment _$FormSchemaDepartmentFromJson(
  Map<String, dynamic> json,
) => _FormSchemaDepartment(
  deptId: json['dept_id'] as String,
  name: json['name'] as String,
  billingType: $enumDecode(_$BillingTypeEnumMap, json['billing_type']),
  pricePerKg: json['price_per_kg'] as String?,
  weightSource: $enumDecodeNullable(
    _$WeightSourceEnumMap,
    json['weight_source'],
  ),
  items: (json['items'] as List<dynamic>)
      .map((e) => FormSchemaItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$FormSchemaDepartmentToJson(
  _FormSchemaDepartment instance,
) => <String, dynamic>{
  'dept_id': instance.deptId,
  'name': instance.name,
  'billing_type': instance.billingType,
  'price_per_kg': instance.pricePerKg,
  'weight_source': instance.weightSource,
  'items': instance.items,
};

_FormSchemaItem _$FormSchemaItemFromJson(Map<String, dynamic> json) =>
    _FormSchemaItem(
      itemId: json['item_id'] as String,
      name: json['name'] as String,
      pricePerPiece: json['price_per_piece'] as String?,
      calculatedWeight: json['calculated_weight'] as String?,
    );

Map<String, dynamic> _$FormSchemaItemToJson(_FormSchemaItem instance) =>
    <String, dynamic>{
      'item_id': instance.itemId,
      'name': instance.name,
      'price_per_piece': instance.pricePerPiece,
      'calculated_weight': instance.calculatedWeight,
    };
