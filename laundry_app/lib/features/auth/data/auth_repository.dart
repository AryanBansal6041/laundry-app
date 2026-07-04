import '../../../core/constants/api_endpoints.dart';
import '../../../core/network/api_result.dart';
import '../../../core/network/dio_client.dart';
import 'models/auth_models.dart';

export 'models/auth_models.dart' show TokenResponse;

class AuthRepository {
  const AuthRepository({required DioClient dioClient}) : _dioClient = dioClient;

  final DioClient _dioClient;

  /// Sends a Google ID token to the backend for verification.
  /// Backend verifies with Google, looks up user by email, returns app JWT.
  Future<ApiResult<TokenResponse>> loginWithGoogle(String idToken) {
    return _dioClient.post<TokenResponse>(
      ApiEndpoints.googleLogin,
      data: GoogleLoginRequest(idToken: idToken).toJson(),
      parser: (data) => TokenResponse.fromJson(data as Map<String, dynamic>),
    );
  }
}
