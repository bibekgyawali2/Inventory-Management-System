import 'package:flutter/material.dart';

class TextThemes {
  static TextTheme textTheme() => const TextTheme(
        bodyLarge: TextStyle(
          //      color: appTheme.tealA400,
          fontSize: 18,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          //        color: appTheme.gray600,
          fontSize: 14,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          //      color: appTheme.blueGray300,
          fontSize: 12,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        displayMedium: TextStyle(
          //      color: appTheme.gray600,
          fontSize: 40,
          fontFamily: 'Open Sans',
          fontWeight: FontWeight.w700,
        ),
        headlineMedium: TextStyle(
          //   color: appTheme.gray600,
          fontSize: 27,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        labelLarge: TextStyle(
          //    color: appTheme.gray600,
          fontSize: 12,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
        ),
        titleLarge: TextStyle(
          //    color: appTheme.gray600,
          fontSize: 22,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
        titleMedium: TextStyle(
          //   color: appTheme.gray600,
          fontSize: 16,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
        titleSmall: TextStyle(
          //     color: appTheme.gray600,
          fontSize: 14,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
        ),
      );
}
