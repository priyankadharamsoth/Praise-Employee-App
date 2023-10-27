import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/utils/mappers/ui_model.dart';
import '../../../data/models/api/praise/praise_api_dto.dart';

part 'praise.freezed.dart';

@freezed
class Praise with _$Praise implements UIModel<PraiseApiDto> {
  const factory Praise({
    int? id,
    String? name,
    int? colorCode,
  }) = _Praise;
  const Praise._();
  
  @override
  PraiseApiDto toApiDto() {
    // TODO: implement toApiDto
    throw UnimplementedError();
  }
}
