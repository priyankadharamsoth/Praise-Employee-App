import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/router/app_router.dart';
import '../../../../../../../core/utils/extensions/context_extension.dart';
import '../../../../../../../core/utils/styles/dimensions/ui_dimensions.dart';
import '../../../../../../providers/core/router_provider.dart';
import '../../../../../../providers/praise_employee/praise_employee_provider.dart';
import '../../../../../widgets/custom_text.dart';

class TemplateTile extends ConsumerWidget {
  final PraiseTeamplate praiseTeamplate;
  const TemplateTile({super.key, required this.praiseTeamplate});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () => ref
              .read(appRouterProvider)
              .push(PraiseEmployeeRoute(praiseTeamplate: praiseTeamplate)),
          child: Container(
            height: 130.h,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.all(Radius.circular(UIDimensions.cardR16)),
              color: praiseTeamplate.templateBackgroundColor,
              image: DecorationImage(
                image: AssetImage(praiseTeamplate.templateImageUrl),
              ),
            ),
          ),
        ),
        UIDimensions.verticalSpaceSmall,
        SizedBox(
            width: context.screenWidth * 0.4,
            child: CustomText.bodyMedium(
              praiseTeamplate.templateName,
              maxLines: 2,
              textAlign: TextAlign.center,
            )),
      ],
    );
  }
}
