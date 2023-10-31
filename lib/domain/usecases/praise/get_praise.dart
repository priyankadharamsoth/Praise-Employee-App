part of 'praise_usecases.dart';

@Riverpod(keepAlive: true)
GetPraise praiseUseCase(PraiseUseCaseRef ref) {
  return GetPraise(ref.watch(praiseRepositoryProvider));
}

class GetPraise implements UseCase<DataState<Praise>, int> {
  final PraiseRepository _praiseRepository;
  GetPraise(this._praiseRepository);

  @override
  Future<DataState<Praise>> call(int praiseId) {
    return _praiseRepository.getPraiseById(praiseId);
  }
}
