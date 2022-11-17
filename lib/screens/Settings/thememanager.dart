import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../Theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Theme/typography.dart';
import '../../stores/storemanager.dart';

class ThemeNotifier with ChangeNotifier {
  final darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: AppColors.white),
      systemOverlayStyle: SystemUiOverlayStyle(
        systemStatusBarContrastEnforced: true,
        statusBarColor: AppColors.primary,
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.dark, // For iOS (dark icons)
      ),
    ),
    brightness: Brightness.dark,
    inputDecorationTheme: const InputDecorationTheme(
        fillColor: Colors.white,
        filled: true,
        prefixIconColor: Colors.black,
        iconColor: Colors.black,
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        hintStyle: TextStyle(
          color: Colors.black,
        )),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: GoogleFonts.openSansTextTheme(darkTextTheme)
        .apply(bodyColor: AppColors.white, displayColor: Colors.white),
    backgroundColor: AppColors.black,
    scaffoldBackgroundColor: AppColors.black,
    primaryTextTheme: darkTextTheme,
    primaryIconTheme: const IconThemeData(color: AppColors.white),
    iconTheme: const IconThemeData(color: AppColors.white),
    accentIconTheme: const IconThemeData(color: AppColors.white),
  );

  // ThemeData(
  //   primarySwatch: Colors.grey,
  //   primaryColor: Colors.black,
  //   brightness: Brightness.dark,
  //   backgroundColor: const Color(0xFF212121),
  //   accentColor: Colors.white,
  //   accentIconTheme: IconThemeData(color: Colors.black),
  //   dividerColor: Colors.black12,
  // );

  final lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: AppColors.black),
      systemOverlayStyle: SystemUiOverlayStyle(
        // systemStatusBarContrastEnforced: true,
        statusBarColor: AppColors.primary,
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.dark, // For iOS (dark icons)
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.black.withOpacity(0.1),
        filled: true,
        prefixIconColor: Colors.black,
        hintStyle: const TextStyle(
          color: Colors.black,
        )),
    brightness: Brightness.light,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: GoogleFonts.openSansTextTheme(lightTextTheme)
        .apply(bodyColor: AppColors.greyDark),
    primaryTextTheme: lightTextTheme,
    backgroundColor: AppColors.white,
    scaffoldBackgroundColor: AppColors.white,
  );

  // ThemeData(
  //   primarySwatch: Colors.grey,
  //   primaryColor: Colors.white,
  //   brightness: Brightness.light,
  //   backgroundColor: const Color(0xFFE5E5E5),
  //   accentColor: Colors.black,
  //   accentIconTheme: IconThemeData(color: Colors.white),
  //   dividerColor: Colors.white54,
  // );

  late ThemeData _themeData;
  ThemeData getTheme() => _themeData;

  ThemeNotifier() {
    _themeData = lightTheme;
    StorageManager.readData('themeMode').then((value) {
      print('value read from storage: $value');
      var themeMode = value ?? 'light';
      if (themeMode == 'light') {
        _themeData = lightTheme;
      } else {
        print('setting dark theme');
        _themeData = darkTheme;
      }
      notifyListeners();
    });
  }

  void setDarkMode() async {
    _themeData = darkTheme;
    StorageManager.saveData('themeMode', 'dark');
    notifyListeners();
  }

  void setLightMode() async {
    _themeData = lightTheme;
    StorageManager.saveData('themeMode', 'light');
    notifyListeners();
  }
}
