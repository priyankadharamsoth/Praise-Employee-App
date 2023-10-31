import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../data/models/request_body/employee_request_body.dart';
import '../../../data/models/result/data_state.dart';
import '../../../domain/enums/gender.dart';
import '../../../domain/models/employee/employee.dart';
import '../../../domain/states/employee_state.dart';
import '../../../domain/usecases/employee/employee_usecases.dart';

part 'employee_provider.g.dart';

@riverpod
class EmployeeNotifier extends _$EmployeeNotifier {
  late final GetAllEmployees _getAllEmployees =
      ref.watch(getAllEmployeesUseCaseProvider);
  late final AddEmployee _addEmployee = ref.watch(addEmployeeUseCaseProvider);

  @override
  EmployeeState build() {
    return const EmployeeStateLoading();
  }

  Future<void> getAllEmployees() async {
    state = const EmployeeStateLoading();

    final dataState = await _getAllEmployees();

    switch (dataState) {
      case DataStateSuccess<List<Employee>>(data: var employees):
        state = EmployeeStateLoaded(employees: employees);

      case DataStateError<List<Employee>>(ex: var ex):
        state = EmployeeStateError(ex: ex);
    }
  }

  Future<bool> addEmployee(EmployeeRequestBody employeeRequestBody) async {
    final response = await _addEmployee(employeeRequestBody);
    switch (response) {
      case DataStateSuccess<Employee>(data: Employee employee):
        final List<Employee> employeeList =
            state.employees != null && state.employees!.isNotEmpty
                ? state.employees!.toList()
                : [];
        employeeList.insert(0, employee);
        state = EmployeeStateLoaded(employees: employeeList);
        return true;
      case DataStateError<Employee>(ex: var ex):
        state = EmployeeStateError(ex: ex);
        return false;
    }
  }
}

@Riverpod(keepAlive: true)
class GenderNotifier extends _$GenderNotifier {
  @override
  Gender? build() {
    return null;
  }

  void update(Gender? gender) {
    state = gender;
  }
}
