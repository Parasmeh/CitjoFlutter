import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';
import 'typography.dart';

// ignore: non_constant_identifier_names
ThemeData dark_theme() => ThemeData(
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          systemStatusBarContrastEnforced: true,
          statusBarColor: AppColors.primary,
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.dark, // For iOS (dark icons)
        ),
      ),
      brightness: Brightness.dark,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: GoogleFonts.openSansTextTheme(lightTextTheme).apply(
        bodyColor: AppColors.white,
        displayColor: Colors.white,
      ),
      backgroundColor: AppColors.black,
      scaffoldBackgroundColor: AppColors.black,
      primaryTextTheme: lightTextTheme,
      iconTheme: const IconThemeData(color: AppColors.greyLight),
    );
