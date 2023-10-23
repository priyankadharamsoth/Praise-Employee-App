import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/styles/colors/ui_colors_light.dart';
import '../../../../core/utils/styles/dimensions/ui_dimensions.dart';

class InputTextFeild extends StatelessWidget {
  final String hintText;
  final Widget imageWidget;
  final BoxConstraints? boxConstraints;
  final Widget? suffix;
  const InputTextFeild({
    required this.hintText,
    required this.imageWidget,
    this.boxConstraints,
    this.suffix,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: UIDimensions.symmetricPaddingGeometry(horizontal: 8.h),
      child: TextField(
        decoration: InputDecoration(
          fillColor: UIColorsLight().customColors.whiteColor,
          prefixIcon: Padding(
            padding: UIDimensions.symmetricPaddingGeometry(horizontal: 12.h),
            child: SizedBox(
              width: 30.sp,
              child: imageWidget,
            ),
          ),
          hintText: hintText,
          prefixIconConstraints: boxConstraints ??
              BoxConstraints(maxHeight: 30.sp, minHeight: 24.sp),
          suffixIcon: suffix,
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: UIColorsLight().surfaceTint,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: UIColorsLight().surfaceTint,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: UIColorsLight().surfaceTint,
            ),
          ),
        ),
      ),
    );
  }
}
