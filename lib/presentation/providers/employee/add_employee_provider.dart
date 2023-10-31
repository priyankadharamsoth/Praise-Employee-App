// import 'package:riverpod_annotation/riverpod_annotation.dart';

// import '../../../data/models/request_body/employee_request_body.dart';
// import '../../../data/models/result/data_state.dart';
// import '../../../domain/models/employee/employee.dart';
// import '../../../domain/states/add_employee_state.dart';
// import '../../../domain/usecases/employee/employee_usecases.dart';

// part 'add_employee_provider.g.dart';

// @Riverpod()
// class AddEmployeeNotifier extends _$AddEmployeeNotifier {
//   late final AddEmployee _addEmployee = ref.watch(addEmployeeUseCaseProvider);
//   @override
//   AddEmployeeState build() {
//     return const AddEmployeeStateLoading();
//   }

//   Future<bool> addEmployee(EmployeeRequestBody employeeRequestBody) async {
//     state = const AddEmployeeStateLoading();
//     final response = await _addEmployee(employeeRequestBody);
//     switch (response) {
//       case DataStateSuccess<Employee>(data: Employee employee):
//         state = AddEmployeeStateLoaded(employee);
//         return true;
//       case DataStateError<Employee>(ex: var ex):
//         state = AddEmployeeStateError(ex);
//         return false;
//     }
//   }
// }
