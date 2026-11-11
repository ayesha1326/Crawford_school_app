import 'package:flutter/material.dart';
import '../core/colors/app_colors.dart';
import 'crawford_logo.dart';

class CrawfordAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? subtitle;
  final bool showBackButton;
  final bool showEmblem;
  final bool isDark;
  final List<Widget>? actions;
  final VoidCallback? onBack;

  const CrawfordAppBar({
    Key? key,
    required this.title,
    this.subtitle,
    this.showBackButton = true,
    this.showEmblem = false,
    this.isDark = true,
    this.actions,
    this.onBack,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(subtitle != null ? 72.0 : 60.0);

  @override
  Widget build(BuildContext context) {
    final bgColor = isDark ? AppColors.darkNavy : AppColors.cardWhite;
    final fgColor = isDark ? AppColors.pureWhite : AppColors.primaryText;

    return AppBar(
      backgroundColor: bgColor,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      leading: showBackButton
          ? IconButton(
              icon: Icon(Icons.arrow_back_ios_new_rounded, size: 20, color: fgColor),
              onPressed: onBack ?? () => Navigator.of(context).maybePop(),
            )
          : null,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showEmblem) ...[
            CrawfordLogo(size: 26, isWhite: isDark, showText: false),
            const SizedBox(width: 8),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: fgColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    subtitle!,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: isDark ? AppColors.pureWhite.withOpacity(0.7) : AppColors.secondaryText,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
      actions: actions,
    );
  }
}
