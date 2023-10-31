import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/models/request_body/praise_employee_request_body.dart';
import '../../../data/models/result/data_state.dart';
import '../../../domain/models/base_response/base_response.dart';
import '../../../domain/models/praise/praise.dart';
import '../../../domain/states/employee_praise_state.dart';
import '../../../domain/usecases/praise/praise_usecases.dart';
import '../../../domain/usecases/praise_employee/praise_employee_usecases.dart';
import 'praise_provider.dart';

part 'employee_praises_provider.g.dart';

@Riverpod(keepAlive: true)
class EmployeePraisesNotifier extends _$EmployeePraisesNotifier {
  late final EmployeePraises _employeePraises =
      ref.watch(employeePraiseUseCaseProvider);
  late final GivePraise _givePraise = ref.watch(givePraiseUsecaseProvider);

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

  Future<bool> givePraise(
      PraiseEmployeeRequestBody praiseEmployeeRequestBody) async {
    final response = await _givePraise(praiseEmployeeRequestBody);
    switch (response) {
      case DataStateSuccess<BaseResponse>(data: BaseResponse data):
        final List<Praise> praisesList =
            state.praises != null && state.praises!.isNotEmpty
                ? state.praises!.toList()
                : [];
        final praiseById = await ref
            .read(praiseByIdNotifierProvider.notifier)
            .getPraiseById(praiseEmployeeRequestBody.praiseId);
        praisesList.insert(
            0,
            Praise(
              id: praiseEmployeeRequestBody.praiseId,
              colorCode: praiseEmployeeRequestBody.colorCode,
              name: praiseById?.name,
            ));
        state = EmployeePraisesStateLoaded(praisesList);
        return data.data as bool;
      case DataStateError<BaseResponse>(ex: var ex):
        state = EmployeePraisesStateError(ex);
        return false;
    }
  }
}
