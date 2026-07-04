// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserCreateRequest _$UserCreateRequestFromJson(Map<String, dynamic> json) =>
    _UserCreateRequest(
      googleEmail: json['google_email'] as String,
      role: $enumDecode(_$UserRoleEnumMap, json['role']),
      displayName: json['display_name'] as String?,
      phone: json['phone'] as String?,
      hotelId: json['hotel_id'] as String?,
    );

Map<String, dynamic> _$UserCreateRequestToJson(_UserCreateRequest instance) =>
    <String, dynamic>{
      'google_email': instance.googleEmail,
      'role': instance.role,
      'display_name': instance.displayName,
      'phone': instance.phone,
      'hotel_id': instance.hotelId,
    };

const _$UserRoleEnumMap = {
  UserRole.superAdmin: 'SUPER_ADMIN',
  UserRole.hotelAdmin: 'HOTEL_ADMIN',
  UserRole.serviceAgent: 'SERVICE_AGENT',
};

_UserResponse _$UserResponseFromJson(Map<String, dynamic> json) =>
    _UserResponse(
      id: json['id'] as String,
      googleEmail: json['google_email'] as String,
      displayName: json['display_name'] as String?,
      role: $enumDecode(_$UserRoleEnumMap, json['role']),
      phone: json['phone'] as String?,
      hotelId: json['hotel_id'] as String?,
      isActive: json['is_active'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$UserResponseToJson(_UserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'google_email': instance.googleEmail,
      'display_name': instance.displayName,
      'role': instance.role,
      'phone': instance.phone,
      'hotel_id': instance.hotelId,
      'is_active': instance.isActive,
      'created_at': instance.createdAt.toIso8601String(),
    };

_UserUpdateRequest _$UserUpdateRequestFromJson(Map<String, dynamic> json) =>
    _UserUpdateRequest(
      displayName: json['display_name'] as String?,
      phone: json['phone'] as String?,
      role: $enumDecodeNullable(_$UserRoleEnumMap, json['role']),
      hotelId: json['hotel_id'] as String?,
      isActive: json['is_active'] as bool?,
    );

Map<String, dynamic> _$UserUpdateRequestToJson(_UserUpdateRequest instance) =>
    <String, dynamic>{
      'display_name': ?instance.displayName,
      'phone': ?instance.phone,
      'role': ?instance.role,
      'hotel_id': ?instance.hotelId,
      'is_active': ?instance.isActive,
    };

_HotelCreateRequest _$HotelCreateRequestFromJson(Map<String, dynamic> json) =>
    _HotelCreateRequest(
      name: json['name'] as String,
      address: json['address'] as String?,
      contactNumber: json['contact_number'] as String?,
    );

Map<String, dynamic> _$HotelCreateRequestToJson(_HotelCreateRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'contact_number': instance.contactNumber,
    };

_HotelUpdateRequest _$HotelUpdateRequestFromJson(Map<String, dynamic> json) =>
    _HotelUpdateRequest(
      name: json['name'] as String?,
      address: json['address'] as String?,
      contactNumber: json['contact_number'] as String?,
    );

Map<String, dynamic> _$HotelUpdateRequestToJson(_HotelUpdateRequest instance) =>
    <String, dynamic>{
      'name': ?instance.name,
      'address': ?instance.address,
      'contact_number': ?instance.contactNumber,
    };

_HotelResponse _$HotelResponseFromJson(Map<String, dynamic> json) =>
    _HotelResponse(
      id: json['id'] as String,
      name: json['name'] as String,
      address: json['address'] as String?,
      contactNumber: json['contact_number'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$HotelResponseToJson(_HotelResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'contact_number': instance.contactNumber,
      'created_at': instance.createdAt.toIso8601String(),
    };

_MappingCreateRequest _$MappingCreateRequestFromJson(
  Map<String, dynamic> json,
) => _MappingCreateRequest(
  agentId: json['agent_id'] as String,
  hotelId: json['hotel_id'] as String,
);

Map<String, dynamic> _$MappingCreateRequestToJson(
  _MappingCreateRequest instance,
) => <String, dynamic>{
  'agent_id': instance.agentId,
  'hotel_id': instance.hotelId,
};

_MappingResponse _$MappingResponseFromJson(Map<String, dynamic> json) =>
    _MappingResponse(
      id: json['id'] as String,
      agentId: json['agent_id'] as String,
      hotelId: json['hotel_id'] as String,
      agentEmail: json['agent_email'] as String?,
      agentName: json['agent_name'] as String?,
      hotelName: json['hotel_name'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$MappingResponseToJson(_MappingResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'agent_id': instance.agentId,
      'hotel_id': instance.hotelId,
      'agent_email': instance.agentEmail,
      'agent_name': instance.agentName,
      'hotel_name': instance.hotelName,
      'created_at': instance.createdAt.toIso8601String(),
    };
