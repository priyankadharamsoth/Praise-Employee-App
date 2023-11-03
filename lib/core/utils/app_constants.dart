import 'package:flutter/widgets.dart';

class AppConstants {
  //?TODO: Remove this when implementing API store that value as JWT Token not this
  static const String tokenKey = "token";

  //screen key
  static const Key homeScreenKey = Key("homeScreenKey");

  ///Theme Type
  static const String darkTheme = "dark";
  static const String lightTheme = "light";
  static const String systemDefault = "systemDefault";

  ///Secure storage keys
  static const String isOnboardingDoneKey = "isOnboardingDone";
  static const String userKey = "user";
  static const String themeKey = "theme";

  ///Hive Adapter Ids
  //?TODO: Add Hive Adapter Ids
  static const int userAdapterId = 0;

  ///Hive Box Keys
  //?TODO: Add Box Keys
  static const String userBoxKey = "userBox";

  ///Error Messages
  static const String exception = "exception";

  ///Static Messages
  static const String emptyErrorFieldText = "This field can't be empty";
  static const String validMobileNumber = "Enter valid mobile number";

  static const pageSize = 10;

  //fieldId
  static int firstNameFieldId = 1;
  static int lastNameFieldId = 2;
  static int emailFieldId = 3;
  static int mobileNumberFieldId = 4;
  static int genderFieldId = 5;
}
