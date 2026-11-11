import 'package:flutter/material.dart';
import '../core/colors/app_colors.dart';

/// Reusable vector-rendered Crawford Grammar School emblem & logo
class CrawfordLogo extends StatelessWidget {
  final double size;
  final bool isWhite;
  final bool showText;
  final bool compact;

  const CrawfordLogo({
    Key? key,
    this.size = 64,
    this.isWhite = false,
    this.showText = true,
    this.compact = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomPaint(
          size: Size(size, size * 0.75),
          painter: _CrawfordEmblemPainter(isWhite: isWhite),
        ),
        if (showText) ...[
          SizedBox(height: compact ? 2 : 6),
          Text(
            'Crawford',
            style: TextStyle(
              fontSize: compact ? size * 0.32 : size * 0.42,
              fontWeight: FontWeight.w800,
              color: isWhite ? AppColors.pureWhite : AppColors.primaryRed,
              letterSpacing: -0.5,
              height: 1.1,
            ),
          ),
          Text(
            'Grammar School',
            style: TextStyle(
              fontSize: compact ? size * 0.18 : size * 0.22,
              fontWeight: FontWeight.w600,
              color: isWhite ? AppColors.pureWhite.withOpacity(0.9) : AppColors.darkNavy,
              letterSpacing: 0.5,
              height: 1.1,
            ),
          ),
        ],
      ],
    );
  }
}

class _CrawfordEmblemPainter extends CustomPainter {
  final bool isWhite;
  _CrawfordEmblemPainter({required this.isWhite});

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // Outer Red Swoosh (Wing / Flame)
    final redPaint = Paint()
      ..color = isWhite ? AppColors.pureWhite : AppColors.primaryRed
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final redPath = Path();
    redPath.moveTo(w * 0.5, h * 0.1);
    redPath.cubicTo(w * 0.75, h * 0.05, w * 0.95, h * 0.35, w * 0.85, h * 0.75);
    redPath.cubicTo(w * 0.75, h * 0.55, w * 0.65, h * 0.45, w * 0.52, h * 0.5);
    redPath.cubicTo(w * 0.55, h * 0.35, w * 0.58, h * 0.2, w * 0.5, h * 0.1);
    redPath.close();
    canvas.drawPath(redPath, redPaint);

    // Inner Dark / Accent Swoosh
    final darkPaint = Paint()
      ..color = isWhite ? AppColors.pureWhite.withOpacity(0.7) : AppColors.darkNavy
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final darkPath = Path();
    darkPath.moveTo(w * 0.15, h * 0.65);
    darkPath.cubicTo(w * 0.15, h * 0.35, w * 0.35, h * 0.15, w * 0.48, h * 0.15);
    darkPath.cubicTo(w * 0.4, h * 0.3, w * 0.38, h * 0.5, w * 0.45, h * 0.75);
    darkPath.cubicTo(w * 0.3, h * 0.85, w * 0.18, h * 0.8, w * 0.15, h * 0.65);
    darkPath.close();
    canvas.drawPath(darkPath, darkPaint);

    // Center Ribbon Accent
    final centerPaint = Paint()
      ..color = isWhite ? AppColors.pureWhite : AppColors.primaryRed
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.05
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    final centerPath = Path();
    centerPath.moveTo(w * 0.48, h * 0.28);
    centerPath.quadraticBezierTo(w * 0.62, h * 0.42, w * 0.54, h * 0.85);
    canvas.drawPath(centerPath, centerPaint);
  }

  @override
  bool shouldRepaint(covariant _CrawfordEmblemPainter oldDelegate) =>
      oldDelegate.isWhite != isWhite;
}
