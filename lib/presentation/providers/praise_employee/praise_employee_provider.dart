import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/utils/assets_gen/assets.gen.dart';
import '../../../core/utils/styles/colors/ui_colors_light.dart';
import '../../../data/models/request_body/praise_employee_request_body.dart';
import '../../../data/models/result/data_state.dart';
import '../../../domain/models/base_response/base_response.dart';
import '../../../domain/models/employee/employee.dart';
import '../../../domain/models/praise/praise.dart';
import '../../../domain/states/praise_employee_state.dart';
import '../../../domain/usecases/praise_employee/praise_employee_usecases.dart';

part 'praise_employee_provider.g.dart';

class PraiseTeamplate {
  final String templateName;
  final String templateImageUrl;
  final Color templateBackgroundColor;

  const PraiseTeamplate(
      this.templateName, this.templateImageUrl, this.templateBackgroundColor);
}

List<PraiseTeamplate> praiseTemplatesList = [
  PraiseTeamplate(
    "Thank You",
    Assets.images.thankYou.path,
    UIColorsLight().templateColors[0],
  ),
  PraiseTeamplate(
    "Amazing Work",
    Assets.images.amazing.path,
    UIColorsLight().templateColors[1],
  ),
  PraiseTeamplate(
    "Making Working Fun",
    Assets.images.makeWorkFun.path,
    UIColorsLight().templateColors[2],
  ),
  PraiseTeamplate(
    "Going Above & Beyond",
    Assets.images.goingAboveBeyond.path,
    UIColorsLight().templateColors[3],
  ),
  PraiseTeamplate(
    "Inspiration Leader",
    Assets.images.inspirationLeader.path,
    UIColorsLight().templateColors[0],
  ),
  PraiseTeamplate(
    "OutSide Box Thinker",
    Assets.images.outsideTheBox.path,
    UIColorsLight().templateColors[1],
  ),
  PraiseTeamplate(
    "Great Presentation",
    Assets.images.greatPresentation.path,
    UIColorsLight().templateColors[2],
  ),
  PraiseTeamplate(
    "Team Player",
    Assets.images.teamPlayer.path,
    UIColorsLight().templateColors[3],
  ),
];

@Riverpod()
class PraiseEmployeeNotifier extends _$PraiseEmployeeNotifier {
  late final GivePraise _givePraise = ref.watch(givePraiseUsecaseProvider);
  @override
  PraiseEmployeeState build() {
    return const PraiseEmployeeStateLoading();
  }

  Future<bool> givePraise(
      PraiseEmployeeRequestBody praiseEmployeeRequestBody) async {
    final response = await _givePraise(praiseEmployeeRequestBody);
    switch (response) {
      case DataStateSuccess<BaseResponse>(data: BaseResponse data):
        state = PraiseEmployeeStateLoaded(data.data as bool);
        return data.data as bool;
      case DataStateError<BaseResponse>(ex: var ex):
        state = PraiseEmployeeStateError(ex);
        return false;
    }
  }
}

@Riverpod()
class SelectedEmployeeNotfier extends _$SelectedEmployeeNotfier {
  @override
  Employee? build() {
    return null;
  }

  void updated(Employee? val) {
    state = val;
  }
}

@Riverpod(keepAlive: true)
class SelectedPraiseNotifier extends _$SelectedPraiseNotifier {
  @override
  Praise? build() {
    return null;
  }

  void updated(Praise val) {
    state = val;
  }
}

@Riverpod()
class SelectedColor extends _$SelectedColor {
  @override
  int? build() {
    return ref.read(selectedPraiseNotifierProvider)?.colorCode;
  }

  void updated(int val) {
    state = val;
  }
}
