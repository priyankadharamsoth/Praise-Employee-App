import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isBackArrowVisible;
  final void Function()? onBackTap;
  final double height;

  const CustomAppBar({super.key, 
    required this.title,
    this.isBackArrowVisible = false,
    this.onBackTap,
    this.height = kToolbarHeight,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: CustomText.titleLarge(title),
      centerTitle: true,
      leading: isBackArrowVisible
          ? InkWell(
              child: const Icon(Icons.arrow_back),
              onTap: () => onBackTap ?? context.popRoute(),
            )
          : null,
    );
  }
}
