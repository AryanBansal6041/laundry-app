import '../../../core/constants/api_endpoints.dart';
import '../../../core/network/api_result.dart';
import '../../../core/network/dio_client.dart';
import 'models/admin_models.dart';
import 'models/dashboard_models.dart';

class AdminRepository {
  const AdminRepository({required DioClient dioClient})
      : _dioClient = dioClient;
  final DioClient _dioClient;

  Future<ApiResult<SuperAdminDashboardResponse>> getDashboard() {
    return _dioClient.get(
      ApiEndpoints.superAdminDashboard,
      parser: (data) =>
          SuperAdminDashboardResponse.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ApiResult<List<UserResponse>>> listUsers({
    String? role,
    bool? isActive,
    int page = 1,
    int pageSize = 50,
  }) {
    final queryParams = <String, dynamic>{
      'page': page,
      'page_size': pageSize,
    };
    if (role != null) queryParams['role'] = role;
    if (isActive != null) queryParams['is_active'] = isActive;

    return _dioClient.get(
      ApiEndpoints.listUsers,
      queryParameters: queryParams,
      parser: (data) => (data as List<dynamic>)
          .map((e) => UserResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Future<ApiResult<UserResponse>> createUser(UserCreateRequest request) {
    return _dioClient.post(
      ApiEndpoints.createUser,
      data: request.toJson(),
      parser: (data) =>
          UserResponse.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ApiResult<UserResponse>> updateUser(
    String userId,
    UserUpdateRequest request,
  ) {
    return _dioClient.patch(
      ApiEndpoints.updateUser(userId),
      data: request.toJson(),
      parser: (data) =>
          UserResponse.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ApiResult<List<HotelResponse>>> listHotels({
    int page = 1,
    int pageSize = 50,
  }) {
    return _dioClient.get(
      ApiEndpoints.listHotels,
      queryParameters: {'page': page, 'page_size': pageSize},
      parser: (data) => (data as List<dynamic>)
          .map((e) => HotelResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Future<ApiResult<HotelResponse>> createHotel(HotelCreateRequest request) {
    return _dioClient.post(
      ApiEndpoints.createHotel,
      data: request.toJson(),
      parser: (data) =>
          HotelResponse.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ApiResult<HotelResponse>> updateHotel(
    String hotelId,
    HotelUpdateRequest request,
  ) {
    return _dioClient.patch(
      ApiEndpoints.updateHotel(hotelId),
      data: request.toJson(),
      parser: (data) =>
          HotelResponse.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ApiResult<List<MappingResponse>>> listMappings({
    int page = 1,
    int pageSize = 50,
  }) {
    return _dioClient.get(
      ApiEndpoints.listMappings,
      queryParameters: {'page': page, 'page_size': pageSize},
      parser: (data) => (data as List<dynamic>)
          .map((e) => MappingResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Future<ApiResult<MappingResponse>> createMapping(
      MappingCreateRequest request) {
    return _dioClient.post(
      ApiEndpoints.createMapping,
      data: request.toJson(),
      parser: (data) =>
          MappingResponse.fromJson(data as Map<String, dynamic>),
    );
  }
}
