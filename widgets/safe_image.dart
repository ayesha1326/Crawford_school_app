import 'package:flutter/material.dart';
import '../core/colors/app_colors.dart';

/// Guaranteed crash-proof image widget with Crawford School branding
/// Ensures proper spacing, rounded clipping, and elegant fallback placeholders
/// when photographic assets are being swapped or loaded.
class SafeImage extends StatelessWidget {
  final String? assetPath;
  final String? networkUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final double borderRadius;
  final IconData fallbackIcon;
  final String? label;
  final Widget? overlay;

  const SafeImage({
    super.key,
    this.assetPath,
    this.networkUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius = 0.0,
    this.fallbackIcon = Icons.school_rounded,
    this.label,
    this.overlay,
  });

  @override
  Widget build(BuildContext context) {
    Widget content;

    if (networkUrl != null && networkUrl!.isNotEmpty) {
      content = Image.network(
        networkUrl!,
        width: width,
        height: height,
        fit: fit,
        errorBuilder: (context, error, stackTrace) => _buildFallback(),
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return _buildLoading();
        },
      );
    } else if (assetPath != null && assetPath!.isNotEmpty) {
      content = Image.asset(
        assetPath!,
        width: width,
        height: height,
        fit: fit,
        errorBuilder: (context, error, stackTrace) => _buildFallback(),
      );
    } else {
      content = _buildFallback();
    }

    if (overlay != null) {
      content = Stack(
        fit: StackFit.passthrough,
        children: [
          content,
          overlay!,
        ],
      );
    }

    if (borderRadius > 0) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: content,
      );
    }

    return content;
  }

  Widget _buildFallback() {
    final isCompact = (height != null && height! < 60) || (width != null && width! < 60);

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            AppColors.navyLight,
            AppColors.darkNavy,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(
          color: AppColors.borderGrey.withValues(alpha: 0.3),
          width: 0.8,
        ),
      ),
      child: Center(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                fallbackIcon,
                color: AppColors.primaryRed.withValues(alpha: 0.9),
                size: isCompact ? 18 : (height != null && height! < 100 ? 24 : 36),
              ),
              if (!isCompact && label != null) ...[
                const SizedBox(height: 6),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    label!,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.pureWhite,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoading() {
    return Container(
      width: width,
      height: height,
      color: AppColors.lightGrey,
      child: const Center(
        child: SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(
            strokeWidth: 2.0,
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryRed),
          ),
        ),
      ),
    );
  }
}
