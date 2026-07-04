import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/constants/enums.dart';

part 'admin_models.freezed.dart';
part 'admin_models.g.dart';

// --- Users ---

@freezed
abstract class UserCreateRequest with _$UserCreateRequest {
  const factory UserCreateRequest({
    @JsonKey(name: 'google_email') required String googleEmail,
    required UserRole role,
    @JsonKey(name: 'display_name') String? displayName,
    String? phone,
    @JsonKey(name: 'hotel_id') String? hotelId,
  }) = _UserCreateRequest;

  factory UserCreateRequest.fromJson(Map<String, dynamic> json) =>
      _$UserCreateRequestFromJson(json);
}

@freezed
abstract class UserResponse with _$UserResponse {
  const factory UserResponse({
    required String id,
    @JsonKey(name: 'google_email') required String googleEmail,
    @JsonKey(name: 'display_name') String? displayName,
    required UserRole role,
    String? phone,
    @JsonKey(name: 'hotel_id') String? hotelId,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _UserResponse;

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
}

@freezed
abstract class UserUpdateRequest with _$UserUpdateRequest {
  const factory UserUpdateRequest({
    @JsonKey(name: 'display_name', includeIfNull: false) String? displayName,
    @JsonKey(includeIfNull: false) String? phone,
    @JsonKey(includeIfNull: false) UserRole? role,
    @JsonKey(name: 'hotel_id', includeIfNull: false) String? hotelId,
    @JsonKey(name: 'is_active', includeIfNull: false) bool? isActive,
  }) = _UserUpdateRequest;

  factory UserUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$UserUpdateRequestFromJson(json);
}

// --- Hotels ---

@freezed
abstract class HotelCreateRequest with _$HotelCreateRequest {
  const factory HotelCreateRequest({
    required String name,
    String? address,
    @JsonKey(name: 'contact_number') String? contactNumber,
  }) = _HotelCreateRequest;

  factory HotelCreateRequest.fromJson(Map<String, dynamic> json) =>
      _$HotelCreateRequestFromJson(json);
}

@freezed
abstract class HotelUpdateRequest with _$HotelUpdateRequest {
  const factory HotelUpdateRequest({
    @JsonKey(includeIfNull: false) String? name,
    @JsonKey(includeIfNull: false) String? address,
    @JsonKey(name: 'contact_number', includeIfNull: false) String? contactNumber,
  }) = _HotelUpdateRequest;

  factory HotelUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$HotelUpdateRequestFromJson(json);
}

@freezed
abstract class HotelResponse with _$HotelResponse {
  const factory HotelResponse({
    required String id,
    required String name,
    String? address,
    @JsonKey(name: 'contact_number') String? contactNumber,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _HotelResponse;

  factory HotelResponse.fromJson(Map<String, dynamic> json) =>
      _$HotelResponseFromJson(json);
}

// --- Agent-Hotel Mappings ---

@freezed
abstract class MappingCreateRequest with _$MappingCreateRequest {
  const factory MappingCreateRequest({
    @JsonKey(name: 'agent_id') required String agentId,
    @JsonKey(name: 'hotel_id') required String hotelId,
  }) = _MappingCreateRequest;

  factory MappingCreateRequest.fromJson(Map<String, dynamic> json) =>
      _$MappingCreateRequestFromJson(json);
}

@freezed
abstract class MappingResponse with _$MappingResponse {
  const factory MappingResponse({
    required String id,
    @JsonKey(name: 'agent_id') required String agentId,
    @JsonKey(name: 'hotel_id') required String hotelId,
    @JsonKey(name: 'agent_email') String? agentEmail,
    @JsonKey(name: 'agent_name') String? agentName,
    @JsonKey(name: 'hotel_name') String? hotelName,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _MappingResponse;

  factory MappingResponse.fromJson(Map<String, dynamic> json) =>
      _$MappingResponseFromJson(json);
}
