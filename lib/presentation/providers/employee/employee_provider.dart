import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../data/models/result/data_state.dart';
import '../../../domain/models/employee/employee.dart';
import '../../../domain/states/employee_state.dart';
import '../../../domain/usecases/employee/employee_usecases.dart';

part 'employee_provider.g.dart';

@riverpod
class EmployeeNotifier extends _$EmployeeNotifier {
  late final GetAllEmployees _getAllEmployees =
      ref.watch(newsByCategoryUseCaseProvider);

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
}
