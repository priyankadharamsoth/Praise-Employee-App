part of 'employee_usecases.dart';

@Riverpod(keepAlive: true)
GetAllEmployees getAllEmployeesUseCase(GetAllEmployeesUseCaseRef ref) {
  return GetAllEmployees(ref.watch(employeeRepositoryProvider));
}

class GetAllEmployees implements UseCase<DataState<List<Employee>>, String?> {
  final EmployeeRepository _employeeRepository;
  GetAllEmployees(this._employeeRepository);

  @override
  Future<DataState<List<Employee>>> call(String? searchWord) async {
    return await _employeeRepository.getAllEmployees(searchWord);
  }
}
