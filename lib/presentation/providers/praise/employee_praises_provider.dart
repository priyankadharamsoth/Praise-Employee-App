import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/models/result/data_state.dart';
import '../../../domain/models/praise/praise.dart';
import '../../../domain/states/employee_praise_state.dart';
import '../../../domain/usecases/praise/praise_usecases.dart';

part 'employee_praises_provider.g.dart';

@Riverpod(keepAlive: true)
class EmployeePraisesNotifier extends _$EmployeePraisesNotifier {
  late final EmployeePraises _employeePraises =
      ref.watch(employeePraiseUseCaseProvider);
      
  @override
  EmployeePraisesState build() {
    return const EmployeePraiseStateLoading();
  }

  Future<void> getEmployeePraises(int userId) async {
    final response = await _employeePraises(userId);
    switch (response) {
      case DataStateSuccess<List<Praise>>(data: List<Praise> praises):
        state = EmployeePraisesStateLoaded(praises);
      case DataStateError<List<Praise>>(ex: var ex):
        state = EmployeePraisesStateError(ex);
    }
  }
}
