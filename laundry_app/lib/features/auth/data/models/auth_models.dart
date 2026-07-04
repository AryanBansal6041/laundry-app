import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_models.freezed.dart';
part 'auth_models.g.dart';

@freezed
abstract class GoogleLoginRequest with _$GoogleLoginRequest {
  const factory GoogleLoginRequest({
    @JsonKey(name: 'id_token') required String idToken,
  }) = _GoogleLoginRequest;

  factory GoogleLoginRequest.fromJson(Map<String, dynamic> json) =>
      _$GoogleLoginRequestFromJson(json);
}

@freezed
abstract class TokenResponse with _$TokenResponse {
  const factory TokenResponse({
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'token_type') @Default('bearer') String tokenType,
  }) = _TokenResponse;

  factory TokenResponse.fromJson(Map<String, dynamic> json) =>
      _$TokenResponseFromJson(json);
}
