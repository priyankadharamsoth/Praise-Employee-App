import 'app_constants.dart';
import 'extensions/validation_extensions.dart';

class FormValidator {
  const FormValidator._();

  static String? emailValidator(String? email) {
    if (email == null || email.isEmpty) {
      return AppConstants.emptyErrorFieldText;
    } else if (!email.isValidEmail) {
      return "Enter valid email";
    }
    return null;
  }

  static String? isEmptyValidator(String? val) {
    if (val == null || val.isEmpty) {
      return AppConstants.emptyErrorFieldText;
    }
    return null;
  }

  static String? numberValiator(String? val) {
    if (val == null || val.isEmpty) {
      return AppConstants.emptyErrorFieldText;
    } else if (val.length != 10) {
      return AppConstants.validMobileNumber;
    }
    return null;
  }
}
