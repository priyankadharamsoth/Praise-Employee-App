import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../core/router/app_router.dart';
import '../../../../../../core/utils/assets_gen/assets.gen.dart';
import '../../../../../../core/utils/styles/colors/ui_colors_light.dart';
import '../../../../../../core/utils/styles/dimensions/ui_dimensions.dart';
import '../../../../../providers/core/router_provider.dart';
import '../../../../widgets/custom_text.dart';
import 'widgets/template_tile.dart';

@RoutePage()
class PraisesScreen extends ConsumerWidget {
  const PraisesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText.titleLarge("Praises"),
        centerTitle: true,
      ),
      body: GridView.count(
        primary: false,
        padding: UIDimensions.allPaddingGeometry(20),
        crossAxisSpacing: UIDimensions.height(10),
        mainAxisSpacing: UIDimensions.width(10),
        childAspectRatio: 0.9,
        crossAxisCount: 2,
        children: <Widget>[
          TemplateTile(imageUrl: Assets.images.thankYou.path, index: 0),
          TemplateTile(imageUrl: Assets.images.amazing.path, index: 1),
          TemplateTile(imageUrl: Assets.images.makeWorkFun.path, index: 2),
          TemplateTile(imageUrl: Assets.images.goingAboveBeyond.path, index: 3),
          TemplateTile(
              imageUrl: Assets.images.inspirationLeader.path, index: 0),
          TemplateTile(
              imageUrl: Assets.images.greatPresentation.path, index: 1),
          TemplateTile(imageUrl: Assets.images.teamPlayer.path, index: 2),
          TemplateTile(imageUrl: Assets.images.outsideTheBox.path, index: 3),
        ],
      ),
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
