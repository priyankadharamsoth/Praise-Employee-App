import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../../domain/models/employee/employee.dart';
import '../../../../../../../domain/states/employee_state.dart';
import '../../../../../../providers/employee/employee_provider.dart';
import '../../../../../modals/snack_bar/snack_bar_factory.dart';
import '../../../../../widgets/shimmer/list_place_holder.dart';
import 'list_tile_cards.dart';
import 'search_bar.dart';

@RoutePage()
class EmployeeSearchScreen extends ConsumerStatefulWidget {
  final bool isSearching;

  const EmployeeSearchScreen({super.key, this.isSearching = false});

  @override
  ConsumerState<EmployeeSearchScreen> createState() =>
      _EmployeeSearchScreenState();
}

class _EmployeeSearchScreenState extends ConsumerState<EmployeeSearchScreen> {
  late TextEditingController controller;
  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final employeeState = ref.watch(searchEmployeeNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight + 50,
        leading: null,
        title: SearchBarWidget(
          onSearch: () {
            if (controller.text.isNotEmpty && controller.text.length > 2) {
              ref
                  .read(searchEmployeeNotifierProvider.notifier)
                  .searchEmployee(controller.text);
            } else {
              SnackbarFactory.showInfo("Enter atleast 3 letters");
            }
          },
          isSearching: widget.isSearching,
          controller: controller,
          onFieldSubmitted: (val) {
            if (val.isNotEmpty && val.length > 2) {
              ref
                  .read(searchEmployeeNotifierProvider.notifier)
                  .searchEmployee(val);
            } else {
              SnackbarFactory.showInfo("Enter atleast 3 letters");
            }
          },
        ),
      ),
      body: (controller.text.isNotEmpty)
          ? switch (employeeState) {
              EmployeeStateLoading() => const ListPlaceHolder(),
              EmployeeStateLoaded(employees: EmployeeData employees) =>
                (employees.results != null && employees.results!.isNotEmpty)
                    ? ListTileCards(employees: employees.results!)
                    : const Center(
                        child: Text('No Result Found'),
                      ),
              EmployeeStateError() => const Text('error'),
            }
          : null,
    );
  }
}
