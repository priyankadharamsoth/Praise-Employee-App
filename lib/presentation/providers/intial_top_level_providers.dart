import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'employee/employee_provider.dart';

Future<void> initialTopLevelProviders(WidgetRef ref) async {
  ref.read(employeeNotifierProvider.notifier).getAllEmployees();
}
