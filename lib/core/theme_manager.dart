import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '/core/constants.dart';

class ThemeManager {
  static final _font = GoogleFonts.tajawal();

  static ThemeData myTheme = ThemeData(

    appBarTheme: AppBarTheme(
      centerTitle: true,
    ),
    fontFamily: _font.fontFamily,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.r),
          ),
        ),
        minimumSize: WidgetStatePropertyAll(
          Size(double.maxFinite, Constants.buttonHeight),
        ),
      ),
    ),
  );
}
