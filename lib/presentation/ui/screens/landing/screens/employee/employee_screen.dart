import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../domain/states/employee_state.dart';
import '../../../../../providers/employee/employee_provider.dart';
import '../../../../widgets/custom_text.dart';
import 'widgets/list_tile_cards.dart';
import 'widgets/search_bar.dart';

@RoutePage()
class EmployeeScreen extends ConsumerStatefulWidget {
  const EmployeeScreen({super.key});

  @override
  ConsumerState<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends ConsumerState<EmployeeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await ref.read(employeeNotifierProvider.notifier).getAllEmployees();
    });
  }

  @override
  Widget build(BuildContext context) {
    final employeeState = ref.watch(employeeNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const CustomText.titleLarge(
          "Employees",
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SearchBarWidget(),
            switch (employeeState) {
              EmployeeStateLoading() => const Center(
                  child: CircularProgressIndicator(),
                ),
              EmployeeStateLoaded(employees: var employees) =>
                ListTileCards(employees: employees),
              EmployeeStateError(ex: var ex) => Text(ex.toString()),
            }
          ],
        ),
      ),
    );
  }
}
