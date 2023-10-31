import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/utils/extensions/context_extension.dart';
import '../../../../core/utils/styles/colors/ui_colors_light.dart';
import '../../../../core/utils/styles/dimensions/ui_dimensions.dart';
import '../../../../data/models/request_body/praise_employee_request_body.dart';
import '../../../../domain/enums/Praise_images.dart';
import '../../../../domain/enums/colors.dart';
import '../../../../domain/models/praise/praise.dart';
import '../../../providers/core/router_provider.dart';
import '../../../providers/praise/employee_praises_provider.dart';
import '../../../providers/praise_employee/praise_employee_provider.dart';
import '../../modals/snack_bar/snack_bar_factory.dart';
import '../../widgets/buttons/secondary_button.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_text.dart';
import 'widgets/autofill_text_field.dart';
import 'widgets/color_selector_container.dart';

@RoutePage()
class PraiseEmployeeScreen extends ConsumerStatefulWidget {
  const PraiseEmployeeScreen({super.key});

  @override
  ConsumerState<PraiseEmployeeScreen> createState() =>
      _PraiseEmployeeScreenState();
}

class _PraiseEmployeeScreenState extends ConsumerState<PraiseEmployeeScreen> {
  late TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    descriptionController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(selectedPraiseNotifierProvider);
    Praise praiseTemplate =
        ref.watch(selectedPraiseNotifierProvider) ?? const Praise();
    final Color selectedColor = Color(int.parse(ColorCode.values
        .firstWhere((element) => element.id == ref.watch(selectedColorProvider),
            orElse: () => ColorCode.blue)
        .color));
    return Scaffold(
      appBar: CustomAppBar(
        title: "Praise",
        onBackTap: () => ref.read(appRouterProvider).popUntilRoot(),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  color: selectedColor,
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
                                        element.id == praiseTemplate.id,
                                    orElse: () => PraiseImages.thankYou,
                                  )
                                  .imgUrl)),
                        ),
                      ),
                      CustomText.headlineMedium(praiseTemplate.name ?? ""),
                      UIDimensions.verticalSpaceSmall,
                      if (ref
                              .watch(selectedEmployeeNotfierProvider)
                              ?.firstName !=
                          null)
                        CustomText.headlineLarge(
                          "${(ref.watch(selectedEmployeeNotfierProvider)?.firstName)} ${(ref.watch(selectedEmployeeNotfierProvider)?.lastName)}",
                          color: UIColorsLight().tertiary,
                        ),
                    ],
                  ),
                ),
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
              ],
            ),
            Padding(
              padding: UIDimensions.allPaddingGeometry(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText.bodyMedium("Select an Employee"),
                  UIDimensions.verticalSpaceSmall,
                  const AutoFillTextField(),

                  UIDimensions.verticalSpaceMedium,
                  InputTextFormField(
                    controller: TextEditingController(
                        text: ref.watch(selectedPraiseNotifierProvider)?.name),
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
                    controller: descriptionController,
                    decoration: InputDecoration(
                        hintText: "Description",
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                    UIColorsLight().customColors.greyColor!)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                    UIColorsLight().customColors.greyColor!)),
                        fillColor: UIColorsLight().customColors.whiteColor),
                  ),
                  UIDimensions.verticalSpaceMedium,
                  const CustomText.bodyMedium("Choose background Theme"),
                  UIDimensions.verticalSpaceMedium,
                  const ColorSelectorContainer(),
                  UIDimensions.verticalSpaceMedium,
                  SecondaryButton(
                    text: "Submit",
                    onPressed: () async {
                      final isSuccess = await ref
                          .read(employeePraisesNotifierProvider.notifier)
                          .givePraise(
                            PraiseEmployeeRequestBody(
                              //TODO: static senderEmployeeID
                              senderEmplyeeId: 1,
                              receiverEmployeeId: ref
                                  .read(selectedEmployeeNotfierProvider)!
                                  .id!,
                              praiseId: ref
                                      .read(selectedPraiseNotifierProvider)
                                      ?.id ??
                                  1,
                              description: descriptionController.text,
                              colorCode: ref.read(selectedColorProvider) ?? 1,
                            ),
                          );
                      if (isSuccess) {
                        if (context.mounted) {
                          context.popRoute();
                        }
                        SnackbarFactory.showSuccess("Praise sent");
                      }
                    },
                    borderColor: UIColorsLight().tertiary,
                    foregroundColor: UIColorsLight().tertiary,
                  )

                  // UIDimensions.verticalSpaceMedium,
                  // SecondaryButton(
                  //   text: "Send Via Outlook",
                  //   onPressed: () {},
                  //   borderColor: UIColorsLight().tertiary,
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void disposeControllers() {
    descriptionController.clear();
    ref.read(selectedEmployeeNotfierProvider.notifier).updated(null);
  }
}

class InputTextFormField extends StatelessWidget {
  final String inputTitle;
  final String? initialValue;
  final TextEditingController? controller;
  final void Function()? onTap;
  const InputTextFormField(
      {super.key,
      required this.inputTitle,
      this.initialValue,
      this.controller,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText.bodyMedium(inputTitle),
        UIDimensions.verticalSpaceSmall,
        TextFormField(
          controller: controller,
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
