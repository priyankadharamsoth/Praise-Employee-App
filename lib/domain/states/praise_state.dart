import '../../core/utils/errors/app_exception.dart';
import '../models/praise/praise.dart';

sealed class PraiseState {
  const PraiseState();
}

class PraiseStateLoading extends PraiseState {
  const PraiseStateLoading();
}

class PraiseStateLoaded extends PraiseState {
  final Praise praise;
  const PraiseStateLoaded(this.praise);

  @override
  String toString() => "PraiseStateLoaded: $praise";
}

class PraiseStateError extends PraiseState {
  final AppException ex;
  const PraiseStateError(this.ex);

  @override
  String toString() => "PraiseStateLoaded: $ex";
}
