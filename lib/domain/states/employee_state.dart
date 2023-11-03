import 'package:flutter/foundation.dart';

import '../../core/utils/errors/app_exception.dart';
import '../models/employee/employee.dart';

@immutable
sealed class EmployeeState {
  const EmployeeState();
}

final class EmployeeStateLoading extends EmployeeState {
  const EmployeeStateLoading();
}

final class EmployeeStateLoaded extends EmployeeState {
  final EmployeeData employees;
  const EmployeeStateLoaded({required this.employees});

  @override
  String toString() => 'EmployeeStateLoaded(: $employees)';
}

final class EmployeeStateError extends EmployeeState {
  final AppException ex;
  const EmployeeStateError({required this.ex});

  @override
  String toString() => 'EmployeeStateError($ex)';
}

extension EmployeesStateExtension on EmployeeState {
  List<EmployeeResult>? get employees => switch (this) {
        EmployeeStateLoaded(employees: List<EmployeeResult> employees) =>
          employees,
        _ => null,
      };
  bool? get isLoading => switch (this) {
        EmployeeStateLoading() => true,
        EmployeeStateError() || EmployeeStateLoaded() => false,
      };
}
