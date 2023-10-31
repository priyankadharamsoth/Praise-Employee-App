import '../../core/utils/errors/app_exception.dart';

sealed class PraiseEmployeeState {
  const PraiseEmployeeState();
}

class PraiseEmployeeStateLoading extends PraiseEmployeeState {
  const PraiseEmployeeStateLoading();
}

class PraiseEmployeeStateLoaded extends PraiseEmployeeState {
  final bool isSuccess;
  const PraiseEmployeeStateLoaded(this.isSuccess);
  @override
  String toString() => "PraiseEmployeeStateLoaded : $isSuccess";
}

class PraiseEmployeeStateError extends PraiseEmployeeState {
  final AppException ex;
  const PraiseEmployeeStateError(this.ex);
  @override
  String toString() => "PraiseEmployeeStateError $ex";
}

extension EmployeePraiseStateExtension on PraiseEmployeeState {
  bool get isLoading => switch (this) {
        PraiseEmployeeStateLoading() => true,
        _ => false,
      };
}
