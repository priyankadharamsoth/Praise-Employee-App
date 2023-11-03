import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/utils/mappers/api_dto.dart';
import '../../../../domain/models/employee/employee.dart';

part 'employee_api_dto.freezed.dart';
part 'employee_api_dto.g.dart';

@freezed
class EmployeeApiDto with _$EmployeeApiDto implements ApiDto<Employee> {
  const factory EmployeeApiDto({
    String? status,
    String? errorCode,
    String? message,
    EmployeeDataApiDto? data,
  }) = _EmployeeApiDto;
  const EmployeeApiDto._();

  factory EmployeeApiDto.fromJson(Map<String, dynamic> json) =>
      _$EmployeeApiDtoFromJson(json);

  @override
  Employee toModel() => Employee(
        data: data?.toModel(),
      );
}

@freezed
class EmployeeDataApiDto
    with _$EmployeeDataApiDto
    implements ApiDto<EmployeeData> {
  const factory EmployeeDataApiDto({
    int? totalRecordCount,
    List<EmployeeResultApiDto>? results,
  }) = _EmployeeDataApiDto;
  const EmployeeDataApiDto._();

  factory EmployeeDataApiDto.fromJson(Map<String, dynamic> json) =>
      _$EmployeeDataApiDtoFromJson(json);

  @override
  EmployeeData toModel() => EmployeeData(
        totalRecordCount: totalRecordCount,
        results: results?.map((e) => e.toModel()).toList(),
      );
}

@freezed
class EmployeeResultApiDto
    with _$EmployeeResultApiDto
    implements ApiDto<EmployeeResult> {
  const factory EmployeeResultApiDto({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
    String? mobileNumber,
    int? gender,
  }) = _EmployeeResultApiDto;
  const EmployeeResultApiDto._();

  factory EmployeeResultApiDto.fromJson(Map<String, dynamic> json) =>
      _$EmployeeResultApiDtoFromJson(json);

  @override
  EmployeeResult toModel() => EmployeeResult(
        id: id,
        email: email,
        firstName: firstName,
        lastName: lastName,
        gender: gender,
        mobileNumber: mobileNumber,
      );
}
