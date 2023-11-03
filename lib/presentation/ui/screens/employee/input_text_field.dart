import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/styles/colors/ui_colors_light.dart';
import '../../../../core/utils/styles/dimensions/ui_dimensions.dart';
import '../../../providers/employee/employee_provider.dart';
import '../../widgets/custom_text.dart';

class InputTextFeild extends ConsumerWidget {
  final String hintText;
  final Widget imageWidget;
  final BoxConstraints? boxConstraints;
  final Widget? suffix;
  final TextEditingController? textEditingController;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final int fieldId;
  const InputTextFeild({
    required this.fieldId,
    required this.hintText,
    required this.imageWidget,
    this.boxConstraints,
    this.suffix,
    this.textEditingController,
    this.validator,
    this.autovalidateMode,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: UIDimensions.symmetricPaddingGeometry(horizontal: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            autovalidateMode: autovalidateMode,
            validator: validator,
            controller: textEditingController,
            onChanged: (val) {
              if (validator != null) {
                ref
                    .read(inputFieldNotifierProvider(fieldId).notifier)
                    .update(validator!(val));
              }
            },
            decoration: InputDecoration(
              fillColor: UIColorsLight().customColors.whiteColor,
              prefixIcon: Padding(
                padding:
                    UIDimensions.symmetricPaddingGeometry(horizontal: 12.h),
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
          if (ref.watch(inputFieldNotifierProvider(fieldId)) != null)
            Padding(
              padding: const EdgeInsets.only(top: 6).h,
              child: CustomText.labelSmall(
                ref.watch(inputFieldNotifierProvider(fieldId))!,
                textAlign: TextAlign.left,
                color: UIColorsLight().error,
              ),
            ),
        ],
      ),
    );
  }
}
