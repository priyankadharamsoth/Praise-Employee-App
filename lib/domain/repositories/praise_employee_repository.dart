import '../../data/models/request_body/praise_employee_request_body.dart';
import '../../data/models/result/data_state.dart';
import '../models/base_response/base_response.dart';

abstract class PraiseEmployeeRepository {
  Future<DataState<BaseResponse>> givePraise(
      PraiseEmployeeRequestBody praiseEmployeeRequestBody);
}
