import '../../core/utils/errors/app_exception.dart';
import '../models/praise/praise.dart';

sealed class PraisesState {
  const PraisesState();
}

class PraisesStateLoading extends PraisesState {
  const PraisesStateLoading();
}

class PraisesStateLoaded extends PraisesState {
  final List<Praise> praises;
  const PraisesStateLoaded(this.praises);

  @override
  String toString() => "PraiseStateLoaded: $praises";
}

class PraisesStateError extends PraisesState {
  final AppException ex;
  const PraisesStateError(this.ex);

  @override
  String toString() => "PraiseStateLoaded: $ex";
}

extension PraisesStateExtension on PraisesState {
  List<Praise>? get praises => switch (this) {
        PraisesStateLoaded(praises: List<Praise> praises) => praises,
        _ => null,
      };
}
