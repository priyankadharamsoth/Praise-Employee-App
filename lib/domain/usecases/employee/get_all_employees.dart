part of 'employee_usecases.dart';

@Riverpod(keepAlive: true)
GetAllEmployees getAllEmployeesUseCase(GetAllEmployeesUseCaseRef ref) {
  return GetAllEmployees(ref.watch(employeeRepositoryProvider));
}

class GetAllEmployees
    implements UseCase<DataState<EmployeeData>, QueryParams?> {
  final EmployeeRepository _employeeRepository;
  GetAllEmployees(this._employeeRepository);

  @override
  Future<DataState<EmployeeData>> call(QueryParams? queryParam) async {
    return await _employeeRepository.getAllEmployees(queryParam);
  }
}
