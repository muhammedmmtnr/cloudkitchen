import 'dart:math';

import 'package:flutter/material.dart';

class ColorClass {
  // static const Color primaryColor = Color(0xFF324B4F);
  static const Color primaryColor = Color(0xFF14BF9E);
  static const Color backgroundColor = Color(0xFFF9F8F8);

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color gradientSecondaryColor = Color(0xFF203033);
  static const Color gradientPrimaryColor = primaryColor;
  static const Color cyanAccent = Color(0xFF00CFA2);
  static const Color lightCopper = Color(0xFFF3C969);
  static const Color darkAmber = Color(0xFFFF9500);
  static const Color darkRed = Color(0xFFFF3B30);
  static const Color lightYellow = Color(0xFFF3B61F);
  static const Color lightPurple = Color(0xFFCDB4DB);
  static const Color pink = Color(0xFFFFA69E);
  static const Color lightGrey = Color(0xFFEFE5DC);
  static const Color aquaBlue = Color(0xFF1B9AAA);
  static const Color green = Color(0xFF003B36);
  static const Color purple = Color(0xFF717AD8);
  static const Color lightGreen = Color(0xFF16535B);
  static const Color napplesYellow = Color(0xFFF4D35E);
  static const Color mindaro = Color(0xFFD6F599);
  static const Color offWhite = Color(0xFFFCFAFA);
  static const Color greenAlert = Color(0xFF27BB50);
  static const Color orange = Color(0xFFFF8D3F);
  static const Color darkGrey = Color(0xFF324B4F);
  static const Color darkPrimary = Color(0xFF191D1D);
  static const Color progressColor = Color(0xFF009262);
  static const Color greenButtonColor = Color(0xFF00946A);
  static const Color greyBorderColor = Color(0xFF292D32);
  static const Color darkStaleGrey = Color(0xFF324B4F);
  static const Color lightSlateGrey = Color(0xFFB0BEC5);
  static const Color SlateGrey = Color(0xFF2F4858);
  static const Color dropDownGrey = Color(0xFF667085);
  static const Color amberlight = Color(0xFFFFB743);
  static const Color greylight = Color(0xFFFFB743);
  static const Color dividerColor = Color(0xFFFEFEFEF);
  static const Color grey = Color(0xFF9A9FAE);
  static const Color premiumBlack = Color(0xFF1A1C1E);
  static const Color textGrey = Color(0xFF6C7278);
  static const Color borderColor = Color(0xFFCDD0D5);
  static const Color blueColor = Color(0xFF4D81E7);

  static const Color lightMint = Color(0xFFECFFF0);
  static const Color lightPink = Color(0xFFFFECF3);
  static const Color lightPeach = Color(0xFFFFF5E7);
  static const Color lightCyan = Color(0xFFDAFFFF);
  static const Color lightBlue = Color(0xFFECF0FF);
  static const Color mintGreen = Color(0xFFECFFF0);
  static const Color cyan = Color(0xFFDAFFFF);
  static const Color shadowblack = Color(0xFF1B1C1D05);
  static const Color shadowgrey = Color(0xFF1B1CDD0D5);
  static const Color greytext = Color(0xFF1B525866);
  static const Color greenlight = Color(0xFF1B14BF9E);
  static const Color backgroundblack = Color(0xFF1B0A0D14);
  static const Color Containercolor = Color(0xFF1BF4F4F4);
  static const Color darkgrey1 = Color(0xFF1B324B4F99);
  static const Color bordercolor = Color(0xFF1BCDD0D5);
  static const Color greenline = Color(0xFF1B27BB50);
  static const Color palePistaGreen = Color(0XFFECFFF0);
  static const Color darkStale= Color(0XFF324B4F33);
  static const Color black1= Color(0XFF0A0D14);
  static const Color textcolor= Color(0XFF525866);
  static const Color greenpista= Color(0XFF27BB50);
  static const Color bluenavy= Color(0XFF0070A4);
  static const Color secondarycolor= Color(0XFFFFF5E7);
  static const Color strokecolor= Color(0XFFCDD0D5);
  static const Color bluegrey= Color(0XFF243b57);



  

  static Color getRandomColor() {
    final random = Random();
    // List of all colors
    List<Color> colors = [
      lightMint,
      lightPink,
      lightPeach,
      lightCyan,
      lightBlue,
      mintGreen,
      cyan
    ];
    // Pick a random color from the list
    return colors[random.nextInt(colors.length)];
  }
}
