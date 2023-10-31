import '../../../core/utils/api/request_body.dart';

class PraiseEmployeeRequestBody extends RequestBody {
  final int senderEmplyeeId;
  final int receiverEmployeeId;
  final int praiseId;
  final String description;
  final int colorCode;

  PraiseEmployeeRequestBody({
    required this.senderEmplyeeId,
    required this.receiverEmployeeId,
    required this.praiseId,
    required this.description,
    required this.colorCode,
  });

  @override
  Map<String, dynamic> toJson() => {
        "senderEmplyeeId": senderEmplyeeId,
        "receiverEmployeeId": receiverEmployeeId,
        "praiseId": praiseId,
        "description": description,
        "colorCode": colorCode,
      };
}
