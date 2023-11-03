import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/utils/api/query_params.dart';
import '../../../core/utils/app_constants.dart';
import '../../../data/models/request_body/employee_request_body.dart';
import '../../../data/models/result/data_state.dart';
import '../../../domain/enums/gender.dart';
import '../../../domain/models/employee/employee.dart';
import '../../../domain/states/employee_state.dart';
import '../../../domain/usecases/employee/employee_usecases.dart';

part 'employee_provider.g.dart';

@riverpod
class EmployeeNotifier extends _$EmployeeNotifier {
  late final GetAllEmployees _getAllEmployees =
      ref.watch(getAllEmployeesUseCaseProvider);
  late final AddEmployee _addEmployee = ref.watch(addEmployeeUseCaseProvider);
  int page = 1;
  static List<EmployeeResult> employees = [];

  @override
  EmployeeState build() {
    return const EmployeeStateLoading();
  }

  int get totalCount => switch (state) {
        EmployeeStateLoading() || EmployeeStateError() => 0,
        EmployeeStateLoaded(employees: EmployeeData employeeData) =>
          employeeData.totalRecordCount ?? 0,
      };

  EmployeeData? get employeeData => switch (state) {
        EmployeeStateLoading() || EmployeeStateError() => null,
        EmployeeStateLoaded(employees: EmployeeData employees) => employees,
      };

  bool get hasNext => switch (state) {
        EmployeeStateLoading() || EmployeeStateError() => false,
        EmployeeStateLoaded(employees: EmployeeData employees) =>
          (employees.totalRecordCount ?? 0) >
              ((employees.results != null && employees.results!.isNotEmpty)
                  ? employees.results!.length
                  : 0),
      };

  int getNextPage(int length) {
    return (length / AppConstants.pageSize).floor() + 1;
  }

  Future<void> getAllEmployees({bool isUpdating = false}) async {
    if (!isUpdating) {
      page = page;
      employees = [];
      state = const EmployeeStateLoading();
    }

    final dataState = await _getAllEmployees(QueryParams(page, 10, ''));
    switch (dataState) {
      case DataStateSuccess<EmployeeData>(data: var employeeData):
        if (employeeData.results != null && employeeData.results!.isNotEmpty) {
          employees.addAll(employeeData.results!);
        }
        state = EmployeeStateLoaded(
            employees: EmployeeData(
          totalRecordCount: employeeData.totalRecordCount,
          results: employees,
        ));
        page = getNextPage(employees.length);
      case DataStateError<EmployeeData>(ex: var ex):
        state = EmployeeStateError(ex: ex);
    }
  }

  Future<bool> addEmployee(EmployeeRequestBody employeeRequestBody) async {
    final response = await _addEmployee(employeeRequestBody);
    switch (response) {
      case DataStateSuccess<EmployeeResult>(data: EmployeeResult employee):
        final List<EmployeeResult> employeeList = employeeData != null &&
                employeeData!.results != null &&
                employeeData!.results!.isNotEmpty
            ? employeeData!.results!.toList()
            : [];
        employeeList.insert(0, employee);
        state = EmployeeStateLoaded(
            employees: EmployeeData(
                results: employeeList, totalRecordCount: totalCount + 1));
        return true;
      case DataStateError<EmployeeResult>(ex: var ex):
        state = EmployeeStateError(ex: ex);
        return false;
    }
  }
}

@Riverpod(keepAlive: true)
class GenderNotifier extends _$GenderNotifier {
  @override
  Gender? build() {
    return null;
  }

  void update(Gender? gender) {
    state = gender;
  }
}

@Riverpod()
class InputFieldNotifier extends _$InputFieldNotifier {
  @override
  String? build(int id) {
    return null;
  }

  void update(String? val) {
    state = val;
  }
}

@riverpod
class SearchEmployeeNotifier extends _$SearchEmployeeNotifier {
  late final GetAllEmployees _getAllEmployees =
      ref.watch(getAllEmployeesUseCaseProvider);
  @override
  EmployeeState build() {
    return const EmployeeStateLoading();
  }

  Future<void> searchEmployee(String searchWord) async {
    state = const EmployeeStateLoading();
    final dataState = await _getAllEmployees(QueryParams(1, 30, searchWord));
    switch (dataState) {
      case DataStateSuccess<EmployeeData>(data: var employees):
        state = EmployeeStateLoaded(employees: employees);

      case DataStateError<EmployeeData>(ex: var ex):
        state = EmployeeStateError(ex: ex);
    }
  }
}
