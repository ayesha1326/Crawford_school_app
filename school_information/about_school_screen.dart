import 'package:flutter/material.dart';
import '../../core/colors/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/asset_paths.dart';
import '../../navigation/app_routes.dart';
import '../../widgets/safe_image.dart';
import '../../widgets/section_heading.dart';

class AboutSchoolScreen extends StatelessWidget {
  const AboutSchoolScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('About Crawford Grammar School'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Campus Hero Banner
            Stack(
              children: [
                SafeImage(
                  assetPath: AssetPaths.schoolBuilding,
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  fallbackIcon: Icons.apartment_rounded,
                  label: 'Crawford Main Academic Campus',
                ),
                Positioned.fill(
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.transparent, Color(0xCC10212B)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 16,
                  left: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        AppConstants.appName,
                        style: TextStyle(
                          color: AppColors.pureWhite,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        'Founded 1994 • Over 30 Years of Academic Excellence',
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SectionHeading(title: 'Our Institutional Heritage'),
                  const Text(
                    'Crawford Grammar School was established in 1994 with an enduring commitment to academic rigor, character development, and holistic leadership. Over three decades, Crawford has evolved into one of the country’s premier private educational institutions, known for Cambridge CAIE distinction awards, state-of-the-art STEM facilities, and a vibrant community of passionate learners.',
                    style: TextStyle(fontSize: 13, color: AppColors.secondaryText, height: 1.5),
                  ),
                  const SizedBox(height: 20),

                  // Vision & Mission Cards
                  Row(
                    children: [
                      Expanded(
                        child: _buildValueCard(
                          icon: Icons.visibility_rounded,
                          title: 'Our Vision',
                          desc: 'To cultivate intellectually inquisitive, morally grounded, and visionary global leaders.',
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildValueCard(
                          icon: Icons.flag_rounded,
                          title: 'Our Mission',
                          desc: 'Delivering world-class holistic education through innovative pedagogy and values.',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Core Values
                  const SectionHeading(title: 'Our Core Values'),
                  _buildValueBullet('Integrity & Honour', 'Upholding uncompromising truthfulness, ethics, and accountability.'),
                  _buildValueBullet('Academic Distinction', 'Striving for excellence across sciences, arts, and humanities.'),
                  _buildValueBullet('Global Empathy', 'Fostering cultural respect, inclusivity, and responsible citizenship.'),
                  _buildValueBullet('Innovation & Inquiry', 'Encouraging analytical reasoning, creativity, and technological mastery.'),
                  const SizedBox(height: 20),

                  // Achievements & Awards
                  const SectionHeading(title: 'Accreditation & Honours'),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.cardWhite,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.borderGrey),
                    ),
                    child: Column(
                      children: const [
                        _AwardRow(
                          icon: Icons.emoji_events_rounded,
                          title: 'Cambridge Assessment CAIE Top in Region (2024 & 2025)',
                          subtitle: 'Top positions in Mathematics, Physics, and English Literature.',
                        ),
                        Divider(height: 18),
                        _AwardRow(
                          icon: Icons.military_tech_rounded,
                          title: 'National Robotics STEM Champions 2026',
                          subtitle: 'Awarded 1st place in All-Pakistan Senior Robotics Competition.',
                        ),
                        Divider(height: 18),
                        _AwardRow(
                          icon: Icons.verified_user_rounded,
                          title: 'British Council International School Award',
                          subtitle: 'Recognized for global classroom collaboration and leadership.',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Call to Action: Book Campus Tour
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [AppColors.darkNavy, Color(0xFF1F3B4D)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Experience Crawford In Person',
                          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 6),
                        const Text(
                          'Book an exclusive campus tour with an admissions counselor to explore our laboratories, classrooms, and grounds.',
                          style: TextStyle(color: Colors.white70, fontSize: 12, height: 1.35),
                        ),
                        const SizedBox(height: 14),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryRed,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                            icon: const Icon(Icons.tour_rounded, size: 18),
                            label: const Text('Schedule Campus Tour', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                            onPressed: () => Navigator.pushNamed(context, AppRoutes.bookCampusVisit),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildValueCard({
    required IconData icon,
    required String title,
    required String desc,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardWhite,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderGrey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.accentRedLight,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: AppColors.primaryRed, size: 22),
          ),
          const SizedBox(height: 10),
          Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800)),
          const SizedBox(height: 4),
          Text(desc, style: const TextStyle(fontSize: 11, color: AppColors.secondaryText, height: 1.35)),
        ],
      ),
    );
  }

  Widget _buildValueBullet(String title, String desc) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.star_rounded, color: AppColors.primaryRed, size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(fontSize: 12, color: AppColors.primaryText, height: 1.4),
                children: [
                  TextSpan(text: '$title: ', style: const TextStyle(fontWeight: FontWeight.w700)),
                  TextSpan(text: desc, style: const TextStyle(color: AppColors.secondaryText)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AwardRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _AwardRow({required this.icon, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: AppColors.warningAmber, size: 24),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700)),
              const SizedBox(height: 2),
              Text(subtitle, style: const TextStyle(fontSize: 11, color: AppColors.secondaryText)),
            ],
          ),
        ),
      ],
    );
  }
}
