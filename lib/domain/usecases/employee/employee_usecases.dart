import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/configs/usecase.dart';
import '../../../core/utils/api/query_params.dart';
import '../../../data/models/request_body/employee_request_body.dart';
import '../../../data/models/result/data_state.dart';
import '../../models/employee/employee.dart';
import '../../repositories/employee_repository.dart';
import '../../service_providers.dart';

part 'get_all_employees.dart';
part 'add_employee.dart';
part 'employee_usecases.g.dart';
