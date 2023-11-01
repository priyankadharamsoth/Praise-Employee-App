import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/router/app_router.dart';
import '../../../../../../../core/utils/styles/colors/ui_colors_light.dart';
import '../../../../../../../core/utils/styles/dimensions/ui_dimensions.dart';
import '../../../../../../providers/core/router_provider.dart';

class SearchBarWidget extends ConsumerWidget {
  final bool isSearching;
  final void Function()? onTap;
  final TextEditingController? controller;
  final void Function()? onSearch;
  final void Function(String)? onFieldSubmitted;
  const SearchBarWidget(
      {super.key,
      this.isSearching = false,
      this.onTap,
      this.controller,
      this.onSearch,
      this.onFieldSubmitted});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: UIDimensions.allPaddingGeometry(16),
      child: TextFormField(
        autofocus: isSearching,
        controller: controller,
        onTap: onTap ??
            () {
              ref
                  .read(appRouterProvider)
                  .popAndPush(EmployeeSearchRoute(isSearching: true));
            },
        onFieldSubmitted: onFieldSubmitted,
        decoration: InputDecoration(
          hintText: 'Search here',
          hintStyle: TextStyle(
              color: UIColorsLight().customColors.greyColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500),
          suffixIcon: isSearching
              ? InkWell(
                  onTap: onSearch,
                  child: Icon(
                    Icons.search,
                    size: 24.sp,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
