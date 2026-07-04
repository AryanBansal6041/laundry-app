import '../../../core/constants/api_endpoints.dart';
import '../../../core/network/api_result.dart';
import '../../../core/network/dio_client.dart';
import 'models/setup_models.dart';

class SetupRepository {
  const SetupRepository({required DioClient dioClient})
      : _dioClient = dioClient;
  final DioClient _dioClient;

  Future<ApiResult<DepartmentResponse>> createDepartment(
    String hotelId,
    DepartmentCreateRequest request,
  ) {
    return _dioClient.post(
      ApiEndpoints.createDepartment(hotelId),
      data: request.toJson(),
      parser: (data) =>
          DepartmentResponse.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ApiResult<List<ItemResponse>>> listItems({
    int page = 1,
    int pageSize = 50,
  }) {
    return _dioClient.get(
      ApiEndpoints.listItems,
      queryParameters: {'page': page, 'page_size': pageSize},
      parser: (data) => (data as List<dynamic>)
          .map((e) => ItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Future<ApiResult<ItemResponse>> createItem(ItemCreateRequest request) {
    return _dioClient.post(
      ApiEndpoints.createItem,
      data: request.toJson(),
      parser: (data) =>
          ItemResponse.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ApiResult<DeptItemLinkResponse>> linkItemToDept(
    String deptId,
    DeptItemLinkRequest request,
  ) {
    return _dioClient.post(
      ApiEndpoints.linkItemToDept(deptId),
      data: request.toJson(),
      parser: (data) =>
          DeptItemLinkResponse.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ApiResult<FormSchemaResponse>> getFormSchema(String hotelId) {
    return _dioClient.get(
      ApiEndpoints.formSchema(hotelId),
      parser: (data) =>
          FormSchemaResponse.fromJson(data as Map<String, dynamic>),
    );
  }
}
