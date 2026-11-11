import 'package:flutter/material.dart';
import '../../core/colors/app_colors.dart';
import '../../core/constants/asset_paths.dart';
import '../../widgets/safe_image.dart';

class FacilitiesScreen extends StatelessWidget {
  const FacilitiesScreen({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> _facilities = const [
    {
      'title': 'Smart Interactive Classrooms',
      'category': 'Academic Environment',
      'image': AssetPaths.classroom,
      'icon': Icons.co_present_rounded,
      'desc': 'Equipped with 4K touch display panels, climate control, ergonomic modular student desks, and interactive audio systems.',
    },
    {
      'title': 'Advanced Science Laboratories',
      'category': 'STEM & Research',
      'image': AssetPaths.scienceLab,
      'icon': Icons.biotech_rounded,
      'desc': 'Dedicated Cambridge-standard Physics, Chemistry, and Biology laboratories with safety ventilation, optical instruments, and fume hoods.',
    },
    {
      'title': 'Sir Isaac Newton Computing & AI Center',
      'category': 'Technology',
      'image': AssetPaths.computerLab,
      'icon': Icons.computer_rounded,
      'desc': 'High-performance workstations, fiber optic gigabit connectivity, robotics kits, and Python / Cloud coding development environments.',
    },
    {
      'title': 'Crawford Central Digital Library',
      'category': 'Research & Learning',
      'image': AssetPaths.library,
      'icon': Icons.local_library_rounded,
      'desc': 'Over 25,000 cataloged academic texts, international peer-reviewed journals, silent study carrels, and e-book research portals.',
    },
    {
      'title': 'Olympic-Grade Athletic Sports Complex',
      'category': 'Physical Education',
      'image': AssetPaths.sports,
      'icon': Icons.sports_soccer_rounded,
      'desc': 'Synthetic turf football pitch, multi-lane running track, basketball pavilion, badminton arenas, and indoor table tennis halls.',
    },
    {
      'title': 'Grand Auditorium & Performing Arts Hall',
      'category': 'Arts & Culture',
      'image': AssetPaths.auditorium,
      'icon': Icons.theater_comedy_rounded,
      'desc': 'A 900-seat multi-tier auditorium featuring acoustic design, professional stage lighting, and digital Dolby surround sound.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Campus Facilities'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: _facilities.length,
        separatorBuilder: (context, index) => const SizedBox(height: 14),
        itemBuilder: (context, index) {
          final item = _facilities[index];
          return Container(
            decoration: BoxDecoration(
              color: AppColors.cardWhite,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.borderGrey),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                  child: SafeImage(
                    assetPath: item['image'],
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    fallbackIcon: item['icon'],
                    label: item['title'],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: AppColors.accentRedLight,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          item['category'],
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primaryRed,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        item['title'],
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        item['desc'],
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.secondaryText,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
