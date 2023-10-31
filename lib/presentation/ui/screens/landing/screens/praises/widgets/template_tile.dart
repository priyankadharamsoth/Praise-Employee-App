import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/utils/extensions/context_extension.dart';
import '../../../../../../../core/utils/styles/colors/ui_colors_light.dart';
import '../../../../../../../core/utils/styles/dimensions/ui_dimensions.dart';
import '../../../../../../../domain/enums/Praise_images.dart';
import '../../../../../../../domain/enums/colors.dart';
import '../../../../../../../domain/models/praise/praise.dart';
import '../../../../../widgets/custom_text.dart';

class TemplateTile extends ConsumerWidget {
  final Praise praiseTeamplate;
  final void Function()? onTap;
  final bool isTemplateSelected;
  const TemplateTile(
      {super.key,
      required this.praiseTeamplate,
      this.onTap,
      this.isTemplateSelected = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            height: 130.h,
            decoration: BoxDecoration(
              border: Border.all(
                  color: isTemplateSelected
                      ? UIColorsLight().tertiary
                      : UIColorsLight().background),
              borderRadius:
                  BorderRadius.all(Radius.circular(UIDimensions.cardR16)),
              color: Color(
                int.parse(ColorCode.values
                    .firstWhere(
                      (element) => element.id == praiseTeamplate.colorCode,
                      orElse: () => ColorCode.blue,
                    )
                    .color),
              ),
              image: DecorationImage(
                image: AssetImage(PraiseImages.values
                    .firstWhere(
                      (element) => element.id == praiseTeamplate.id,
                      orElse: () => PraiseImages.thankYou,
                    )
                    .imgUrl),
              ),
            ),
          ),
        ),
        UIDimensions.verticalSpaceSmall,
        SizedBox(
            width: context.screenWidth * 0.4,
            child: CustomText.bodyMedium(
              praiseTeamplate.name ?? "",
              maxLines: 2,
              textAlign: TextAlign.center,
            )),
      ],
    );
  }
}
