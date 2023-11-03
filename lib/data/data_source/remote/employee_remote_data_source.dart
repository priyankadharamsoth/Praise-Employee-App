import '../../../core/utils/api/api_manager/api_manager.dart';
import '../../../core/utils/api/query_params.dart';
import '../../../core/utils/api/request_type.dart';
import '../../../core/utils/api/response/api_response.dart';
import '../../enums/endpoints.dart';
import '../../models/api/employee/employee_api_dto.dart';
import '../../models/request_body/employee_request_body.dart';

class EmployeeRemoteDataSource {
  final ApiManager _apiManager;
  EmployeeRemoteDataSource(this._apiManager);

  Future<ApiResponse<EmployeeApiDto>> getAllEmployees(
      QueryParams? queryParam) async {
    return _apiManager.requestAsync<EmployeeApiDto>(
      requestType: RequestType.get,
      queryParams: (queryParam != null) ? queryParam.toMap() : null,
      endpoint: EndPoints.employees.val(),
    );
  }

  Future<ApiResponse<EmployeeResultApiDto>> addEmployee(
      EmployeeRequestBody employeeRequestBody) async {
    return _apiManager.requestAsync(
      requestType: RequestType.post,
      data: employeeRequestBody,
      endpoint: EndPoints.employees.val(),
    );
  }
}
