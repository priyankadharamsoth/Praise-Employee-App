import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../domain/states/employee_state.dart';
import '../../../../../providers/employee/employee_provider.dart';
import '../../../../widgets/custom_appbar.dart';
import '../../../../widgets/shimmer/list_place_holder.dart';
import 'widgets/list_tile_cards.dart';
import 'widgets/search_bar.dart';

@RoutePage()
class EmployeeScreen extends ConsumerWidget {
  const EmployeeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final employeeState = ref.watch(employeeNotifierProvider);
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Employees",
        isBackArrowVisible: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SearchBarWidget(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: switch (employeeState) {
                EmployeeStateLoading() => const ListPlaceHolder(
                    noOfTiles: 5,
                  ),
                EmployeeStateLoaded(employees: var employees) =>
                  ListTileCards(employees: employees),
                EmployeeStateError(ex: var ex) => Text(ex.toString()),
              },
            )
          ],
        ),
      ),
    );
  }
}
