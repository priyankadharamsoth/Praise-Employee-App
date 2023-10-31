import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/utils/mappers/api_dto.dart';
import '../../../../domain/models/base_response/base_response.dart';

part 'base_response_api_dto.freezed.dart';
part 'base_response_api_dto.g.dart';

@freezed
class BaseResponseApiDto
    with _$BaseResponseApiDto
    implements ApiDto<BaseResponse> {
  const factory BaseResponseApiDto({
    bool? data,
  }) = _BaseApiDto;
  const BaseResponseApiDto._();

  factory BaseResponseApiDto.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseApiDtoFromJson(json);

  @override
  BaseResponse toModel() => BaseResponse(
        data: data,
      );
}
