import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/utils/extensions/context_extension.dart';
import '../../../../../../../core/utils/styles/colors/ui_colors_light.dart';
import '../../../../../../../core/utils/styles/dimensions/ui_dimensions.dart';
import '../../../../../widgets/custom_text.dart';

class TemplateTile extends StatelessWidget {
  final int index;
  final String imageUrl;
  const TemplateTile({super.key, required this.imageUrl, required this.index});

  @override
  Widget build(BuildContext context) {
    List<Color> colors = UIColorsLight().templateColors;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 150.h,
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.all(Radius.circular(UIDimensions.cardR16)),
            color: colors[index],
            image: DecorationImage(
              image: AssetImage(imageUrl),
            ),
          ),
        ),
        UIDimensions.verticalSpaceSmall,
        SizedBox(
            width: context.screenWidth * 0.4,
            child: const CustomText.bodyMedium(
              "Thank You ",
              maxLines: 2,
              textAlign: TextAlign.center,
            )),
      ],
    );
  }
}
