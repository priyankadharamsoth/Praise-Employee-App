import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/utils/mappers/ui_model.dart';
import '../../../data/models/api/employee/employee_api_dto.dart';

part 'employee.freezed.dart';

@freezed
class Employee with _$Employee implements UIModel<EmployeeApiDto> {
  const factory Employee({
    String? status,
    String? errorCode,
    String? message,
    EmployeeData? data,
  }) = _Employee;
  const Employee._();

  @override
  EmployeeApiDto toApiDto() => EmployeeApiDto(
        data: data?.toApiDto(),
      );
}

@freezed
class EmployeeData with _$EmployeeData implements UIModel<EmployeeDataApiDto> {
  const factory EmployeeData({
    int? totalRecordCount,
    List<EmployeeResult>? results,
  }) = _EmployeeData;
  const EmployeeData._();

  @override
  EmployeeDataApiDto toApiDto() => EmployeeDataApiDto(
      totalRecordCount: totalRecordCount,
      results: results?.map((e) => e.toApiDto()).toList());
}

@freezed
class EmployeeResult
    with _$EmployeeResult
    implements UIModel<EmployeeResultApiDto> {
  const factory EmployeeResult({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
    String? mobileNumber,
    int? gender,
  }) = _EmployeeResult;
  const EmployeeResult._();

  @override
  EmployeeResultApiDto toApiDto() => EmployeeResultApiDto(
      id: id,
      email: email,
      firstName: firstName,
      lastName: lastName,
      gender: gender,
      mobileNumber: mobileNumber);
}
