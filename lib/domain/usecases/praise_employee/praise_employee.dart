part of 'praise_employee_usecases.dart';

@Riverpod(keepAlive: true)
GivePraise givePraiseUsecase(GivePraiseUsecaseRef ref) {
  return GivePraise(ref.watch(praiseEmployeeRepositoryProvider));
}

class GivePraise
    extends UseCase<DataState<BaseResponse>, PraiseEmployeeRequestBody> {
  final PraiseEmployeeRepository _praiseEmployeeRepository;
  const GivePraise(this._praiseEmployeeRepository);
  @override
  Future<DataState<BaseResponse>> call(
      PraiseEmployeeRequestBody praiseEmployeeRequestBody) {
    return _praiseEmployeeRepository.givePraise(praiseEmployeeRequestBody);
  }
}
