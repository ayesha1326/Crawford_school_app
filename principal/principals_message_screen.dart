import 'package:flutter/material.dart';
import '../../core/colors/app_colors.dart';
import '../../core/constants/asset_paths.dart';
import '../../widgets/crawford_logo.dart';
import '../../widgets/safe_image.dart';

class PrincipalsMessageScreen extends StatelessWidget {
  const PrincipalsMessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text("Principal's Message"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Principal Portrait Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 24, bottom: 28, left: 20, right: 20),
              decoration: const BoxDecoration(
                color: AppColors.darkNavy,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.primaryRed, width: 3),
                    ),
                    child: const ClipOval(
                      child: SafeImage(
                        assetPath: AssetPaths.principal,
                        width: 96,
                        height: 96,
                        fit: BoxFit.cover,
                        fallbackIcon: Icons.person_rounded,
                        label: 'Principal',
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    'Dr. Katherine Crawford',
                    style: TextStyle(
                      color: AppColors.pureWhite,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Principal & Headmistress, Crawford Grammar School',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.primaryRed,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'Ph.D. in Educational Leadership (Oxford)',
                      style: TextStyle(
                        color: AppColors.pureWhite,
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Letter Body
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.cardWhite,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.borderGrey),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Welcome to the Crawford Family',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                        color: AppColors.primaryText,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Dear Students, Parents, and Esteemed Community Members,\n\n'
                      'It is my distinct privilege to welcome you to Crawford Grammar School — a cradle of intellectual rigor, artistic discovery, and unwavering moral grounding.\n\n'
                      'At Crawford, our philosophy is anchored in the conviction that true education transcends rote learning. We nurture students to question critically, innovate fearlessly, and lead with compassion. Our faculty works relentlessly to cultivate an inclusive environment where every child discovers their unique genius.\n\n'
                      'As we navigate a rapidly evolving technological era, our curriculum integrates Cambridge academic rigor with computational thinking, artificial intelligence fundamentals, and ethical leadership. Yet, alongside our cutting-edge STEM laboratories and athletic achievements, our greatest pride remains the character of our students — their honesty, respect, and readiness to serve society.\n\n'
                      'To our parents: we consider you our closest partners in this noble endeavor. Together, we are building brighter futures for generations to come.',
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.primaryText,
                        height: 1.55,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Signature Block
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Yours in Education,',
                              style: TextStyle(fontSize: 12, color: AppColors.secondaryText),
                            ),
                            SizedBox(height: 6),
                            Text(
                              'Katherine Crawford',
                              style: TextStyle(
                                fontFamily: 'cursive',
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: AppColors.darkNavy,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Principal, Crawford Grammar School',
                              style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        const CrawfordLogo(size: 32, showText: false),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
