import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'employee/employee_provider.dart';
import 'praise/employee_praises_provider.dart';

Future<void> initialTopLevelProviders(WidgetRef ref) async {
  ref.read(employeeNotifierProvider.notifier).getAllEmployees();
  ref.read(employeePraisesNotifierProvider.notifier).getEmployeePraises(1);
}
