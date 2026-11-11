import 'package:flutter/material.dart';
import '../../core/colors/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../widgets/custom_button.dart';

class SchoolLocationScreen extends StatelessWidget {
  const SchoolLocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Campus Location & Contact'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Map-style graphical placeholder card
            Container(
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFFE2E7ED),
              ),
              child: Stack(
                children: [
                  // Stylized grid & route lines
                  Positioned.fill(
                    child: CustomPaint(
                      painter: _MapGridPainter(),
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppColors.primaryRed,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primaryRed.withOpacity(0.4),
                                blurRadius: 16,
                                spreadRadius: 4,
                              ),
                            ],
                          ),
                          child: const Icon(Icons.school_rounded, color: Colors.white, size: 28),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: AppColors.darkNavy,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            AppConstants.appName,
                            style: TextStyle(
                              color: AppColors.pureWhite,
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Campus Location Details',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: 12),

                  _buildContactCard(
                    icon: Icons.location_on_rounded,
                    title: 'Postal Campus Address',
                    subtitle: AppConstants.schoolAddress,
                  ),
                  const SizedBox(height: 10),

                  _buildContactCard(
                    icon: Icons.phone_rounded,
                    title: 'Phone & Secretariat Lines',
                    subtitle: '${AppConstants.schoolPhone}\n${AppConstants.schoolAltPhone}',
                  ),
                  const SizedBox(height: 10),

                  _buildContactCard(
                    icon: Icons.email_rounded,
                    title: 'Admissions & Inquiries Email',
                    subtitle: '${AppConstants.schoolEmail}\n${AppConstants.schoolWebsite}',
                  ),
                  const SizedBox(height: 10),

                  _buildContactCard(
                    icon: Icons.access_time_rounded,
                    title: 'Visiting & Office Hours',
                    subtitle: AppConstants.schoolOfficeHours,
                  ),
                  const SizedBox(height: 20),

                  CustomButton(
                    text: 'Get Directions (Google Maps Demo)',
                    icon: Icons.navigation_rounded,
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Opening Google Maps navigation for Crawford Campus...'),
                          backgroundColor: AppColors.darkNavy,
                        ),
                      );
                    },
                    type: ButtonType.primary,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardWhite,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.borderGrey),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.accentRedLight,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: AppColors.primaryRed, size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
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

class _MapGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final linePaint = Paint()
      ..color = Colors.white.withOpacity(0.6)
      ..strokeWidth = 3.0;

    final roadPaint = Paint()
      ..color = const Color(0xFFD4DCE6)
      ..strokeWidth = 8.0;

    canvas.drawLine(Offset(0, size.height * 0.4), Offset(size.width, size.height * 0.4), roadPaint);
    canvas.drawLine(Offset(size.width * 0.45, 0), Offset(size.width * 0.45, size.height), roadPaint);
    canvas.drawLine(Offset(0, size.height * 0.75), Offset(size.width, size.height * 0.25), linePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
