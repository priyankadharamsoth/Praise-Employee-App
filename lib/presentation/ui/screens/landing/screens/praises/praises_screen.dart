import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../core/router/app_router.dart';
import '../../../../../../core/utils/styles/colors/ui_colors_light.dart';
import '../../../../../../core/utils/styles/dimensions/ui_dimensions.dart';
import '../../../../../../domain/models/praise/praise.dart';
import '../../../../../../domain/states/employee_praise_state.dart';
import '../../../../../providers/core/router_provider.dart';
import '../../../../../providers/praise/employee_praises_provider.dart';
import '../../../../widgets/custom_text.dart';
import 'widgets/template_tile.dart';

@RoutePage()
class PraisesScreen extends ConsumerWidget {
  const PraisesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final employeePraiseState = ref.watch(employeePraisesNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const CustomText.titleLarge("Praises"),
        centerTitle: true,
      ),
      body: switch (employeePraiseState) {
        EmployeePraiseStateLoading() => const CircularProgressIndicator(),
        EmployeePraisesStateLoaded(praises: List<Praise>? praises) =>
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: UIDimensions.height(10),
                mainAxisSpacing: UIDimensions.width(10),
                childAspectRatio: 0.9),
            primary: false,
            padding: UIDimensions.allPaddingGeometry(20),
            itemCount: praises?.length,
            itemBuilder: (context, index) {
              return TemplateTile(
                  praiseTeamplate: praises?[index] ?? const Praise());
            },
          ),
        EmployeePraisesStateError(ex: var ex) => Text(ex.toString()),
      },
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(appRouterProvider).push(const PraiseTemplateRoute());
        },
        heroTag: 'Praises',
        backgroundColor: UIColorsLight().surfaceTint,
        child: Icon(
          Icons.edit,
          color: UIColorsLight().customColors.whiteColor,
        ),
      ),
    );
  }
}
