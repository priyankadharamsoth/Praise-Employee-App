import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/utils/extensions/context_extension.dart';
import '../../../../core/utils/styles/colors/ui_colors_light.dart';
import '../../../../core/utils/styles/dimensions/ui_dimensions.dart';
import '../../../../domain/enums/Praise_images.dart';
import '../../../../domain/models/praise/praise.dart';
import '../../../providers/core/router_provider.dart';
import '../../../providers/praise_employee/praise_employee_provider.dart';
import '../../widgets/buttons/secondary_button.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_text.dart';

@RoutePage()
class PraiseEmployeeScreen extends ConsumerStatefulWidget {
  final Praise praiseTeamplate;
  const PraiseEmployeeScreen({super.key, required this.praiseTeamplate});

  @override
  ConsumerState<PraiseEmployeeScreen> createState() =>
      _PraiseEmployeeScreenState();
}

class _PraiseEmployeeScreenState extends ConsumerState<PraiseEmployeeScreen> {
  @override
  Widget build(BuildContext context) {
    String dropdownvalue = praiseTemplatesList[0].templateName;
    List<String> templatesList =
        praiseTemplatesList.map((e) => e.templateName).toList();
    return Scaffold(
      appBar: const CustomAppBar(title: "Praise"),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: UIDimensions.allPaddingGeometry(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Positioned(
                      top: UIDimensions.height(2),
                      right: UIDimensions.width(12),
                      child: CircleAvatar(
                        radius: UIDimensions.radius(26),
                        child: CircleAvatar(
                          backgroundColor:
                              UIColorsLight().customColors.whiteColor,
                          radius: UIDimensions.buttonR24,
                          child: Icon(
                            Icons.edit,
                            color: UIColorsLight().tertiary,
                          ),
                        ),
                      )),
                  SizedBox(
                    height: context.screenHeight * 0.35,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: context.screenHeight * 0.25,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(PraiseImages.values
                                    .firstWhere(
                                      (element) =>
                                          element.id ==
                                          widget.praiseTeamplate.id,
                                      orElse: () => PraiseImages.thankYou,
                                    )
                                    .imgUrl)),
                          ),
                        ),
                        CustomText.displaySmall(
                            widget.praiseTeamplate.name ?? ""),
                        UIDimensions.verticalSpaceSmall,
                      ],
                    ),
                  ),
                ],
              ),
              const CustomText.bodyMedium("Select an Employee"),
              UIDimensions.verticalSpaceSmall,
              InputDecorator(
                decoration: InputDecoration(
                  fillColor: UIColorsLight().customColors.whiteColor,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: UIColorsLight().customColors.greyColor!),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4.0),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: UIColorsLight().customColors.greyColor!),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4.0),
                    ),
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    isExpanded: true,
                    padding: UIDimensions.allPaddingGeometry(8),
                    borderRadius: BorderRadius.all(
                        Radius.circular(UIDimensions.buttonR4)),
                    value: dropdownvalue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: templatesList.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  ),
                ),
              ),
              UIDimensions.verticalSpaceMedium,
              InputTextFormField(
                initialValue: "Thank You",
                inputTitle: "Select a Praise",
                onTap: () {
                  ref
                      .read(appRouterProvider)
                      .push(const PraiseTemplateBottomSheetRoute());
                },
              ),
              UIDimensions.verticalSpaceMedium,
              TextField(
                maxLines: 5,
                decoration: InputDecoration(
                    hintText: "Description",
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: UIColorsLight().customColors.greyColor!)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: UIColorsLight().customColors.greyColor!)),
                    fillColor: UIColorsLight().customColors.whiteColor),
              ),
              UIDimensions.verticalSpaceMedium,
              const CustomText.bodyMedium("Choose background Theme"),
              UIDimensions.verticalSpaceMedium,
              const ColorSelectorContainer(),
              UIDimensions.verticalSpaceMedium,
              SecondaryButton(
                text: "Preview",
                onPressed: () {},
                borderColor: UIColorsLight().tertiary,
                foregroundColor: UIColorsLight().tertiary,
              ),
              UIDimensions.verticalSpaceMedium,
              SecondaryButton(
                text: "Send Via Outlook",
                onPressed: () {},
                borderColor: UIColorsLight().tertiary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ColorSelectorContainer extends StatelessWidget {
  const ColorSelectorContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: UIDimensions.height(60),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Row(
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  height: UIDimensions.height(50),
                  width: UIDimensions.width(50),
                  color: UIColorsLight().templateColors[index],
                  // child: Align(
                  //     child: Icon(
                  //   Icons.check,
                  //   color: UIColorsLight().tertiary,
                  // )),
                ),
              ),
              UIDimensions.horizontalSpaceSmall,
            ],
          );
        },
      ),
    );
  }
}

class InputTextFormField extends StatelessWidget {
  final String inputTitle;
  final String initialValue;
  final void Function()? onTap;
  const InputTextFormField(
      {super.key,
      required this.inputTitle,
      required this.initialValue,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText.bodyMedium(inputTitle),
        UIDimensions.verticalSpaceSmall,
        TextFormField(
          onTap: onTap,
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: UIColorsLight().customColors.greyColor!)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: UIColorsLight().customColors.greyColor!)),
              fillColor: UIColorsLight().customColors.whiteColor),
          initialValue: initialValue,
        ),
      ],
    );
  }
}
