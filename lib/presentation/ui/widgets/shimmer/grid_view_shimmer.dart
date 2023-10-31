import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/extensions/context_extension.dart';
import '../../../../core/utils/styles/dimensions/ui_dimensions.dart';
import 'common_shimmer.dart';

class GridViewShimmer extends StatelessWidget {
  final int? noOfGrids;
  const GridViewShimmer({super.key, this.noOfGrids = 4});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: UIDimensions.height(10),
        mainAxisSpacing: UIDimensions.width(10),
        childAspectRatio: 0.9,
      ),
      primary: false,
      padding: UIDimensions.allPaddingGeometry(20),
      itemCount: noOfGrids ?? 4,
      itemBuilder: (context, index) {
        return CommonShimmer(
          height: 130.h,
          width: context.screenWidth * 0.4,
        );
      },
    );
  }
}
