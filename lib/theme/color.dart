// NOTE: To create an original color panel,
//specify the base color at the following site.
// http://mcg.mbitson.com

part of app_theme;

class AppColors {
  AppColors._();

  static const MaterialColor violet = MaterialColor(
    _violetPrimaryValue,
    <int, Color>{
      50: Color(0xFFEEE7F4),
      100: Color(0xFFD4C2E4),
      200: Color(0xFFB79AD2),
      300: Color(0xFF9A72C0),
      400: Color(0xFF8553B3),
      500: Color(_violetPrimaryValue),
      600: Color(0xFF67309D),
      700: Color(0xFF5C2893),
      800: Color(0xFF52228A),
      900: Color(0xFF401679),
    },
  );
  static const int _violetPrimaryValue = 0xFF6F35A5;

  static const MaterialColor violetAccent = MaterialColor(
    _violetAccent,
    <int, Color>{
      100: Color(0xFFCFB0FF),
      200: Color(_violetAccent),
      400: Color(0xFF904AFF),
      700: Color(0xFF8130FF),
    },
  );
  static const int _violetAccent = 0xFFB07DFF;

  /// #FFFFFF
  static const Color white = Color(0xFFFFFFFF);

  /// #FF0000
  static const Color black = Color(0xFF000000);

  /// #9E9E9E
  static const Color grey = Color(0xFF9E9E9E);
}
