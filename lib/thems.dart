import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

const Color bluishClr = Color(0xff4e5ae8);
const Color yellowClr = Color(0xffffb746);
const Color pinkClr = Color(0xffff4667);
const Color darkGreyClr = Color(0xFF121212);
const Color darkHeaderClr = Color(0xFF424242);
const Color colorWhite = Colors.white;
const Color primaryClr = bluishClr;
const MaterialColor primarySwatchColor = MaterialColor(0xff4e5ae8, swatchColor);

class Themes{

  static final light = ThemeData(
    backgroundColor: Colors.white,
    // primaryColor: bluishClr,
    primarySwatch: primarySwatchColor,

    brightness: Brightness.light,
  );

  static final dark =  ThemeData(
    backgroundColor: darkGreyClr,
    primaryColor: darkGreyClr,
    brightness:  Brightness.dark
  );


}

const Map<int, Color> swatchColor = {
  50: Color.fromRGBO(182, 109, 255, .1),
  100: Color.fromRGBO(182, 109, 255, .2),
  200: Color.fromRGBO(182, 109, 255, .3),
  300: Color.fromRGBO(182, 109, 255, .4),
  400: Color.fromRGBO(182, 109, 255, .5),
  500: Color.fromRGBO(182, 109, 255, .6),
  600: Color.fromRGBO(182, 109, 255, .7),
  700: Color.fromRGBO(182, 109, 255, .8),
  800: Color.fromRGBO(182, 109, 255, .9),
  900: Color.fromRGBO(182, 109, 255, 1),
};


TextStyle get subHeadingStyle{
  return GoogleFonts.lato (
      textStyle:  TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Get.isDarkMode? Colors.grey[400]: Colors.grey
      )
  );
}
TextStyle get headingStyle{
  return GoogleFonts.lato (
      textStyle:  TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Get.isDarkMode? Colors.white: Colors.black
      )
  );
}

TextStyle get titleStyle{
  return GoogleFonts.lato (
      textStyle:  TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Get.isDarkMode? Colors.white: Colors.black
      )
  );
}

TextStyle get subTitleStyle{
  return GoogleFonts.lato (
      textStyle:  TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Get.isDarkMode? Colors.grey[100]: Colors.black
      )
  );
}


