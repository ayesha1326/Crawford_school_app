import 'package:flutter/material.dart';

/// Central color palette for Crawford Grammar School
/// Strictly adhering to the school's red, dark navy, and white brand identity.
class AppColors {
  AppColors._();

  // Primary School Colors
  static const Color primaryRed = Color(0xFFE50914);
  static const Color primaryDarkRed = Color(0xFFB80710);
  static const Color darkNavy = Color(0xFF10212B);
  static const Color navyLight = Color(0xFF1A3342);
  static const Color navyLighter = Color(0xFF26465A);

  // Background & Surfaces
  static const Color background = Color(0xFFF5F6F8);
  static const Color lightGrey = Color(0xFFF5F6F8);
  static const Color cardWhite = Color(0xFFFFFFFF);
  static const Color pureWhite = Color(0xFFFFFFFF);
  static const Color borderGrey = Color(0xFFE6E8EC);
  static const Color dividerColor = Color(0xFFEEEEEE);

  // Typography Colors
  static const Color primaryText = Color(0xFF202124);
  static const Color secondaryText = Color(0xFF777777);
  static const Color mutedText = Color(0xFF9AA0A6);
  static const Color lightText = Color(0xFFFFFFFF);

  // Accents & Badges
  static const Color accentRedLight = Color(0xFFFFECEE);
  static const Color accentNavyLight = Color(0xFFE8EEF2);
  static const Color successGreen = Color(0xFF10B981);
  static const Color successLight = Color(0xFFE6F7F0);
  static const Color warningAmber = Color(0xFFF59E0B);
  static const Color warningLight = Color(0xFFFEF3C7);
  static const Color infoBlue = Color(0xFF2563EB);
  static const Color infoLight = Color(0xFFEFF6FF);

  // Gradients
  static const LinearGradient redGradient = LinearGradient(
    colors: [primaryRed, Color(0xFFFF3344)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient navyGradient = LinearGradient(
    colors: [darkNavy, Color(0xFF1A3342)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient heroCardGradient = LinearGradient(
    colors: [Colors.transparent, Color(0xCC10212B)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
