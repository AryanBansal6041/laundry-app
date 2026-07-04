import '../../../core/constants/api_endpoints.dart';
import '../../../core/network/api_result.dart';
import '../../../core/network/dio_client.dart';
import '../../challans/data/models/challan_models.dart';
import '../../hotel/data/models/tracking_models.dart';
import '../../setup/data/models/setup_models.dart';

class MyHotel {
  const MyHotel({required this.id, required this.name});

  final String id;
  final String name;

  factory MyHotel.fromJson(Map<String, dynamic> json) {
    return MyHotel(id: json['id'] as String, name: json['name'] as String);
  }
}

class AgentRepository {
  const AgentRepository({required DioClient dioClient})
    : _dioClient = dioClient;
  final DioClient _dioClient;

  /// Returns hotels the authenticated user can access.
  /// Works for all roles: SUPER_ADMIN gets all, HOTEL_ADMIN gets theirs,
  /// SERVICE_AGENT gets mapped hotels.
  Future<ApiResult<List<MyHotel>>> getMyHotels() {
    return _dioClient.get(
      ApiEndpoints.meHotels,
      parser: (data) => (data as List<dynamic>)
          .map((e) => MyHotel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Future<ApiResult<FormSchemaResponse>> getFormSchema(String hotelId) {
    return _dioClient.get(
      ApiEndpoints.formSchema(hotelId),
      parser: (data) =>
          FormSchemaResponse.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ApiResult<ChallanResponse>> submitPickup(PickupSubmitRequest request) {
    return _dioClient.post(
      ApiEndpoints.submitPickup,
      data: request.toJson(),
      parser: (data) => ChallanResponse.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ApiResult<ChallanResponse>> submitDelivery(
    DeliverySubmitRequest request,
  ) {
    return _dioClient.post(
      ApiEndpoints.submitDelivery,
      data: request.toJson(),
      parser: (data) => ChallanResponse.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ApiResult<ChallanResponse>> getChallanById(String challanId) {
    return _dioClient.get(
      ApiEndpoints.getChallan(challanId),
      parser: (data) => ChallanResponse.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ApiResult<ChallanResponse>> editChallan(
    String challanId,
    ChallanEditRequest request,
  ) {
    return _dioClient.patch(
      ApiEndpoints.editChallan(challanId),
      data: request.toJson(),
      parser: (data) => ChallanResponse.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ApiResult<PaginatedChallanResponse>> getChallanHistory(
    String hotelId, {
    int page = 1,
    int pageSize = 20,
    String? deptId,
    String? challanType,
    String? startDate,
    String? endDate,
  }) {
    final queryParams = <String, dynamic>{'page': page, 'page_size': pageSize};
    if (deptId != null) queryParams['dept_id'] = deptId;
    if (challanType != null) queryParams['challan_type'] = challanType;
    if (startDate != null) queryParams['start_date'] = startDate;
    if (endDate != null) queryParams['end_date'] = endDate;

    return _dioClient.get(
      ApiEndpoints.challanHistory(hotelId),
      queryParameters: queryParams,
      parser: (data) =>
          PaginatedChallanResponse.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ApiResult<List<ChallanResponse>>> getPendingDeliveries(
    String hotelId,
  ) {
    return _dioClient.get(
      ApiEndpoints.pendingDeliveries(hotelId),
      parser: (data) => (data as List<dynamic>)
          .map((e) => ChallanResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Future<ApiResult<LiveTrackingResponse>> getLiveTracking(String hotelId) {
    return _dioClient.get(
      ApiEndpoints.liveTracking(hotelId),
      parser: (data) =>
          LiveTrackingResponse.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ApiResult<PresignedUploadResponse>> getUploadUrl(
    String challanId, {
    String extension = 'jpg',
  }) {
    return _dioClient.get(
      ApiEndpoints.uploadUrl(challanId),
      queryParameters: {'extension': extension},
      parser: (data) =>
          PresignedUploadResponse.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ApiResult<ChallanResponse>> confirmUpload(
    String challanId,
    ConfirmUploadRequest request,
  ) {
    return _dioClient.patch(
      ApiEndpoints.confirmUpload(challanId),
      data: request.toJson(),
      parser: (data) => ChallanResponse.fromJson(data as Map<String, dynamic>),
    );
  }
}
