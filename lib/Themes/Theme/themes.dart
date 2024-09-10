import 'package:aspen_explore_application/Themes/dark_theme_colors.dart';
import 'package:aspen_explore_application/Themes/light_theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  static ThemeData get lightTheme => ThemeData(
        textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
          padding: WidgetStatePropertyAll(EdgeInsets.zero),
        )),
        popupMenuTheme: PopupMenuThemeData(
          position: PopupMenuPosition.over,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          iconColor: LightThemeColors.primary,
        ),
        iconTheme: IconThemeData(color: LightThemeColors.primary),
        textTheme: GoogleFonts.latoTextTheme(
          const TextTheme(bodyMedium: TextStyle(color: Colors.black)),
        ),
        colorScheme: const ColorScheme.light(
          brightness: Brightness.light,
          primary: LightThemeColors.primary,
          primaryContainer: LightThemeColors.primaryContainer,
          onPrimary: LightThemeColors.onPrimary,
          surface: LightThemeColors.surface,
          onSurface: LightThemeColors.onSurface,
        ),
      );

  static ThemeData get darkTheme => ThemeData(
        textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
          padding: WidgetStatePropertyAll(EdgeInsets.zero),
        )),
        popupMenuTheme: PopupMenuThemeData(
          position: PopupMenuPosition.over,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          iconColor: DarkThemeColors.primary,
        ),
        iconTheme: IconThemeData(color: DarkThemeColors.primary),
        textTheme: GoogleFonts.latoTextTheme(
          const TextTheme(
              bodyMedium: TextStyle(color: DarkThemeColors.onSurface)),
        ),
        colorScheme: const ColorScheme.light(
          brightness: Brightness.light,
          primary: DarkThemeColors.primary,
          primaryContainer: DarkThemeColors.primaryContainer,
          onPrimary: DarkThemeColors.onPrimary,
          surface: DarkThemeColors.surface,
          onSurface: DarkThemeColors.onSurface,
        ),
      );
}
