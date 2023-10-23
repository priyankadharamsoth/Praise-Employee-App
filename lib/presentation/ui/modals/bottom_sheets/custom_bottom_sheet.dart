import 'package:flutter/material.dart';

import '../../../../core/utils/styles/dimensions/ui_dimensions.dart';

class CustomButtonBottomSheet extends StatelessWidget {
  final Widget child;

  const CustomButtonBottomSheet({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(UIDimensions.cardR24),
        child: child,
      ),
    );
  }
}
