import 'package:flutter/material.dart';
import '../core/colors/app_colors.dart';
import '../data/mock_database.dart';
import '../navigation/app_routes.dart';
import 'crawford_logo.dart';

class CrawfordDrawer extends StatelessWidget {
  const CrawfordDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final role = MockDatabase.currentUserRole;
    final userName = MockDatabase.currentUserName;
    final userSubtitle = MockDatabase.currentUserSubtitle;

    return Drawer(
      backgroundColor: AppColors.cardWhite,
      child: Column(
        children: [
          // Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 50, bottom: 20, left: 20, right: 20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.darkNavy, Color(0xFF1E3848)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CrawfordLogo(size: 34, isWhite: true, showText: false),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.primaryRed,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        MockDatabase.getRoleDisplayName(role).toUpperCase(),
                        style: const TextStyle(
                          color: AppColors.pureWhite,
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.8,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                CircleAvatar(
                  radius: 26,
                  backgroundColor: AppColors.pureWhite,
                  child: CircleAvatar(
                    radius: 24,
                    backgroundColor: AppColors.navyLight,
                    child: Text(
                      userName.isNotEmpty ? userName[0] : 'C',
                      style: const TextStyle(
                        color: AppColors.pureWhite,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  userName,
                  style: const TextStyle(
                    color: AppColors.pureWhite,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  userSubtitle,
                  style: TextStyle(
                    color: AppColors.pureWhite.withOpacity(0.75),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          // Portal Switcher Quick Access (Ideal for mid-term university presentation)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            color: AppColors.lightGrey,
            child: Row(
              children: [
                const Icon(Icons.swap_horiz_rounded, size: 18, color: AppColors.primaryRed),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    'Quick Switch Portal',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryText,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, AppRoutes.roleSelection);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.cardWhite,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: AppColors.borderGrey),
                    ),
                    child: const Text(
                      'Switch',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryRed,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Navigation Links
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 8),
              children: [
                _buildDrawerItem(
                  context,
                  icon: Icons.dashboard_outlined,
                  title: 'My Portal Dashboard',
                  onTap: () {
                    Navigator.pop(context);
                    AppRoutes.navigateToActivePortal(context);
                  },
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.app_registration_rounded,
                  title: 'Admissions & Apply Now',
                  badge: 'Open',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, AppRoutes.admissionsLanding);
                  },
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.school_outlined,
                  title: 'Academic Curriculum',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, AppRoutes.studentAcademics);
                  },
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.receipt_long_outlined,
                  title: 'Fees & Online Challan',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, AppRoutes.studentFees);
                  },
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.calendar_month_outlined,
                  title: 'Timetable & Schedule',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, AppRoutes.studentTimetable);
                  },
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.how_to_reg_outlined,
                  title: 'Attendance Register',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, AppRoutes.studentAttendance);
                  },
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.local_library_outlined,
                  title: 'Digital Library',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, AppRoutes.studentLibrary);
                  },
                ),
                const Divider(height: 16),
                _buildDrawerItem(
                  context,
                  icon: Icons.info_outline_rounded,
                  title: 'About Crawford School',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, AppRoutes.aboutSchool);
                  },
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.record_voice_over_outlined,
                  title: "Principal's Message",
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, AppRoutes.principalsMessage);
                  },
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.apartment_rounded,
                  title: 'Campus & Facilities',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, AppRoutes.facilities);
                  },
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.tour_outlined,
                  title: 'Book a Campus Visit',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, AppRoutes.bookCampusVisit);
                  },
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.rate_review_outlined,
                  title: 'Give School Feedback',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, AppRoutes.giveFeedback);
                  },
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.photo_library_outlined,
                  title: 'School Photo Gallery',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, AppRoutes.gallery);
                  },
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.location_on_outlined,
                  title: 'Campus Location & Contact',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, AppRoutes.schoolLocation);
                  },
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.settings_outlined,
                  title: 'App Settings',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, AppRoutes.settings);
                  },
                ),
              ],
            ),
          ),

          // Logout Action
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: AppColors.borderGrey)),
            ),
            child: ListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.logout_rounded, color: AppColors.primaryRed),
              title: const Text(
                'Logout / Exit Portal',
                style: TextStyle(
                  color: AppColors.primaryRed,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
              onTap: () {
                _showLogoutDialog(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    String? badge,
    required VoidCallback onTap,
  }) {
    return ListTile(
      dense: true,
      visualDensity: VisualDensity.compact,
      leading: Icon(icon, size: 20, color: AppColors.darkNavy),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: AppColors.primaryText,
        ),
      ),
      trailing: badge != null
          ? Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: AppColors.primaryRed,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                badge,
                style: const TextStyle(
                  color: AppColors.pureWhite,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                ),
              ),
            )
          : null,
      onTap: onTap,
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Confirm Logout'),
        content: const Text('Are you sure you want to exit the current portal session?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryRed),
            onPressed: () {
              Navigator.pop(ctx);
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.welcome,
                (route) => false,
              );
            },
            child: const Text('Logout', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
