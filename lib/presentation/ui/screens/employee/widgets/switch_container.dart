import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/utils/extensions/context_extension.dart';
import '../../../../../core/utils/styles/colors/ui_colors_light.dart';
import '../../../../../core/utils/styles/dimensions/ui_dimensions.dart';
import '../../../../../domain/enums/gender.dart';
import '../../../../providers/employee/employee_provider.dart';
import '../../../widgets/custom_text.dart';

class GenderSelectorContainer extends ConsumerWidget {
  const GenderSelectorContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: context.screenWidth * 0.6,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: 40,
            width: context.screenWidth * 0.4,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: Gender.values.length,
              itemBuilder: (context, index) {
                final isSelected =
                    ref.watch(genderNotifierProvider) == Gender.values[index];
                return Row(
                  children: [
                    InkWell(
                      onTap: () {
                        ref
                            .read(genderNotifierProvider.notifier)
                            .update(Gender.values[index]);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: (isSelected)
                                ? UIColorsLight().surfaceTint
                                : UIColorsLight().customColors.greyColor,
                            borderRadius: BorderRadius.all(
                                Radius.circular(UIDimensions.radius(16)))),
                        child: Padding(
                          padding: UIDimensions.allPaddingGeometry(8),
                          child: CustomText.labelMedium(
                            Gender.values[index].name,
                            color: (isSelected)
                                ? UIColorsLight().customColors.whiteColor
                                : null,
                          ),
                        ),
                      ),
                    ),
                    UIDimensions.horizontalSpaceMedium,
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
