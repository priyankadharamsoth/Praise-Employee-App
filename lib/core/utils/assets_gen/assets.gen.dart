/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/add_user.png
  AssetGenImage get addUser =>
      const AssetGenImage('assets/images/add_user.png');

  /// File path: assets/images/amazing.png
  AssetGenImage get amazing => const AssetGenImage('assets/images/amazing.png');

  /// File path: assets/images/email_color.png
  AssetGenImage get emailColor =>
      const AssetGenImage('assets/images/email_color.png');

  /// File path: assets/images/gender_color.png
  AssetGenImage get genderColor =>
      const AssetGenImage('assets/images/gender_color.png');

  /// File path: assets/images/going_above_beyond.png
  AssetGenImage get goingAboveBeyond =>
      const AssetGenImage('assets/images/going_above_beyond.png');

  /// File path: assets/images/great_job.png
  AssetGenImage get greatJob =>
      const AssetGenImage('assets/images/great_job.png');

  /// File path: assets/images/great_presentation.png
  AssetGenImage get greatPresentation =>
      const AssetGenImage('assets/images/great_presentation.png');

  /// File path: assets/images/icon-female-inactive.png
  AssetGenImage get iconFemaleInactive =>
      const AssetGenImage('assets/images/icon-female-inactive.png');

  /// File path: assets/images/icon-male-inactive.png
  AssetGenImage get iconMaleInactive =>
      const AssetGenImage('assets/images/icon-male-inactive.png');

  /// File path: assets/images/inspiration_leader.png
  AssetGenImage get inspirationLeader =>
      const AssetGenImage('assets/images/inspiration_leader.png');

  /// File path: assets/images/make_work_fun.png
  AssetGenImage get makeWorkFun =>
      const AssetGenImage('assets/images/make_work_fun.png');

  /// File path: assets/images/making_an_impact.png
  AssetGenImage get makingAnImpact =>
      const AssetGenImage('assets/images/making_an_impact.png');

  /// File path: assets/images/mobile_color.png
  AssetGenImage get mobileColor =>
      const AssetGenImage('assets/images/mobile_color.png');

  /// File path: assets/images/name_color.png
  AssetGenImage get nameColor =>
      const AssetGenImage('assets/images/name_color.png');

  /// File path: assets/images/new_user.png
  AssetGenImage get newUser =>
      const AssetGenImage('assets/images/new_user.png');

  /// File path: assets/images/nomeeting.png
  AssetGenImage get nomeeting =>
      const AssetGenImage('assets/images/nomeeting.png');

  /// File path: assets/images/outside_the_box.png
  AssetGenImage get outsideTheBox =>
      const AssetGenImage('assets/images/outside_the_box.png');

  /// File path: assets/images/team_player.png
  AssetGenImage get teamPlayer =>
      const AssetGenImage('assets/images/team_player.png');

  /// File path: assets/images/thank_you.png
  AssetGenImage get thankYou =>
      const AssetGenImage('assets/images/thank_you.png');

  /// File path: assets/images/users.png
  AssetGenImage get users => const AssetGenImage('assets/images/users.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        addUser,
        amazing,
        emailColor,
        genderColor,
        goingAboveBeyond,
        greatJob,
        greatPresentation,
        iconFemaleInactive,
        iconMaleInactive,
        inspirationLeader,
        makeWorkFun,
        makingAnImpact,
        mobileColor,
        nameColor,
        newUser,
        nomeeting,
        outsideTheBox,
        teamPlayer,
        thankYou,
        users
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
