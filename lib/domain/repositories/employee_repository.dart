import '../../core/utils/api/query_params.dart';
import '../../data/models/request_body/employee_request_body.dart';
import '../../data/models/result/data_state.dart';
import '../models/employee/employee.dart';

abstract class EmployeeRepository {
  Future<DataState<EmployeeData>> getAllEmployees(
      QueryParams? queryParam);
  Future<DataState<EmployeeResult>> addEmployee(
      EmployeeRequestBody employeeRequestBody);
}
