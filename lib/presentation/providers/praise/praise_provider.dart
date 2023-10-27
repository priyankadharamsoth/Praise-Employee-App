import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/models/result/data_state.dart';
import '../../../domain/models/praise/praise.dart';
import '../../../domain/states/praise_state.dart';
import '../../../domain/usecases/praise/praise_usecases.dart';

part 'praise_provider.g.dart';

@riverpod
class PraiseNotifier extends _$PraiseNotifier {
  late final GetAllPraises _getAllPraises = ref.watch(praisesUseCaseProvider);

  @override
  PraiseState build() {
    return const PraiseStateLoading();
  }

  Future<void> getAllPraises() async {
    state = const PraiseStateLoading();
    final praiseState = await _getAllPraises();
    switch (praiseState) {
      case DataStateSuccess<List<Praise>>(data: List<Praise> praises):
        state = PraiseStateLoaded(praises);
      case DataStateError<List<Praise>>(ex: var ex):
        state = PraiseStateError(ex);
    }
  }
}
