import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/utils/styles/colors/ui_colors_light.dart';
import '../../../../../../../core/utils/styles/dimensions/ui_dimensions.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: UIDimensions.allPaddingGeometry(16),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search here',
          hintStyle: TextStyle(
              color: UIColorsLight().customColors.greyColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500),
          suffixIcon: Icon(
            Icons.search,
            size: 24.sp,
          ),
        ),
      ),
    );
  }
}
