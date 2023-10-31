part of 'praise_usecases.dart';

@Riverpod(keepAlive: true)
EmployeePraises employeePraiseUseCase(EmployeePraiseUseCaseRef ref) {
  return EmployeePraises(ref.watch(praiseRepositoryProvider));
}

class EmployeePraises extends UseCase<DataState<List<Praise>>, int> {
  final PraiseRepository _praiseRepository;
  EmployeePraises(this._praiseRepository);
  @override
  Future<DataState<List<Praise>>> call(int userId) {
    return _praiseRepository.getEmployeePraises(userId);
  }
}
