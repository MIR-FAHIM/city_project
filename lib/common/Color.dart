import 'package:flutter/material.dart';

class AppColors {

  static final primaryColor = Color(0xFF652981);
  static final primaryLightColor = Color.fromARGB(255, 247, 235, 252);
  static final backgroundColor = Color(0xFFF6F8F6);
  static final SecondbackgroundColor = Color(0xFFE5E5E5);
  static final ThirdbackgroundColor = Color(0xFFF6F6F6);
  static final homeTextColor1 = Color(0xFF404040);
  static final homeTextColor2 = Color(0xFF262626);
  static final homeTextColor3 = Color(0xFF7D7D7D);
  static final redTextColor = Color(0xFFE03131);
  static final greenTextColor = Color(0xFF2F9E44);
  static final ThirdColor = Color(0xFF00AEF0);
  static final homeCardBg = Color(0xFFF6F8F6);
  static final SectionCardBg = Color.fromARGB(255, 230, 230, 230);
  static final tableRowColor = Color(0xFFF2F3F3);
  static final SectionHighLightCardBg = Color.fromARGB(255, 202, 201, 201);
  static final primarydeepLightColor = Color(0xFFEBCEFF);
  static final dividerColor = Color(0xFFEEEEEE);
  static final golden = HexColor("#FFCF40");
  static final gradientOne = HexColor("#6D3587");
  static final gradientTwo = HexColor("#8950A4");
  static final softPink = HexColor("#FFC5C5");
 static final softBrwn = HexColor("#FFEBD8");
 // static final gradientTwo = HexColor("#8950A4");
 // static final gradientTwo = HexColor("#8950A4");
 // static final gradientTwo = HexColor("#8950A4");
  static Color searchBoxColor = Color(0xffA0C828);
  static Color bottomNavColor = Color(0xff838383);
  static Color secondaryColor = Color(0xff0E153D);

  static Color textColorWhite = Color(0xffffffff);
  static Color textColorGrey = Colors.grey;

  static Color textColorBlack = Colors.black;

  static Color textColorRed = Colors.red;
  static Color containerColor = Color(0xffFAFAFA);
  static Color colorBlue = Colors.blue;
  static Color appBackGroundBrn = HexColor("#FDF0C3");
  static Color redButton = HexColor("#E39292");

  static Color textColorGreen = HexColor("#139175");
  static Color newAppColor = const Color(0xFF308E72);
  static Color greenButton = HexColor("#92E3A9");
  static Color jaygaTextFldColor = HexColor("#D9F2ED");
  static Color buttonColorYellow = HexColor("#FFCE4E");
  static Color jaygaWhite = HexColor("#FFFCF3");
  static Color jaygaShadowBrwn = HexColor("#FEF5DD");
  static final jaygaAppBackGroundWhite = HexColor("#F2F2F2");


}
class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}