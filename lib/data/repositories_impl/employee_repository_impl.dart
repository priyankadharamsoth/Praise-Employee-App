import '../../core/utils/api/response/api_response.dart';
import '../../domain/models/employee/employee.dart';
import '../../domain/repositories/employee_repository.dart';
import '../data_source/remote/employee_remote_data_source.dart';
import '../models/api/employee/employee_api_dto.dart';
import '../models/result/data_state.dart';

class EmployeeRepoImpl implements EmployeeRepository {
  final EmployeeRemoteDataSource _employeeRemoteDataSource;
  EmployeeRepoImpl(this._employeeRemoteDataSource);
  @override
  Future<DataState<List<Employee>>> getAllEmployees() async {
    final employeeResponse = await _employeeRemoteDataSource.getAllEmployees();
    switch (employeeResponse) {
      case ApiResponseSuccess<List<EmployeeApiDto>?>(
          data: List<EmployeeApiDto>? res
        ):
        return DataStateSuccess(res?.map((e) => e.toModel()).toList() ?? []);
      case ApiResponseError<List<EmployeeApiDto>>(ex: var ex):
        return DataStateError(ex);
    }
  }
}
