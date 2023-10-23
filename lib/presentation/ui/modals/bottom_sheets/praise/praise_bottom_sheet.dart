import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/utils/extensions/context_extension.dart';
import '../../../../../core/utils/styles/colors/ui_colors_light.dart';
import '../../../../../core/utils/styles/dimensions/ui_dimensions.dart';
import '../../../../providers/praise_employee/praise_employee_provider.dart';
import '../../../screens/landing/screens/praises/widgets/template_tile.dart';
import '../../../widgets/custom_text.dart';

@RoutePage(name: "PraiseTemplateBottomSheetRoute")
class PraiseTemplateBottomSheet extends ConsumerWidget {
  const PraiseTemplateBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: UIDimensions.allPaddingGeometry(16),
      child: SizedBox(
        height: context.screenHeight * 0.35,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomText.headlineLarge("Select A Praise"),
                CustomText.headlineMedium(
                  "Done",
                  color: UIColorsLight().tertiary,
                ),
              ],
            ),
            SizedBox(
              height: context.screenHeight * 0.3,
              width: context.screenWidth,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: praiseTemplatesList.length,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: context.screenWidth * 0.35,
                        child: TemplateTile(
                            praiseTeamplate: praiseTemplatesList[index]),
                      ),
                      UIDimensions.horizontalSpaceMedium,
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
