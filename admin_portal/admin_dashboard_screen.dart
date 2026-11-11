import 'package:flutter/material.dart';
import '../../core/colors/app_colors.dart';
import '../../data/mock_database.dart';
import '../../models/admission_application.dart';
import '../../navigation/app_routes.dart';
import '../../widgets/custom_drawer.dart';
import '../../widgets/section_heading.dart';
import '../../widgets/stat_card.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({Key? key}) : super(key: key);

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.background,
      drawer: const CrawfordDrawer(),
      appBar: AppBar(
        title: const Text('Crawford Administration'),
        leading: IconButton(
          icon: const Icon(Icons.menu_rounded),
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none_rounded),
            onPressed: () => Navigator.pushNamed(context, AppRoutes.notices),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Principal / Head of School Header
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.darkNavy, Color(0xFF1E3848)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: AppColors.primaryRed,
                    child: const CircleAvatar(
                      radius: 26,
                      backgroundColor: AppColors.pureWhite,
                      child: Text(
                        'K',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          color: AppColors.darkNavy,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Executive Console',
                          style: TextStyle(color: Colors.white70, fontSize: 11),
                        ),
                        Text(
                          'Dr. Katherine Crawford',
                          style: TextStyle(
                            color: AppColors.pureWhite,
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Principal & Head of Institutional Governance',
                          style: TextStyle(color: Colors.white70, fontSize: 11),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),

            // Key Performance Indicators (KPIs)
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.35,
              children: [
                StatCard(
                  title: 'Enrolled Students',
                  value: '1,420',
                  icon: Icons.school_rounded,
                  iconColor: AppColors.primaryRed,
                  subtitle: 'Nursery to Grade 11',
                ),
                StatCard(
                  title: 'Faculty & Staff',
                  value: '86 Teachers',
                  icon: Icons.badge_rounded,
                  iconColor: AppColors.infoBlue,
                  subtitle: '1:16 Teacher Ratio',
                ),
                StatCard(
                  title: 'New Admissions',
                  value: '${MockDatabase.admissionApplications.length} Pending',
                  icon: Icons.person_add_alt_1_rounded,
                  iconColor: AppColors.warningAmber,
                  subtitle: 'Review & Decision',
                  onTap: () => Navigator.pushNamed(context, AppRoutes.adminAdmissions),
                ),
                StatCard(
                  title: 'Fee Collection',
                  value: 'PKR 18.4M',
                  icon: Icons.account_balance_wallet_rounded,
                  iconColor: AppColors.successGreen,
                  subtitle: '91% Collected for Nov',
                  onTap: () => Navigator.pushNamed(context, AppRoutes.studentFees),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Admin Modules Quick Access
            const SectionHeading(title: 'Administrative Control Center'),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryRed,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    icon: const Icon(Icons.fact_check_rounded, size: 20),
                    label: const Text('Manage Admissions', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
                    onPressed: () => Navigator.pushNamed(context, AppRoutes.adminAdmissions),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.darkNavy,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    icon: const Icon(Icons.campaign_rounded, size: 20),
                    label: const Text('Broadcast Notice', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
                    onPressed: () => Navigator.pushNamed(context, AppRoutes.notices),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Recent Admission Inflow
            SectionHeading(
              title: 'Recent Admission Applications',
              actionText: 'View All',
              onAction: () => Navigator.pushNamed(context, AppRoutes.adminAdmissions),
            ),
            ...MockDatabase.admissionApplications.take(2).map((app) => Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: AppColors.cardWhite,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: AppColors.borderGrey),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColors.accentRedLight,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.person_outline_rounded, color: AppColors.primaryRed, size: 20),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              app.studentFullName,
                              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
                            ),
                            Text(
                              '${app.applyingGrade} • Submitted: ${app.submissionDate}',
                              style: const TextStyle(fontSize: 11, color: AppColors.secondaryText),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: app.status == AdmissionStatus.approved
                              ? AppColors.successLight
                              : AppColors.warningLight,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          app.status.name.toUpperCase(),
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                            color: app.status == AdmissionStatus.approved
                                ? AppColors.successGreen
                                : AppColors.warningAmber,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
