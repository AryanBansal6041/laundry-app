import '../../../core/constants/api_endpoints.dart';
import '../../../core/network/api_result.dart';
import '../../../core/network/dio_client.dart';
import '../../challans/data/models/challan_models.dart';
import '../../reports/data/models/billing_models.dart';
import 'models/damage_models.dart';
import 'models/hotel_dashboard_models.dart';
import 'models/tracking_models.dart';

class HotelRepository {
  const HotelRepository({required DioClient dioClient}) : _dioClient = dioClient;
  final DioClient _dioClient;

  Future<ApiResult<LiveTrackingResponse>> getLiveTracking(String hotelId) {
    return _dioClient.get(
      ApiEndpoints.liveTracking(hotelId),
      parser: (data) =>
          LiveTrackingResponse.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ApiResult<HotelDashboardResponse>> getDashboard(String hotelId) {
    return _dioClient.get(
      ApiEndpoints.hotelAdminDashboard(hotelId),
      parser: (data) =>
          HotelDashboardResponse.fromJson(data as Map<String, dynamic>),
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
    final queryParams = <String, dynamic>{
      'page': page,
      'page_size': pageSize,
    };
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

  Future<ApiResult<ChallanResponse>> editChallan(
    String challanId,
    ChallanEditRequest request,
  ) {
    return _dioClient.patch(
      ApiEndpoints.editChallan(challanId),
      data: request.toJson(),
      parser: (data) =>
          ChallanResponse.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ApiResult<DamageReportResponse>> getDamageReport({
    String? hotelId,
    String? startDate,
    String? endDate,
    int? minDamage,
  }) {
    final queryParams = <String, dynamic>{};
    if (hotelId != null) queryParams['hotel_id'] = hotelId;
    if (startDate != null) queryParams['start_date'] = startDate;
    if (endDate != null) queryParams['end_date'] = endDate;
    if (minDamage != null) queryParams['min_damage'] = minDamage;

    return _dioClient.get(
      ApiEndpoints.damageReport,
      queryParameters: queryParams.isEmpty ? null : queryParams,
      parser: (data) =>
          DamageReportResponse.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ApiResult<BillingResponse>> getBilling({
    required String startDate,
    required String endDate,
    String? hotelId,
    String? weightMode,
  }) {
    final queryParams = <String, dynamic>{
      'start_date': startDate,
      'end_date': endDate,
    };
    if (hotelId != null) queryParams['hotel_id'] = hotelId;
    if (weightMode != null) queryParams['weight_mode'] = weightMode;

    return _dioClient.get(
      ApiEndpoints.billing,
      queryParameters: queryParams,
      parser: (data) =>
          BillingResponse.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ApiResult<DetailedBillingResponse>> getDetailedBilling({
    required String startDate,
    required String endDate,
    String? hotelId,
    String? weightMode,
  }) {
    final queryParams = <String, dynamic>{
      'start_date': startDate,
      'end_date': endDate,
      'view': 'detailed',
    };
    if (hotelId != null) queryParams['hotel_id'] = hotelId;
    if (weightMode != null) queryParams['weight_mode'] = weightMode;

    return _dioClient.get(
      ApiEndpoints.billing,
      queryParameters: queryParams,
      parser: (data) =>
          DetailedBillingResponse.fromJson(data as Map<String, dynamic>),
    );
  }
}
