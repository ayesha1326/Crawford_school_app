import 'package:flutter/material.dart';
import '../colors/app_colors.dart';

/// Reusable card and container decorations
class AppDecorations {
  AppDecorations._();

  static BoxDecoration cardDecoration({
    Color backgroundColor = AppColors.cardWhite,
    Color borderColor = AppColors.borderGrey,
    double borderRadius = 16.0,
    bool hasShadow = true,
  }) {
    return BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(borderRadius),
      border: Border.all(color: borderColor, width: 1.0),
      boxShadow: hasShadow
          ? [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ]
          : null,
    );
  }

  static BoxDecoration elevatedCard({
    Color backgroundColor = AppColors.cardWhite,
    double borderRadius = 18.0,
  }) {
    return BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(borderRadius),
      boxShadow: [
        BoxShadow(
          color: AppColors.darkNavy.withOpacity(0.07),
          blurRadius: 14,
          offset: const Offset(0, 6),
        ),
      ],
    );
  }
}
