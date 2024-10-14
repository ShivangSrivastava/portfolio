import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData dartTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      fontFamily: GoogleFonts.firaSans().fontFamily,
      tooltipTheme: const TooltipThemeData(
        textStyle: TextStyle(color: Colors.white70),
        decoration: BoxDecoration(
          color: Color(0xee28282b),
        ),
      ),
    );
  }
}
