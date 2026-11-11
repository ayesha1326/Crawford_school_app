import 'package:flutter/material.dart';
import '../../core/colors/app_colors.dart';
import '../../core/constants/asset_paths.dart';
import '../../navigation/app_routes.dart';
import '../../widgets/crawford_logo.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/safe_image.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      'title': 'Welcome to\nCrawford School',
      'subtitle': 'A place where learning meets opportunity and every child matters.',
      'image': AssetPaths.refDesign1,
    },
    {
      'title': 'Explore Academics\n& STEM Excellence',
      'subtitle': 'World-class laboratories, robotics centers, and Cambridge-aligned curricula.',
      'image': AssetPaths.schoolBuilding,
    },
    {
      'title': 'Stay Connected with\nTeachers & Management',
      'subtitle': 'Real-time attendance, fee challans, exam results, and seamless parental communication.',
      'image': AssetPaths.classroom,
    },
    {
      'title': 'Empowering Tomorrow’s\nGlobal Leaders',
      'subtitle': 'Character building, athletic facilities, and holistic character development.',
      'image': AssetPaths.sports,
    },
  ];

  void _onNext() {
    if (_currentPage < _onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacementNamed(context, AppRoutes.welcome);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pureWhite,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 12),
            // Header Logo matching reference screen
            const CrawfordLogo(
              size: 42,
              showText: true,
              compact: true,
            ),
            const SizedBox(height: 16),

            // PageView
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _onboardingData.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  final item = _onboardingData[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Center(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Hero Photograph Card with Curved Frame
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Stack(
                                children: [
                                  SafeImage(
                                    assetPath: item['image'],
                                    height: 195,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    fallbackIcon: Icons.apartment_rounded,
                                    label: 'Crawford Campus',
                                  ),
                                  // Decorative bottom red swoosh curve
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      height: 24,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.transparent,
                                            AppColors.pureWhite.withValues(alpha: 0.9),
                                          ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),

                            // Title
                            Text(
                              item['title']!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w800,
                                color: AppColors.primaryText,
                                height: 1.25,
                                letterSpacing: -0.3,
                              ),
                            ),
                            const SizedBox(height: 10),

                            // Subtitle
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                item['subtitle']!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.secondaryText,
                                  height: 1.45,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Bottom Actions & Page Indicator matching reference
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Column(
                children: [
                  CustomButton(
                    text: _currentPage == _onboardingData.length - 1 ? 'Get Started' : 'Get Started',
                    onPressed: _onNext,
                    type: ButtonType.primary,
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, AppRoutes.welcome);
                    },
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.secondaryText,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),

                  // 4 Dots Page Indicator
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _onboardingData.length,
                      (i) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        width: _currentPage == i ? 16 : 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: _currentPage == i ? AppColors.primaryRed : AppColors.borderGrey,
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
