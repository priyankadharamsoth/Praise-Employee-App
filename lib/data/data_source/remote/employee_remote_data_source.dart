import '../../../core/utils/api/api_manager/api_manager.dart';
import '../../../core/utils/api/request_type.dart';
import '../../../core/utils/api/response/api_response.dart';
import '../../enums/endpoints.dart';
import '../../models/api/employee/employee_api_dto.dart';

class EmployeeRemoteDataSource {
  final ApiManager _apiManager;
  EmployeeRemoteDataSource(this._apiManager);

  Future<ApiResponse<List<EmployeeApiDto>>> getAllEmployees() async {
    return _apiManager.requestListAsync<EmployeeApiDto>(
      requestType: RequestType.get,
      endpoint: EndPoints.employees.val(),
    );
  }
}
