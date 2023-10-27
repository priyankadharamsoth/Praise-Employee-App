import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/utils/mappers/api_dto.dart';
import '../../../../domain/models/employee/employee.dart';

part 'employee_api_dto.freezed.dart';
part 'employee_api_dto.g.dart';

@freezed
class EmployeeApiDto with _$EmployeeApiDto implements ApiDto<Employee> {
  const factory EmployeeApiDto({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
    String? mobileNumber,
    int? gender,
  }) = _EmployeeApiDto;
  const EmployeeApiDto._();

  factory EmployeeApiDto.fromJson(Map<String, dynamic> json) =>
      _$EmployeeApiDtoFromJson(json);

  @override
  Employee toModel() => Employee(
        id: id,
        email: email,
        firstName: firstName,
        lastName: lastName,
        gender: gender,
        mobileNumber: mobileNumber,
      );
}
