import '../../core/utils/errors/app_exception.dart';
import '../models/praise/praise.dart';

sealed class EmployeePraisesState {
  const EmployeePraisesState();
}

class EmployeePraiseStateLoading extends EmployeePraisesState {
  const EmployeePraiseStateLoading();
}

class EmployeePraisesStateLoaded extends EmployeePraisesState {
  final List<Praise>? praises;
  const EmployeePraisesStateLoaded(this.praises);

  @override
  String toString() => "EmployeePraisesStateLoaded: $praises";
}

class EmployeePraisesStateError extends EmployeePraisesState {
  final AppException ex;
  const EmployeePraisesStateError(this.ex);

  @override
  String toString() => "EmployeePraisesStateError: $ex";
}
