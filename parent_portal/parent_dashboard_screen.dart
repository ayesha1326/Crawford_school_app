import 'package:flutter/material.dart';
import '../../core/colors/app_colors.dart';
import '../../data/mock_database.dart';
import '../../navigation/app_routes.dart';
import '../../widgets/custom_drawer.dart';
import '../../widgets/section_heading.dart';
import '../../widgets/stat_card.dart';

class ParentDashboardScreen extends StatefulWidget {
  const ParentDashboardScreen({Key? key}) : super(key: key);

  @override
  State<ParentDashboardScreen> createState() => _ParentDashboardScreenState();
}

class _ParentDashboardScreenState extends State<ParentDashboardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _showChildSwitcher() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select Child Profile',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 6),
            const Text(
              'Switch dashboard view to monitor your enrolled children at Crawford Grammar School:',
              style: TextStyle(fontSize: 12, color: AppColors.secondaryText),
            ),
            const SizedBox(height: 16),
            ...List.generate(MockDatabase.parentChildren.length, (index) {
              final child = MockDatabase.parentChildren[index];
              final isSelected = MockDatabase.selectedChildIndex == index;
              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.accentRedLight : AppColors.cardWhite,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: isSelected ? AppColors.primaryRed : AppColors.borderGrey,
                    width: isSelected ? 1.6 : 1.0,
                  ),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: isSelected ? AppColors.primaryRed : AppColors.darkNavy,
                    child: Text(
                      child.name[0],
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  title: Text(
                    child.name,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: isSelected ? AppColors.primaryRed : AppColors.primaryText,
                    ),
                  ),
                  subtitle: Text('${child.grade}-${child.section} • ID: ${child.id}'),
                  trailing: isSelected
                      ? const Icon(Icons.check_circle_rounded, color: AppColors.primaryRed)
                      : null,
                  onTap: () {
                    setState(() {
                      MockDatabase.selectedChildIndex = index;
                    });
                    Navigator.pop(ctx);
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final activeChild = MockDatabase.activeStudent;
    final challan = MockDatabase.feeChallans.first;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.background,
      drawer: const CrawfordDrawer(),
      appBar: AppBar(
        title: const Text('Parent Portal'),
        leading: IconButton(
          icon: const Icon(Icons.menu_rounded),
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.chat_outlined),
            onPressed: () => Navigator.pushNamed(context, AppRoutes.chat),
          ),
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
            // Active Child Banner with Switcher
            Container(
              padding: const EdgeInsets.all(16),
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
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 26,
                    backgroundColor: AppColors.primaryRed,
                    child: CircleAvatar(
                      radius: 24,
                      backgroundColor: AppColors.pureWhite,
                      child: Text(
                        activeChild.name[0],
                        style: const TextStyle(
                          fontSize: 18,
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
                      children: [
                        const Text(
                          'Active Ward Profile',
                          style: TextStyle(fontSize: 11, color: AppColors.secondaryText),
                        ),
                        Text(
                          activeChild.name,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                        ),
                        Text(
                          '${activeChild.grade}-${activeChild.section} • Roll No. ${activeChild.rollNumber}',
                          style: const TextStyle(fontSize: 12, color: AppColors.secondaryText),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.darkNavy,
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      minimumSize: const Size(60, 34),
                    ),
                    icon: const Icon(Icons.swap_horiz, size: 16),
                    label: const Text('Switch', style: TextStyle(fontSize: 11)),
                    onPressed: _showChildSwitcher,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),

            // Performance & Attendance Row
            Row(
              children: [
                Expanded(
                  child: StatCard(
                    title: 'Attendance',
                    value: '${activeChild.attendancePercentage}%',
                    icon: Icons.calendar_today_rounded,
                    iconColor: AppColors.successGreen,
                    subtitle: '21 Days Present',
                    onTap: () => Navigator.pushNamed(context, AppRoutes.studentAttendance),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: StatCard(
                    title: 'Term 1 Standing',
                    value: 'Grade A*',
                    icon: Icons.emoji_events_rounded,
                    iconColor: AppColors.primaryRed,
                    subtitle: '94% Cumulative',
                    onTap: () => Navigator.pushNamed(context, AppRoutes.studentExams),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),

            // Fee Status Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: challan.isPaid ? AppColors.successLight : AppColors.cardWhite,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: challan.isPaid ? AppColors.successGreen : AppColors.primaryRed.withOpacity(0.5),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            challan.isPaid ? Icons.check_circle_rounded : Icons.receipt_long_rounded,
                            color: challan.isPaid ? AppColors.successGreen : AppColors.primaryRed,
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${challan.month} Fee Voucher',
                                style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                              ),
                              Text(
                                'PKR ${challan.totalAmount.toStringAsFixed(0)} • Due: ${challan.dueDate}',
                                style: const TextStyle(fontSize: 11, color: AppColors.secondaryText),
                              ),
                            ],
                          ),
                        ],
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: challan.isPaid ? AppColors.darkNavy : AppColors.primaryRed,
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          minimumSize: const Size(60, 32),
                        ),
                        onPressed: () async {
                          await Navigator.pushNamed(context, AppRoutes.studentChallanDetail);
                          setState(() {});
                        },
                        child: Text(
                          challan.isPaid ? 'Receipt' : 'Pay Online',
                          style: const TextStyle(fontSize: 11),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Teacher Communication & PTC Appointment
            SectionHeading(
              title: 'Faculty Communication',
              actionText: 'Book Meeting',
              onAction: () => Navigator.pushNamed(context, AppRoutes.parentMeetings),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.cardWhite,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.borderGrey),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.navyLight,
                        child: const Icon(Icons.person, color: Colors.white),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Class Teacher: Prof. Muhammad Usman',
                              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
                            ),
                            Text(
                              'Senior Sciences Faculty • Grade 10 Coordinator',
                              style: TextStyle(fontSize: 11, color: AppColors.secondaryText),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.chat_bubble_outline_rounded,
                            color: AppColors.primaryRed),
                        onPressed: () => Navigator.pushNamed(context, AppRoutes.chat),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Recent School Notices
            const SectionHeading(title: 'School Circulars & Announcements'),
            ...MockDatabase.notices.take(2).map((notice) => Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: AppColors.cardWhite,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: AppColors.borderGrey),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            notice.category,
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primaryRed,
                            ),
                          ),
                          Text(notice.date,
                              style: const TextStyle(fontSize: 10, color: AppColors.secondaryText)),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        notice.title,
                        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
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
