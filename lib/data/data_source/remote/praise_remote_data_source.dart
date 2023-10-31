import '../../../core/utils/api/api_manager/api_manager.dart';
import '../../../core/utils/api/request_type.dart';
import '../../../core/utils/api/response/api_response.dart';
import '../../enums/endpoints.dart';
import '../../models/api/praise/praise_api_dto.dart';

class PraiseRemoteDataSource {
  final ApiManager _apiManager;
  PraiseRemoteDataSource(this._apiManager);

  Future<ApiResponse<List<PraiseApiDto>>> getAllPraises() async {
    return _apiManager.requestListAsync<PraiseApiDto>(
      requestType: RequestType.get,
      endpoint: EndPoints.praises.val(),
    );
  }

  Future<ApiResponse<List<PraiseApiDto>>> getEmployeePraises(int userId) async {
    return _apiManager.requestListAsync(
      requestType: RequestType.get,
      endpoint: EndPoints.employeePraises.val(data: userId),
    );
  }
}
