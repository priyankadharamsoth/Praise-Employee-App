import '../../core/utils/api/response/api_response.dart';
import '../../domain/models/base_response/base_response.dart';
import '../../domain/repositories/praise_employee_repository.dart';
import '../data_source/remote/praise_employee_remote_data_source.dart';
import '../models/api/base_response/base_response_api_dto.dart';
import '../models/request_body/praise_employee_request_body.dart';
import '../models/result/data_state.dart';

class PraiseEmployeeRepoImpl implements PraiseEmployeeRepository {
  final PraiseEmployeeRemoteDataSource _praiseRemoteDataSource;
  const PraiseEmployeeRepoImpl(this._praiseRemoteDataSource);
  @override
  Future<DataState<BaseResponse>> givePraise(
      PraiseEmployeeRequestBody praiseEmployeeRequestBody) async {
    final response =
        await _praiseRemoteDataSource.givePraise(praiseEmployeeRequestBody);
    switch (response) {
      case ApiResponseSuccess<BaseResponseApiDto>(
          data: BaseResponseApiDto data
        ):
        return DataStateSuccess(data.toModel());

      case ApiResponseError<BaseResponseApiDto>(ex: var ex):
        return DataStateError(ex);
    }
  }
}
