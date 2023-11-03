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
class EmployeeScreen extends ConsumerStatefulWidget {
  const EmployeeScreen({super.key});

  @override
  ConsumerState<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends ConsumerState<EmployeeScreen> {
  late TextEditingController searchController;
  bool isLoading = false;
  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final employeeState = ref.watch(employeeNotifierProvider);
    final ScrollController scrollController = ScrollController();
    final EmployeeNotifier employeeNotifier =
        ref.watch(employeeNotifierProvider.notifier);
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Employees",
        isBackArrowVisible: false,
      ),
      body: NotificationListener(
        onNotification: (notification) {
          return _onScrollToMax(ref, scrollController);
        },
        child: SingleChildScrollView(
          controller: scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              SearchBarWidget(
                controller: searchController,
              ),
              Column(mainAxisSize: MainAxisSize.min, children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: switch (employeeState) {
                    EmployeeStateLoading() => const ListPlaceHolder(
                        noOfTiles: 4,
                      ),
                    EmployeeStateLoaded(employees: var employees) => Column(
                        children: [
                          ListTileCards(employees: employees.results ?? []),
                          if (employeeNotifier.hasNext)
                            const ListPlaceHolder(
                              noOfTiles: 2,
                            )
                        ],
                      ),
                    EmployeeStateError(ex: var ex) => Text(ex.toString()),
                  },
                )
              ])
            ],
          ),
        ),
      ),
    );
  }

  bool _onScrollToMax(WidgetRef ref, ScrollController scrollController) {
    var nextPageTrigger = 0.6 * scrollController.position.maxScrollExtent;
    if (scrollController.position.pixels > nextPageTrigger &&
        ref.watch(employeeNotifierProvider.notifier).hasNext &&
        !isLoading) {
      setState(() {
        isLoading = !isLoading;
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
          await ref.read(employeeNotifierProvider.notifier).getAllEmployees(
                isUpdating: true,
              );
          isLoading = !isLoading;
        });
      });
    }
    return false;
  }
}
