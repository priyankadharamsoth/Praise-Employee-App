part of 'employee_usecases.dart';

@Riverpod(keepAlive: true)
GetAllEmployees getAllEmployeesUseCase(GetAllEmployeesUseCaseRef ref) {
  return GetAllEmployees(ref.watch(employeeRepositoryProvider));
}

class GetAllEmployees implements NoParamsUseCase<DataState<List<Employee>>> {
  final EmployeeRepository _employeeRepository;
  GetAllEmployees(this._employeeRepository);

  @override
  Future<DataState<List<Employee>>> call() async {
    return await _employeeRepository.getAllEmployees();
  }
}
