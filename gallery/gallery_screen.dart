import 'package:flutter/material.dart';
import '../../core/colors/app_colors.dart';
import '../../core/constants/asset_paths.dart';
import '../../widgets/safe_image.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> _albums = const [
    {
      'title': 'Campus Architecture',
      'category': 'Infrastructure',
      'image': AssetPaths.schoolBuilding,
      'icon': Icons.apartment_rounded,
    },
    {
      'title': 'Science Olympiad 2026',
      'category': 'Academics & STEM',
      'image': AssetPaths.scienceLab,
      'icon': Icons.biotech_rounded,
    },
    {
      'title': 'Annual Sports Day',
      'category': 'Athletics',
      'image': AssetPaths.sports,
      'icon': Icons.sports_tennis_rounded,
    },
    {
      'title': 'Robotics Competition',
      'category': 'Innovation',
      'image': AssetPaths.computerLab,
      'icon': Icons.precision_manufacturing_rounded,
    },
    {
      'title': 'Classrooms & Learning',
      'category': 'Academics',
      'image': AssetPaths.classroom,
      'icon': Icons.school_rounded,
    },
    {
      'title': 'Graduation Convocation',
      'category': 'Ceremony',
      'image': AssetPaths.auditorium,
      'icon': Icons.celebration_rounded,
    },
  ];

  void _openImageViewer(BuildContext context, Map<String, dynamic> item) {
    showDialog(
      context: context,
      builder: (ctx) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.close_rounded, color: Colors.white, size: 28),
                onPressed: () => Navigator.pop(ctx),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: SafeImage(
                assetPath: item['image'],
                width: double.infinity,
                height: 280,
                fit: BoxFit.cover,
                fallbackIcon: item['icon'],
                label: item['title'],
              ),
            ),
            const SizedBox(height: 12),
            Text(
              item['title'],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              item['category'],
              style: const TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Campus Photo Gallery'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _albums.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.9,
        ),
        itemBuilder: (context, index) {
          final item = _albums[index];
          return InkWell(
            onTap: () => _openImageViewer(context, item),
            borderRadius: BorderRadius.circular(16),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.cardWhite,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.borderGrey),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                      child: SafeImage(
                        assetPath: item['image'],
                        width: double.infinity,
                        fit: BoxFit.cover,
                        fallbackIcon: item['icon'],
                        label: item['title'],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['title'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          item['category'],
                          style: const TextStyle(fontSize: 10, color: AppColors.secondaryText),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
