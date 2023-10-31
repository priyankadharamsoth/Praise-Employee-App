import '../../core/utils/api/response/api_response.dart';
import '../../domain/models/praise/praise.dart';
import '../../domain/repositories/praise_repository.dart';
import '../data_source/remote/praise_remote_data_source.dart';
import '../models/api/praise/praise_api_dto.dart';
import '../models/result/data_state.dart';

class PraiseRepositoryImpl implements PraiseRepository {
  final PraiseRemoteDataSource _praiseRemoteDataSource;
  PraiseRepositoryImpl(this._praiseRemoteDataSource);
  @override
  Future<DataState<List<Praise>>> getAllPraises() async {
    final response = await _praiseRemoteDataSource.getAllPraises();
    switch (response) {
      case ApiResponseSuccess<List<PraiseApiDto>>(
          data: List<PraiseApiDto>? res
        ):
        return DataStateSuccess(res.map((e) => e.toModel()).toList());
      case ApiResponseError<List<PraiseApiDto>>(ex: var ex):
        return DataStateError(ex);
    }
  }

  @override
  Future<DataState<List<Praise>>> getEmployeePraises(int userId) async {
    final response = await _praiseRemoteDataSource.getEmployeePraises(userId);
    switch (response) {
      case ApiResponseSuccess<List<PraiseApiDto>>(
          data: List<PraiseApiDto> praises
        ):
        return DataStateSuccess(
          praises.map((e) => e.toModel()).toList(),
        );
      case ApiResponseError<List<PraiseApiDto>>(ex: var ex):
        return DataStateError(ex);
    }
  }
}
