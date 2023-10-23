import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/assets_gen/assets.gen.dart';
import '../../../../core/utils/extensions/context_extension.dart';
import '../../../../core/utils/styles/colors/ui_colors_light.dart';
import '../../../../core/utils/styles/dimensions/ui_dimensions.dart';
import '../../widgets/buttons/primary_button.dart';
import '../../widgets/custom_text.dart';
import 'input_text_field.dart';

@RoutePage()
class EmployeeFormScreen extends StatelessWidget {
  const EmployeeFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText.titleLarge("Employee"),
        centerTitle: true,
        leading: InkWell(
          child: const Icon(Icons.arrow_back),
          onTap: () => context.popRoute(),
        ),
      ),
      body: Column(
        children: [
          CircleAvatar(
            backgroundColor: UIColorsLight().customColors.greyColor,
            radius: UIDimensions.buttonR32,
            child: Assets.images.newUser.image(),
          ),
          UIDimensions.verticalSpaceMedium,
          InputTextFeild(
              hintText: "First Name",
              imageWidget: Assets.images.nameColor.image()),
          InputTextFeild(
              hintText: "Last Name",
              imageWidget: Assets.images.nameColor.image()),
          InputTextFeild(
              hintText: "Mobile",
              imageWidget: Assets.images.mobileColor.image()),
          InputTextFeild(
            hintText: "Email",
            imageWidget: Assets.images.emailColor.image(),
            boxConstraints: BoxConstraints(minHeight: 18.sp, maxHeight: 20.sp),
          ),
          InputTextFeild(
            hintText: "Gender",
            imageWidget: Assets.images.genderColor.image(),
            suffix: SizedBox(
              width: context.screenWidth * 0.6,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: UIColorsLight().customColors.greyColor,
                        borderRadius: BorderRadius.all(
                            Radius.circular(UIDimensions.radius(16)))),
                    child: Padding(
                      padding: UIDimensions.allPaddingGeometry(8),
                      child: const CustomText.labelMedium(
                        "Male",
                      ),
                    ),
                  ),
                  UIDimensions.horizontalSpaceMedium,
                  Container(
                    decoration: BoxDecoration(
                        color: UIColorsLight().surfaceTint,
                        borderRadius: BorderRadius.all(
                            Radius.circular(UIDimensions.radius(16)))),
                    child: Padding(
                      padding: UIDimensions.allPaddingGeometry(8),
                      child: CustomText.labelMedium(
                        "Female",
                        color: UIColorsLight().customColors.whiteColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          UIDimensions.verticalSpaceLarge,
          Padding(
            padding: UIDimensions.symmetricPaddingGeometry(horizontal: 8),
            child: PrimaryButton(text: "Submit", onPressed: () {}),
          )
        ],
      ),
    );
  }
}
