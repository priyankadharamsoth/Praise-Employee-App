import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/utils/mappers/ui_model.dart';
import '../../../data/models/api/base_response/base_response_api_dto.dart';

part 'base_response.freezed.dart';

@freezed
class BaseResponse with _$BaseResponse implements UIModel<BaseResponseApiDto> {
  const factory BaseResponse({
    bool? data,
  }) = _BaseResponse;
  const BaseResponse._();

  @override
  BaseResponseApiDto toApiDto() {
    throw UnimplementedError();
  }
}
