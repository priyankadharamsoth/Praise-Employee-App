import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/assets_gen/assets.gen.dart';
import '../../../../core/utils/form_validators.dart';
import '../../../../core/utils/styles/colors/ui_colors_light.dart';
import '../../../../core/utils/styles/dimensions/ui_dimensions.dart';
import '../../../../data/models/request_body/employee_request_body.dart';
import '../../../../domain/enums/gender.dart';
import '../../../providers/employee/employee_provider.dart';
import '../../widgets/buttons/primary_button.dart';
import '../../widgets/custom_text.dart';
import 'input_text_field.dart';
import 'widgets/switch_container.dart';

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
      body: SingleChildScrollView(
        child: Column(
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
                      //autovalidateMode: AutovalidateMode.onUserInteraction,
                      fieldId: AppConstants.firstNameFieldId,
                      validator: FormValidator.isEmptyValidator,
                      textEditingController: firstNameController,
                      hintText: "First Name",
                      imageWidget: Assets.images.nameColor.image()),
                  InputTextFeild(
                      //autovalidateMode: AutovalidateMode.onUserInteraction,
                      fieldId: AppConstants.lastNameFieldId,
                      validator: FormValidator.isEmptyValidator,
                      textEditingController: lastNameController,
                      hintText: "Last Name",
                      imageWidget: Assets.images.nameColor.image()),
                  InputTextFeild(
                     // autovalidateMode: AutovalidateMode.onUserInteraction,
                      fieldId: AppConstants.mobileNumberFieldId,
                      validator: FormValidator.numberValiator,
                      textEditingController: mobileNumberController,
                      hintText: "Mobile",
                      imageWidget: Assets.images.mobileColor.image()),
                  InputTextFeild(
                    //autovalidateMode: AutovalidateMode.onUserInteraction,
                    fieldId: AppConstants.emailFieldId,
                    validator: FormValidator.emailValidator,
                    textEditingController: emailController,
                    hintText: "Email",
                    imageWidget: Assets.images.emailColor.image(),
                    boxConstraints:
                        BoxConstraints(minHeight: 18.sp, maxHeight: 20.sp),
                  ),
                  InputTextFeild(
                    //autovalidateMode: AutovalidateMode.onUserInteraction,
                    fieldId: AppConstants.genderFieldId,
                    validator: (val) {
                      if (val == null || val.isNotEmpty) {
                        return "Please select your gender";
                      }
                      return null;
                    },
                    textEditingController: TextEditingController(
                        text: ref.watch(genderNotifierProvider)?.name),
                    hintText: "Gender",
                    imageWidget: Assets.images.genderColor.image(),
                    suffix: const GenderSelectorContainer(),
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
                  if (firstNameController.text.isNotEmpty &&
                      lastNameController.text.isNotEmpty &&
                      emailController.text.isNotEmpty &&
                      mobileNumberController.text.isNotEmpty &&
                      ref.read(genderNotifierProvider) != null) {
                    final isAdded = await ref
                        .read(employeeNotifierProvider.notifier)
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
                      if (context.mounted) {
                        context.popRoute();
                      }
                      disposeControllers();
                    }
                  }
                },
              ),
            )
          ],
        ),
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
