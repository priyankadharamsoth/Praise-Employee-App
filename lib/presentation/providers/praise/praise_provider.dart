import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/models/result/data_state.dart';
import '../../../domain/models/praise/praise.dart';
import '../../../domain/states/praise_state.dart';
import '../../../domain/states/praises_state.dart';
import '../../../domain/usecases/praise/praise_usecases.dart';

part 'praise_provider.g.dart';

@riverpod
class PraiseNotifier extends _$PraiseNotifier {
  late final GetAllPraises _getAllPraises = ref.watch(praisesUseCaseProvider);

  @override
  PraisesState build() {
    return const PraisesStateLoading();
  }

  Future<void> getAllPraises() async {
    state = const PraisesStateLoading();
    final praiseState = await _getAllPraises();
    switch (praiseState) {
      case DataStateSuccess<List<Praise>>(data: List<Praise> praises):
        state = PraisesStateLoaded(praises);
      case DataStateError<List<Praise>>(ex: var ex):
        state = PraisesStateError(ex);
    }
  }
}

@riverpod
class PraiseByIdNotifier extends _$PraiseByIdNotifier {
  late final GetPraise _getPraise = ref.watch(praiseUseCaseProvider);

  @override
  PraiseState build() {
    return const PraiseStateLoading();
  }

  Future<Praise?> getPraiseById(int praiseId) async {
    final response = await _getPraise(praiseId);
    switch (response) {
      case DataStateSuccess<Praise>(data: Praise praise):
        return praise;
      case DataStateError<Praise>():
        return null;
    }
  }
}
