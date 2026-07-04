// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GoogleLoginRequest _$GoogleLoginRequestFromJson(Map<String, dynamic> json) =>
    _GoogleLoginRequest(idToken: json['id_token'] as String);

Map<String, dynamic> _$GoogleLoginRequestToJson(_GoogleLoginRequest instance) =>
    <String, dynamic>{'id_token': instance.idToken};

_TokenResponse _$TokenResponseFromJson(Map<String, dynamic> json) =>
    _TokenResponse(
      accessToken: json['access_token'] as String,
      tokenType: json['token_type'] as String? ?? 'bearer',
    );

Map<String, dynamic> _$TokenResponseToJson(_TokenResponse instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'token_type': instance.tokenType,
    };
