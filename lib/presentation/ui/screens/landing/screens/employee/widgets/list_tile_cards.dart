import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/utils/assets_gen/assets.gen.dart';
import '../../../../../../../core/utils/styles/colors/ui_colors_light.dart';
import '../../../../../../../core/utils/styles/dimensions/ui_dimensions.dart';
import '../../../../../../../domain/enums/gender.dart';
import '../../../../../../../domain/models/employee/employee.dart';
import '../../../../../widgets/custom_text.dart';

class ListTileCards extends StatelessWidget {
  final List<Employee> employees;
  const ListTileCards({super.key, required this.employees});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: employees.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: UIDimensions.symmetricPaddingGeometry(
              horizontal: 16, vertical: 8),
          child: ListTile(
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(UIDimensions.cardR16)),
            ),
          tileColor: UIColorsLight().surfaceVariant,
            leading: (employees[index].gender == Gender.male.id)
                ? Assets.images.iconMaleInactive.image(height: 28.sp)
                : Assets.images.iconFemaleInactive.image(height: 28.sp),
            title: CustomText.bodyMedium(employees[index].firstName ?? ""),
            subtitle: CustomText.bodySmall(employees[index].email ?? ""),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18.sp,
            ),
          ),
        );
      },
    );
  }
}
