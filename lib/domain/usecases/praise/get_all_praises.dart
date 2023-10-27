part of 'praise_usecases.dart';

@Riverpod(keepAlive: true)
GetAllPraises praisesUseCase(PraisesUseCaseRef ref) {
  return GetAllPraises(ref.watch(praiseRepositoryProvider));
}

class GetAllPraises implements NoParamsUseCase<DataState<List<Praise>>> {
  final PraiseRepository _praiseRepository;
  GetAllPraises(this._praiseRepository);

  @override
  Future<DataState<List<Praise>>> call() {
    return _praiseRepository.getAllPraises();
  }
}
