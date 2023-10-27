import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/utils/mappers/ui_model.dart';
import '../../../data/models/api/employee/employee_api_dto.dart';

part 'employee.freezed.dart';

@freezed
class Employee with _$Employee implements UIModel<EmployeeApiDto> {
  const factory Employee({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
    String? mobileNumber,
    int? gender,
  }) = _Employee;
  const Employee._();
  
  @override
  EmployeeApiDto toApiDto() {
    // TODO: implement toApiDto
    throw UnimplementedError();
  }
}
