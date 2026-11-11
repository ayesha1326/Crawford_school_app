import 'package:flutter/material.dart';
import '../../core/colors/app_colors.dart';
import '../../data/mock_database.dart';
import '../../models/portal_role.dart';
import '../../navigation/app_routes.dart';
import '../../widgets/crawford_logo.dart';
import '../../widgets/custom_button.dart';

class RoleSelectionScreen extends StatefulWidget {
  const RoleSelectionScreen({Key? key}) : super(key: key);

  @override
  State<RoleSelectionScreen> createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends State<RoleSelectionScreen> {
  PortalRole _selectedRole = PortalRole.student;

  final List<Map<String, dynamic>> _roles = [
    {
      'role': PortalRole.student,
      'title': 'Student Portal',
      'subtitle': 'Timetable, assignments, attendance, fee challan & exam report cards.',
      'icon': Icons.school_rounded,
      'badge': 'Grade 10-A Active',
    },
    {
      'role': PortalRole.parent,
      'title': 'Parent Portal',
      'subtitle': 'Multi-child monitoring, fees online, attendance calendar & teacher meetings.',
      'icon': Icons.family_restroom_rounded,
      'badge': '2 Children Linked',
    },
    {
      'role': PortalRole.teacher,
      'title': 'Teacher Portal',
      'subtitle': 'Class roster, live attendance marking, homework creation & mark entry.',
      'icon': Icons.co_present_rounded,
      'badge': 'Faculty Desk',
    },
    {
      'role': PortalRole.admin,
      'title': 'School Administration',
      'subtitle': 'Principal dashboard, admissions approval, fee analytics & institutional control.',
      'icon': Icons.admin_panel_settings_rounded,
      'badge': 'Executive Access',
    },
  ];

  void _proceedToPortal() {
    MockDatabase.currentUserRole = _selectedRole;
    Navigator.pushNamed(context, AppRoutes.login);
  }

  void _directDemoAccess(PortalRole role) {
    MockDatabase.currentUserRole = role;
    AppRoutes.navigateToActivePortal(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.primaryText),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: const [
                    CrawfordLogo(size: 40, showText: true, compact: true),
                    SizedBox(height: 12),
                    Text(
                      'Select Your School Portal',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: AppColors.primaryText,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Choose your role to access your personalized environment',
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.secondaryText,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // 4 Role Cards
              Expanded(
                child: ListView.separated(
                  itemCount: _roles.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final item = _roles[index];
                    final PortalRole role = item['role'];
                    final bool isSelected = _selectedRole == role;

                    return InkWell(
                      onTap: () {
                        setState(() {
                          _selectedRole = role;
                        });
                      },
                      borderRadius: BorderRadius.circular(16),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.cardWhite,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: isSelected ? AppColors.primaryRed : AppColors.borderGrey,
                            width: isSelected ? 2.0 : 1.0,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: isSelected
                                  ? AppColors.primaryRed.withOpacity(0.08)
                                  : Colors.black.withOpacity(0.03),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? AppColors.primaryRed
                                    : AppColors.darkNavy.withOpacity(0.06),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Icon(
                                item['icon'],
                                color: isSelected ? AppColors.pureWhite : AppColors.darkNavy,
                                size: 26,
                              ),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        item['title'],
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: isSelected
                                              ? AppColors.primaryRed
                                              : AppColors.primaryText,
                                        ),
                                      ),
                                      const Spacer(),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 3),
                                        decoration: BoxDecoration(
                                          color: isSelected
                                              ? AppColors.accentRedLight
                                              : AppColors.lightGrey,
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Text(
                                          item['badge'],
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w700,
                                            color: isSelected
                                                ? AppColors.primaryRed
                                                : AppColors.secondaryText,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    item['subtitle'],
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: AppColors.secondaryText,
                                      height: 1.35,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  InkWell(
                                    onTap: () => _directDemoAccess(role),
                                    child: const Text(
                                      '⚡ Quick Demo Launch →',
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.primaryRed,
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
                  },
                ),
              ),

              // Continue Button
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: CustomButton(
                  text: 'Continue with ${_roles.firstWhere((r) => r['role'] == _selectedRole)['title']}',
                  onPressed: _proceedToPortal,
                  type: ButtonType.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
