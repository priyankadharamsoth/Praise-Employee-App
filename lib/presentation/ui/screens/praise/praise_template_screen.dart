import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/utils/styles/dimensions/ui_dimensions.dart';
import '../../../../domain/states/praise_state.dart';
import '../../../providers/core/router_provider.dart';
import '../../../providers/praise/praise_provider.dart';
import '../../../providers/praise_employee/praise_employee_provider.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/shimmer/grid_view_shimmer.dart';
import '../landing/screens/praises/widgets/template_tile.dart';

@RoutePage()
class PraiseTemplateScreen extends ConsumerStatefulWidget {
  const PraiseTemplateScreen({super.key});

  @override
  ConsumerState<PraiseTemplateScreen> createState() =>
      _PraiseTemplateScreenState();
}

class _PraiseTemplateScreenState extends ConsumerState<PraiseTemplateScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await ref.read(praiseNotifierProvider.notifier).getAllPraises();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(praiseNotifierProvider);
    final praiseState = ref.watch(praiseNotifierProvider);
    return Scaffold(
        appBar: AppBar(
          title: const CustomText.titleLarge("Templates"),
          centerTitle: true,
          leading: InkWell(
            child: const Icon(Icons.arrow_back),
            onTap: () => context.popRoute(),
          ),
        ),
        body: switch (praiseState) {
          PraiseStateLoading() => const GridViewShimmer(),
          PraiseStateLoaded(praises: var praises) => GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: UIDimensions.height(10),
                mainAxisSpacing: UIDimensions.width(10),
                childAspectRatio: 0.9,
              ),
              primary: false,
              padding: UIDimensions.allPaddingGeometry(20),
              itemCount: praiseTemplatesList.length,
              itemBuilder: (context, index) {
                return TemplateTile(
                  praiseTeamplate: praises[index],
                  onTap: () {
                    ref
                        .read(selectedPraiseNotifierProvider.notifier)
                        .updated(praises[index]);
                    ref
                        .read(appRouterProvider)
                        .push(const PraiseEmployeeRoute());
                  },
                );
              },
            ),
          PraiseStateError() => const Text('error'),
        });
  }
}
