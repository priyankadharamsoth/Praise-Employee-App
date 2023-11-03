import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/extensions/context_extension.dart';
import '../../../../core/utils/styles/dimensions/ui_dimensions.dart';
import 'common_shimmer.dart';

class ListPlaceHolder extends StatelessWidget {
  final int? noOfTiles;
  final double? height;
  final double? width;
  const ListPlaceHolder({super.key, this.noOfTiles, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: noOfTiles,
        itemBuilder: (context, index) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CommonShimmer(height: 70.h, width: context.screenWidth * 0.85),
              UIDimensions.verticalSpaceMedium,
            ],
          );
        },
      ),
    );
  }
}
