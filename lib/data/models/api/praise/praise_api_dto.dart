import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/utils/mappers/api_dto.dart';
import '../../../../domain/models/praise/praise.dart';
part 'praise_api_dto.freezed.dart';
part 'praise_api_dto.g.dart';

@freezed
class PraiseApiDto with _$PraiseApiDto implements ApiDto<Praise> {
  const factory PraiseApiDto({
    int? id,
    String? name,
    int? colorCode,
  }) = _PraiseApiDto;
  const PraiseApiDto._();

  factory PraiseApiDto.fromJson(Map<String, Object?> json) =>
      _$PraiseApiDtoFromJson(json);

  @override
  Praise toModel() => Praise(
        id: id,
        colorCode: colorCode,
        name: name,
      );
}
