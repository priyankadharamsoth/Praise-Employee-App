import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/utils/assets_gen/assets.gen.dart';
import '../../../../../../../core/utils/styles/colors/ui_colors_light.dart';
import '../../../../../../../core/utils/styles/dimensions/ui_dimensions.dart';
import '../../../../../widgets/custom_text.dart';

class ListTileCards extends StatelessWidget {
  const ListTileCards({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: UIDimensions.allPaddingGeometry(16),
          child: ListTile(
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(UIDimensions.cardR16)),
            ),
            tileColor: UIColorsLight().surfaceVariant,
            leading: Assets.images.iconFemaleInactive.image(height: 28.sp),
            title: const CustomText.bodyMedium("Name of the Employee"),
            subtitle: const CustomText.bodySmall("Email of the employee"),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18.sp,
            ),
          ),
        );
      },
    );
  }
}
