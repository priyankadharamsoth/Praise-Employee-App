import '../../../core/utils/api/api_manager/api_manager.dart';
import '../../../core/utils/api/request_type.dart';
import '../../../core/utils/api/response/api_response.dart';
import '../../enums/endpoints.dart';
import '../../models/api/base_response/base_response_api_dto.dart';
import '../../models/request_body/praise_employee_request_body.dart';

class PraiseEmployeeRemoteDataSource {
  final ApiManager _apiManager;
  const PraiseEmployeeRemoteDataSource(this._apiManager);
  Future<ApiResponse<BaseResponseApiDto>> givePraise(
      PraiseEmployeeRequestBody praiseEmployeeRequestBody) {
    return _apiManager.requestAsync(
      requestType: RequestType.post,
      data: praiseEmployeeRequestBody,
      endpoint: EndPoints.praiseEmployee.val(),
    );
  }
}
