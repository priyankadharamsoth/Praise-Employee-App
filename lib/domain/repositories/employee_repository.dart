import '../../data/models/request_body/employee_request_body.dart';
import '../../data/models/result/data_state.dart';
import '../models/employee/employee.dart';

abstract class EmployeeRepository {
  Future<DataState<List<Employee>>> getAllEmployees(String? searchWord);
  Future<DataState<Employee>> addEmployee(
      EmployeeRequestBody employeeRequestBody);
}
