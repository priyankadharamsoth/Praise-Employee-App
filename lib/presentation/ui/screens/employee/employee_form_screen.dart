import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/assets_gen/assets.gen.dart';
import '../../../../core/utils/extensions/context_extension.dart';
import '../../../../core/utils/styles/colors/ui_colors_light.dart';
import '../../../../core/utils/styles/dimensions/ui_dimensions.dart';
import '../../../../data/models/request_body/employee_request_body.dart';
import '../../../../domain/enums/gender.dart';
import '../../../providers/employee/add_employee_provider.dart';
import '../../../providers/employee/employee_provider.dart';
import '../../widgets/buttons/primary_button.dart';
import '../../widgets/custom_text.dart';
import 'input_text_field.dart';

@RoutePage()
class EmployeeFormScreen extends ConsumerStatefulWidget {
  const EmployeeFormScreen({super.key});

  @override
  ConsumerState<EmployeeFormScreen> createState() => _EmployeeFormScreenState();
}

class _EmployeeFormScreenState extends ConsumerState<EmployeeFormScreen> {
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController mobileNumberController;
  late final TextEditingController emailController;
  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    mobileNumberController = TextEditingController();
    emailController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText.titleLarge("Employee"),
        centerTitle: true,
        leading: InkWell(
          child: const Icon(Icons.arrow_back),
          onTap: () => context.popRoute(),
        ),
      ),
      body: Column(
        children: [
          CircleAvatar(
            backgroundColor: UIColorsLight().customColors.greyColor,
            radius: UIDimensions.buttonR32,
            child: Assets.images.newUser.image(),
          ),
          UIDimensions.verticalSpaceMedium,
          Form(
            key: formKey,
            child: Column(
              children: [
                InputTextFeild(
                    textEditingController: firstNameController,
                    hintText: "First Name",
                    imageWidget: Assets.images.nameColor.image()),
                InputTextFeild(
                    textEditingController: lastNameController,
                    hintText: "Last Name",
                    imageWidget: Assets.images.nameColor.image()),
                InputTextFeild(
                    textEditingController: mobileNumberController,
                    hintText: "Mobile",
                    imageWidget: Assets.images.mobileColor.image()),
                InputTextFeild(
                  textEditingController: emailController,
                  hintText: "Email",
                  imageWidget: Assets.images.emailColor.image(),
                  boxConstraints:
                      BoxConstraints(minHeight: 18.sp, maxHeight: 20.sp),
                ),
                InputTextFeild(
                  textEditingController: TextEditingController(
                      text: ref.watch(genderNotifierProvider)?.name),
                  hintText: "Gender",
                  imageWidget: Assets.images.genderColor.image(),
                  suffix: SizedBox(
                    width: context.screenWidth * 0.6,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 40,
                          width: context.screenWidth * 0.4,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: Gender.values.length,
                            itemBuilder: (context, index) {
                              final isSelected =
                                  ref.watch(genderNotifierProvider) ==
                                      Gender.values[index];
                              return Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      ref
                                          .read(genderNotifierProvider.notifier)
                                          .update(Gender.values[index]);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: (isSelected)
                                              ? UIColorsLight().surfaceTint
                                              : UIColorsLight()
                                                  .customColors
                                                  .greyColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                  UIDimensions.radius(16)))),
                                      child: Padding(
                                        padding:
                                            UIDimensions.allPaddingGeometry(8),
                                        child: CustomText.labelMedium(
                                          Gender.values[index].name,
                                          color: (isSelected)
                                              ? UIColorsLight()
                                                  .customColors
                                                  .whiteColor
                                              : null,
                                        ),
                                      ),
                                    ),
                                  ),
                                  UIDimensions.horizontalSpaceMedium,
                                ],
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          UIDimensions.verticalSpaceLarge,
          Padding(
            padding: UIDimensions.symmetricPaddingGeometry(horizontal: 8),
            child: PrimaryButton(
                text: "Submit",
                onPressed: () async {
                  final isAdded = await ref
                      .read(addEmployeeNotifierProvider.notifier)
                      .addEmployee(
                        EmployeeRequestBody(
                          firstName: firstNameController.text,
                          lastName: lastNameController.text,
                          mobileNumber: mobileNumberController.text,
                          email: emailController.text,
                          gender: ref.read(genderNotifierProvider)?.id ??
                              Gender.male.id,
                        ),
                      );
                  if (isAdded) {
                    disposeControllers();
                  }
                }),
          )
        ],
      ),
    );
  }

  void disposeControllers() {
    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();
    mobileNumberController.clear();
    ref.read(genderNotifierProvider.notifier).update(null);
  }
}
