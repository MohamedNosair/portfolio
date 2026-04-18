import 'package:flutter/material.dart';

class AppTheme {
  // Modern Minimalist Colors - Emerald Green (Matching Profile Photo)
  static const Color primaryBlue = Color(0xFF047857);      // Emerald Dark (from tie)
  static const Color lightBlue = Color(0xFF10B981);        // Emerald Light
  static const Color darkBlue = Color(0xFF065F46);         // Emerald Darker

  static const Color backgroundWhite = Color(0xFFFAFAFA);  // Off-white background
  static const Color cardWhite = Colors.white;             // Pure white cards
  static const Color borderGray = Color(0xFFE5E7EB);       // Light borders

  static const Color textDark = Color(0xFF111827);         // Almost black text
  static const Color textGray = Color(0xFF6B7280);         // Gray text
  static const Color textLight = Color(0xFF9CA3AF);        // Light gray text

  // Spacing System (8px base)
  static const double space1 = 8.0;
  static const double space2 = 16.0;
  static const double space3 = 24.0;
  static const double space4 = 32.0;
  static const double space5 = 40.0;
  static const double space6 = 48.0;
  static const double space8 = 64.0;
  static const double space10 = 80.0;
  static const double space12 = 96.0;

  // Border Radius
  static const double radiusSmall = 12.0;
  static const double radiusMedium = 16.0;
  static const double radiusLarge = 24.0;
  static const double radiusXLarge = 32.0;

  // Text Styles - Modern Typography
  static const TextStyle displayLarge = TextStyle(
    fontSize: 72,
    fontWeight: FontWeight.w800,
    color: textDark,
    height: 1.1,
    letterSpacing: -2,
  );

  static const TextStyle displayMedium = TextStyle(
    fontSize: 56,
    fontWeight: FontWeight.w700,
    color: textDark,
    height: 1.2,
    letterSpacing: -1.5,
  );

  static const TextStyle headlineLarge = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.w700,
    color: textDark,
    height: 1.2,
    letterSpacing: -1,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    color: textDark,
    height: 1.3,
  );

  static const TextStyle titleLarge = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: textDark,
    height: 1.3,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: textGray,
    height: 1.7,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: textGray,
    height: 1.6,
  );

  static const TextStyle labelLarge = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: textLight,
    letterSpacing: 0.5,
  );

  // Card Decoration
  static BoxDecoration cardDecoration({
    Color? color,
    bool withShadow = true,
  }) {
    return BoxDecoration(
      color: color ?? cardWhite,
      borderRadius: BorderRadius.circular(radiusLarge),
      border: Border.all(
        color: borderGray,
        width: 1,
      ),
      boxShadow: withShadow ? [
        BoxShadow(
          color: Colors.black.withOpacity(0.04),
          blurRadius: 20,
          offset: const Offset(0, 4),
        ),
      ] : null,
    );
  }

  // Bento Card Decoration
  static BoxDecoration bentoCardDecoration({
    Color? backgroundColor,
    Color? borderColor,
  }) {
    return BoxDecoration(
      color: backgroundColor ?? cardWhite,
      borderRadius: BorderRadius.circular(radiusMedium),
      border: Border.all(
        color: borderColor ?? borderGray,
        width: 1.5,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.03),
          blurRadius: 12,
          offset: const Offset(0, 2),
        ),
      ],
    );
  }

  // Button Style
  static ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: primaryBlue,
    foregroundColor: Colors.white,
    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(radiusSmall),
    ),
    elevation: 0,
    textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
  );

  static ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
    foregroundColor: primaryBlue,
    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
    side: const BorderSide(color: primaryBlue, width: 1.5),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(radiusSmall),
    ),
    textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
  );

  // Theme Data
  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: backgroundWhite,
      primaryColor: primaryBlue,
      colorScheme: const ColorScheme.light(
        primary: primaryBlue,
        secondary: lightBlue,
        surface: cardWhite,
        background: backgroundWhite,
      ),
      textTheme: const TextTheme(
        displayLarge: displayLarge,
        displayMedium: displayMedium,
        headlineLarge: headlineLarge,
        headlineMedium: headlineMedium,
        titleLarge: titleLarge,
        bodyLarge: bodyLarge,
        bodyMedium: bodyMedium,
        labelLarge: labelLarge,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(style: primaryButtonStyle),
      outlinedButtonTheme: OutlinedButtonThemeData(style: outlineButtonStyle),
    );
  }
}
