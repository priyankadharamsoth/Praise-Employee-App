import '../../data/models/result/data_state.dart';
import '../models/employee/employee.dart';

abstract class EmployeeRepository {
  Future<DataState<List<Employee>>> getAllEmployees();
}
