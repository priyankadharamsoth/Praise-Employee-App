import '../../core/utils/api/query_params.dart';
import '../../core/utils/api/response/api_response.dart';
import '../../domain/models/employee/employee.dart';
import '../../domain/repositories/employee_repository.dart';
import '../data_source/remote/employee_remote_data_source.dart';
import '../models/api/employee/employee_api_dto.dart';
import '../models/request_body/employee_request_body.dart';
import '../models/result/data_state.dart';

class EmployeeRepoImpl implements EmployeeRepository {
  final EmployeeRemoteDataSource _employeeRemoteDataSource;
  EmployeeRepoImpl(this._employeeRemoteDataSource);
  @override
  Future<DataState<EmployeeData>> getAllEmployees(
      QueryParams? queryParam) async {
    final employeeResponse =
        await _employeeRemoteDataSource.getAllEmployees(queryParam);
    switch (employeeResponse) {
      case ApiResponseSuccess<EmployeeApiDto>(data: EmployeeApiDto? res):
        final EmployeeDataApiDto? employeeData = res.data;
        return DataStateSuccess(
            employeeData?.toModel() ?? const EmployeeData());
      case ApiResponseError<EmployeeApiDto>(ex: var ex):
        return DataStateError(ex);
    }
  }

  @override
  Future<DataState<EmployeeResult>> addEmployee(
      EmployeeRequestBody employeeRequestBody) async {
    final response =
        await _employeeRemoteDataSource.addEmployee(employeeRequestBody);
    switch (response) {
      case ApiResponseSuccess<EmployeeResultApiDto>(
          data: EmployeeResultApiDto employee
        ):
        return DataStateSuccess(employee.toModel());
      case ApiResponseError<EmployeeResultApiDto>(ex: var ex):
        return DataStateError(ex);
    }
  }
}
