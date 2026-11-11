import 'package:flutter/material.dart';
import '../../core/colors/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../data/mock_database.dart';
import '../../navigation/app_routes.dart';
import '../../widgets/crawford_logo.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _pushNotifications = true;
  bool _emailAlerts = true;
  bool _feeReminders = true;
  bool _biometricLogin = false;

  void _showAboutAppDialog() {
    showAboutDialog(
      context: context,
      applicationName: AppConstants.appName,
      applicationVersion: 'Version 1.0.0 (Release Build)',
      applicationIcon: const CrawfordLogo(size: 36, showText: false),
      children: const [
        Text(
          'Crawford Grammar School Unified Mobile Portal.\nDeveloped for university semester evaluation. Material Design 3 frontend implementation.',
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Confirm Logout'),
        content: const Text('Are you sure you want to end your current session and return to the welcome screen?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryRed),
            onPressed: () {
              Navigator.pop(ctx);
              Navigator.pushNamedAndRemoveUntil(context, AppRoutes.welcome, (route) => false);
            },
            child: const Text('Logout', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Settings & Preferences'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Current User Summary
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.cardWhite,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.borderGrey),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: AppColors.primaryRed,
                  child: Text(
                    MockDatabase.currentUserName[0],
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        MockDatabase.currentUserName,
                        style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                      ),
                      Text(
                        MockDatabase.currentUserSubtitle,
                        style: const TextStyle(fontSize: 11, color: AppColors.secondaryText),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.edit_outlined, size: 20, color: AppColors.primaryRed),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Profile edit form opened in demo mode.')),
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Notification Preferences
          _buildSectionHeader('Notifications & Alerts'),
          _buildSwitchTile('Push Notifications', 'Receive instant announcements', _pushNotifications, (v) {
            setState(() => _pushNotifications = v);
          }),
          _buildSwitchTile('Email Bulletins', 'Circulars and term letters', _emailAlerts, (v) {
            setState(() => _emailAlerts = v);
          }),
          _buildSwitchTile('Fee Challan Reminders', 'Due date notifications in PKR', _feeReminders, (v) {
            setState(() => _feeReminders = v);
          }),
          const SizedBox(height: 20),

          // Security
          _buildSectionHeader('Security & Biometrics'),
          _buildSwitchTile('Biometric Fingerprint / Face Unlock', 'Fast biometric verification', _biometricLogin, (v) {
            setState(() => _biometricLogin = v);
          }),
          _buildNavTile(Icons.lock_reset_rounded, 'Change Password', () {
            Navigator.pushNamed(context, AppRoutes.forgotPassword);
          }),
          const SizedBox(height: 20),

          // General & About
          _buildSectionHeader('General & Support'),
          _buildNavTile(Icons.swap_horiz_rounded, 'Switch Active School Portal', () {
            Navigator.pushNamed(context, AppRoutes.roleSelection);
          }),
          _buildNavTile(Icons.tour_outlined, 'Book a Campus Visit', () {
            Navigator.pushNamed(context, AppRoutes.bookCampusVisit);
          }),
          _buildNavTile(Icons.rate_review_outlined, 'Give School Feedback', () {
            Navigator.pushNamed(context, AppRoutes.giveFeedback);
          }),
          _buildNavTile(Icons.help_center_outlined, 'Help Center & FAQs', () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Contact support at support@crawford.edu.pk')),
            );
          }),
          _buildNavTile(Icons.info_outline_rounded, 'About Application', _showAboutAppDialog),
          const SizedBox(height: 20),

          // Logout
          ListTile(
            tileColor: AppColors.accentRedLight,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(color: AppColors.primaryRed),
            ),
            leading: const Icon(Icons.logout_rounded, color: AppColors.primaryRed),
            title: const Text(
              'Sign Out of Portal',
              style: TextStyle(color: AppColors.primaryRed, fontWeight: FontWeight.w700),
            ),
            onTap: _showLogoutDialog,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 4.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: AppColors.secondaryText,
        ),
      ),
    );
  }

  Widget _buildSwitchTile(String title, String subtitle, bool val, ValueChanged<bool> onChanged) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: AppColors.cardWhite,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderGrey),
      ),
      child: SwitchListTile(
        title: Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
        subtitle: Text(subtitle, style: const TextStyle(fontSize: 11, color: AppColors.secondaryText)),
        value: val,
        activeColor: AppColors.primaryRed,
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildNavTile(IconData icon, String title, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: AppColors.cardWhite,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderGrey),
      ),
      child: ListTile(
        leading: Icon(icon, color: AppColors.darkNavy, size: 20),
        title: Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 14, color: AppColors.secondaryText),
        onTap: onTap,
      ),
    );
  }
}
