/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class $EnvGen {
  const $EnvGen();

  /// File path: .env/.env.dev
  String get envDev => '.env/.env.dev';

  /// File path: .env/.env.prod
  String get envProd => '.env/.env.prod';

  /// File path: .env/.env.stg
  String get envStg => '.env/.env.stg';
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/article_placeholder.webp
  AssetGenImage get articlePlaceholder =>
      const AssetGenImage('assets/images/article_placeholder.webp');

  /// File path: assets/images/icon_placeholder.jpg
  AssetGenImage get iconPlaceholder =>
      const AssetGenImage('assets/images/icon_placeholder.jpg');

  /// File path: assets/images/login_bottom.png
  AssetGenImage get loginBottom =>
      const AssetGenImage('assets/images/login_bottom.png');

  /// File path: assets/images/main_bottom.png
  AssetGenImage get mainBottom =>
      const AssetGenImage('assets/images/main_bottom.png');

  /// File path: assets/images/main_top.png
  AssetGenImage get mainTop =>
      const AssetGenImage('assets/images/main_top.png');

  /// File path: assets/images/signup_top.png
  AssetGenImage get signupTop =>
      const AssetGenImage('assets/images/signup_top.png');
}

class $AssetsLangsGen {
  const $AssetsLangsGen();

  /// File path: assets/langs/en-US.json
  String get enUS => 'assets/langs/en-US.json';

  /// File path: assets/langs/vi-VN.json
  String get viVN => 'assets/langs/vi-VN.json';
}

class $AssetsSvgsGen {
  const $AssetsSvgsGen();

  /// File path: assets/svgs/chat.svg
  SvgGenImage get chat => const SvgGenImage('assets/svgs/chat.svg');

  /// File path: assets/svgs/facebook.svg
  SvgGenImage get facebook => const SvgGenImage('assets/svgs/facebook.svg');

  /// File path: assets/svgs/firebase.svg
  SvgGenImage get firebase => const SvgGenImage('assets/svgs/firebase.svg');

  /// File path: assets/svgs/google_plus.svg
  SvgGenImage get googlePlus =>
      const SvgGenImage('assets/svgs/google_plus.svg');

  /// File path: assets/svgs/login.svg
  SvgGenImage get login => const SvgGenImage('assets/svgs/login.svg');

  /// File path: assets/svgs/news.svg
  SvgGenImage get news => const SvgGenImage('assets/svgs/news.svg');

  /// File path: assets/svgs/signup.svg
  SvgGenImage get signup => const SvgGenImage('assets/svgs/signup.svg');

  /// File path: assets/svgs/twitter.svg
  SvgGenImage get twitter => const SvgGenImage('assets/svgs/twitter.svg');

  /// File path: assets/svgs/video.svg
  SvgGenImage get video => const SvgGenImage('assets/svgs/video.svg');
}

class $AssetsVideosGen {
  const $AssetsVideosGen();

  /// File path: assets/videos/bigbuckbunny.mp4
  String get bigbuckbunny => 'assets/videos/bigbuckbunny.mp4';
}

class Assets {
  Assets._();

  static const $EnvGen env = $EnvGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLangsGen langs = $AssetsLangsGen();
  static const $AssetsSvgsGen svgs = $AssetsSvgsGen();
  static const $AssetsVideosGen videos = $AssetsVideosGen();
}

class AssetGenImage extends AssetImage {
  const AssetGenImage(String assetName) : super(assetName);

  Image image({
    Key? key,
    ImageFrameBuilder? frameBuilder,
    ImageLoadingBuilder? loadingBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? width,
    double? height,
    Color? color,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    FilterQuality filterQuality = FilterQuality.low,
  }) {
    return Image(
      key: key,
      image: this,
      frameBuilder: frameBuilder,
      loadingBuilder: loadingBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      filterQuality: filterQuality,
    );
  }

  String get path => assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
    bool cacheColorFilter = false,
    SvgTheme? theme,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      color: color,
      colorBlendMode: colorBlendMode,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
      theme: theme,
    );
  }

  String get path => _assetName;
}
