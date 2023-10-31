import '../../core/utils/errors/app_exception.dart';
import '../models/employee/employee.dart';

sealed class AddEmployeeState {
  const AddEmployeeState();
}

class AddEmployeeStateLoading extends AddEmployeeState {
  const AddEmployeeStateLoading();
}

class AddEmployeeStateLoaded extends AddEmployeeState {
  final Employee employee;
  const AddEmployeeStateLoaded(this.employee);

  @override
  String toString() => "AddEMployeeStateLoaded: $employee";
}

class AddEmployeeStateError extends AddEmployeeState {
  final AppException ex;
  const AddEmployeeStateError(this.ex);
  @override
  String toString() => "AddEmployeeStateError: $ex";
}

extension AddEmployeeStateExtension on AddEmployeeState {
  bool? get isLoading => switch (this) {
        AddEmployeeStateLoading() => true,
        AddEmployeeStateError() || AddEmployeeStateLoaded() => false,
      };
}
