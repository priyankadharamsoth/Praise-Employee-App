import '../../core/utils/errors/app_exception.dart';
import '../models/praise/praise.dart';

sealed class PraiseState {
  const PraiseState();
}

class PraiseStateLoading extends PraiseState {
  const PraiseStateLoading();
}

class PraiseStateLoaded extends PraiseState {
  final List<Praise> praises;
  const PraiseStateLoaded(this.praises);

  @override
  String toString() => "PraiseStateLoaded: $praises";
}

class PraiseStateError extends PraiseState {
  final AppException ex;
  const PraiseStateError(this.ex);

  @override
  String toString() => "PraiseStateLoaded: $ex";
}

extension PraiseStateExtension on PraiseState {
  List<Praise>? get praises => switch (this) {
        PraiseStateLoaded(praises: List<Praise> praises) => praises,
        _ => null,
      };
}
