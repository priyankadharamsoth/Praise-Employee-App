import '../../../core/utils/api/request_body.dart';

class EmployeeRequestBody extends RequestBody {
  final String firstName;
  final String lastName;
  final String mobileNumber;
  final String email;
  final int gender;

  EmployeeRequestBody(
      {required this.firstName,
      required this.lastName,
      required this.mobileNumber,
      required this.email,
      required this.gender});
  @override
  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "mobileNumber": mobileNumber,
        "email": email,
        "gender": gender,
      };
}
