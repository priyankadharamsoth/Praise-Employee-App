import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/utils/styles/colors/ui_colors_light.dart';
import '../../../../../core/utils/styles/dimensions/ui_dimensions.dart';
import '../../../../../domain/enums/colors.dart';
import '../../../../providers/praise_employee/praise_employee_provider.dart';

class ColorSelectorContainer extends ConsumerWidget {
  const ColorSelectorContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: UIDimensions.height(60),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          final isColorSelected =
              ref.watch(selectedColorProvider) == ColorCode.values[index].id;
          return Row(
            children: [
              InkWell(
                onTap: () {
                  ref
                      .read(selectedColorProvider.notifier)
                      .updated(ColorCode.values[index].id);
                },
                child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: isColorSelected
                              ? UIColorsLight().tertiary
                              : UIColorsLight().background),
                      color: Color(int.parse(ColorCode.values[index].color)),
                    ),
                    height: UIDimensions.height(50),
                    width: UIDimensions.width(50),
                    child: isColorSelected
                        ? Align(
                            child: Icon(
                            Icons.check,
                            color: UIColorsLight().tertiary,
                          ))
                        : null),
              ),
              UIDimensions.horizontalSpaceSmall,
            ],
          );
        },
      ),
    );
  }
}
