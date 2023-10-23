import 'package:flutter/material.dart';

import '../../../core/utils/assets_gen/assets.gen.dart';
import '../../../core/utils/styles/colors/ui_colors_light.dart';

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
