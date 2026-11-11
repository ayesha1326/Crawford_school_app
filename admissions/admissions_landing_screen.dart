import 'package:flutter/material.dart';
import '../../core/colors/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/asset_paths.dart';
import '../../navigation/app_routes.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/safe_image.dart';
import '../../widgets/section_heading.dart';

class AdmissionsLandingScreen extends StatelessWidget {
  const AdmissionsLandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Admissions 2026–2027'),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline_rounded),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Contact Crawford Admissions Desk at admissions@crawford.edu.pk'),
                  backgroundColor: AppColors.darkNavy,
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Admissions Banner
            Stack(
              children: [
                SafeImage(
                  assetPath: AssetPaths.schoolCampus,
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  fallbackIcon: Icons.school_rounded,
                  label: 'Crawford Grammar School Admissions',
                ),
                Positioned.fill(
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.transparent, Color(0xDD10212B)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 16,
                  left: 20,
                  right: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.primaryRed,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'SESSION 2026-27 OPEN',
                          style: TextStyle(
                            color: AppColors.pureWhite,
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.8,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'Join a Legacy of Academic & Moral Distinction',
                        style: TextStyle(
                          color: AppColors.pureWhite,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
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
                  // Primary CTA Button
                  CustomButton(
                    text: 'Start Online Application',
                    icon: Icons.edit_document,
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.admissionApplyForm);
                    },
                    type: ButtonType.primary,
                  ),
                  const SizedBox(height: 20),

                  // Admission Process Steps
                  const SectionHeading(title: 'Admission Procedure'),
                  _buildProcessStep(
                    '1',
                    'Submit Online Application',
                    'Complete the 6-step online registration form with student and guardian information.',
                  ),
                  _buildProcessStep(
                    '2',
                    'Diagnostic Assessment & Interview',
                    'Shortlisted candidates appear for an age-appropriate cognitive and subject evaluation.',
                  ),
                  _buildProcessStep(
                    '3',
                    'Offer Letter & Enrollment',
                    'Selected students receive official offer letters and fee voucher for final seat confirmation.',
                  ),
                  const SizedBox(height: 20),

                  // Available Grades
                  const SectionHeading(title: 'Available Grades & Levels'),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      'Early Years (Playgroup & Nursery)',
                      'Kindergarten (KG 1 & KG 2)',
                      'Primary School (Grades 1 to 5)',
                      'Middle School (Grades 6 to 8)',
                      'O Levels / Cambridge CAIE (Grades 9 & 10)',
                      'A Levels / Higher Secondary (Grades 11 & 12)',
                    ].map((g) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: AppColors.cardWhite,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.borderGrey),
                        ),
                        child: Text(
                          g,
                          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),

                  // Required Documents
                  const SectionHeading(title: 'Mandatory Documents'),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.cardWhite,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: AppColors.borderGrey),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        _DocBullet('Official NADRA Birth Certificate / Form-B copy'),
                        _DocBullet('4 recent passport-size student photographs (white background)'),
                        _DocBullet('Copies of Father / Guardian CNIC'),
                        _DocBullet('Previous School Leaving Certificate & past 2 years report cards'),
                        _DocBullet('Student Medical Record / Immunization record'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Contact Admissions Box
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.accentRedLight,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: AppColors.primaryRed.withOpacity(0.3)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Admissions Help Desk',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primaryRed,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Office Hours: Monday – Friday (08:30 AM to 03:00 PM)\nPhone: ${AppConstants.schoolPhone}\nEmail: ${AppConstants.schoolEmail}',
                          style: TextStyle(fontSize: 12, color: AppColors.primaryText, height: 1.4),
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

  Widget _buildProcessStep(String number, String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: const BoxDecoration(
              color: AppColors.primaryRed,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                number,
                style: const TextStyle(
                  color: AppColors.pureWhite,
                  fontWeight: FontWeight.w800,
                  fontSize: 13,
                ),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 2),
                Text(
                  description,
                  style: const TextStyle(fontSize: 12, color: AppColors.secondaryText, height: 1.35),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DocBullet extends StatelessWidget {
  final String text;
  const _DocBullet(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle_rounded, color: AppColors.successGreen, size: 16),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 12, color: AppColors.primaryText),
            ),
          ),
        ],
      ),
    );
  }
}
