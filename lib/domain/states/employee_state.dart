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
  final List<Employee> employees;
  const EmployeeStateLoaded({required this.employees});

  @override
  String toString() => 'NewsByCategoryStateLoaded(news: $employees)';
}

final class EmployeeStateError extends EmployeeState {
  final AppException ex;
  const EmployeeStateError({required this.ex});

  @override
  String toString() => 'NewsByCategoryStateLoaded(news: $ex)';
}
