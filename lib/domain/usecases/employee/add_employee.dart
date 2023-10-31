part of 'employee_usecases.dart';

@Riverpod(keepAlive: true)
AddEmployee addEmployeeUseCase(AddEmployeeUseCaseRef ref) {
  return AddEmployee(ref.watch(employeeRepositoryProvider));
}

class AddEmployee implements UseCase<DataState<Employee>, EmployeeRequestBody> {
  final EmployeeRepository _employeeRepository;
  AddEmployee(this._employeeRepository);
  @override
  Future<DataState<Employee>> call(EmployeeRequestBody employeeRequestBody) {
    return _employeeRepository.addEmployee(employeeRequestBody);
  }
}
