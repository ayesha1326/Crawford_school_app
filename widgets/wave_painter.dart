import 'package:flutter/material.dart';
import '../core/colors/app_colors.dart';

/// Decorative background waves replicating Crawford Grammar School's exact brand curves
class WaveBackground extends StatelessWidget {
  final Widget child;
  final bool showTopWave;
  final bool showBottomWave;

  const WaveBackground({
    Key? key,
    required this.child,
    this.showTopWave = true,
    this.showBottomWave = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(color: AppColors.cardWhite),
        ),
        if (showTopWave)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 180,
            child: CustomPaint(
              painter: _TopWavePainter(),
            ),
          ),
        if (showBottomWave)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 240,
            child: CustomPaint(
              painter: _BottomWavePainter(),
            ),
          ),
        child,
      ],
    );
  }
}

class _TopWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    final redPaint = Paint()
      ..shader = const LinearGradient(
        colors: [AppColors.primaryRed, Color(0xFFFF3B47)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, w, h))
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(w * 0.45, 0);
    path.quadraticBezierTo(w * 0.38, h * 0.6, 0, h * 0.85);
    path.close();
    canvas.drawPath(path, redPaint);

    final thinPaint = Paint()
      ..color = AppColors.primaryRed.withOpacity(0.18)
      ..style = PaintingStyle.fill;

    final thinPath = Path();
    thinPath.moveTo(0, 0);
    thinPath.lineTo(w * 0.55, 0);
    thinPath.quadraticBezierTo(w * 0.42, h * 0.85, 0, h);
    thinPath.close();
    canvas.drawPath(thinPath, thinPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _BottomWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // Dark Navy sweeping wave at bottom
    final navyPaint = Paint()
      ..color = AppColors.darkNavy
      ..style = PaintingStyle.fill;

    final navyPath = Path();
    navyPath.moveTo(0, h);
    navyPath.lineTo(w, h);
    navyPath.lineTo(w, h * 0.3);
    navyPath.quadraticBezierTo(w * 0.5, h * 0.65, 0, h * 0.95);
    navyPath.close();
    canvas.drawPath(navyPath, navyPaint);

    // Red ribbon border contour
    final redPaint = Paint()
      ..color = AppColors.primaryRed
      ..style = PaintingStyle.stroke
      ..strokeWidth = 7.0;

    final redLine = Path();
    redLine.moveTo(0, h * 0.94);
    redLine.quadraticBezierTo(w * 0.5, h * 0.64, w, h * 0.29);
    canvas.drawPath(redLine, redPaint);

    // Light accent glow curve
    final accentPaint = Paint()
      ..color = AppColors.primaryRed.withOpacity(0.15)
      ..style = PaintingStyle.fill;

    final accentPath = Path();
    accentPath.moveTo(0, h);
    accentPath.lineTo(w, h);
    accentPath.lineTo(w, h * 0.2);
    accentPath.quadraticBezierTo(w * 0.52, h * 0.55, 0, h * 0.9);
    accentPath.close();
    canvas.drawPath(accentPath, accentPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Curved Header Clipper for Dashboard Screen
class DashboardHeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 36);
    path.quadraticBezierTo(
      size.width * 0.5,
      size.height + 15,
      size.width,
      size.height - 36,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
