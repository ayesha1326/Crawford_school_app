import 'package:flutter/material.dart';
import '../data/mock_database.dart';
import '../models/portal_role.dart';

class AppRoutes {
  AppRoutes._();

  // Route Name Constants
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String welcome = '/welcome';
  static const String roleSelection = '/role-selection';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';

  // Student Portal
  static const String studentDashboard = '/student-dashboard';
  static const String studentProfile = '/student-profile';
  static const String studentAcademics = '/student-academics';
  static const String subjectDetail = '/subject-detail';
  static const String studentAttendance = '/student-attendance';
  static const String studentTimetable = '/student-timetable';
  static const String studentFees = '/student-fees';
  static const String studentChallanDetail = '/student-challan-detail';
  static const String studentExams = '/student-exams';
  static const String studentAssignments = '/student-assignments';
  static const String studentLibrary = '/student-library';

  // Parent Portal
  static const String parentDashboard = '/parent-dashboard';
  static const String parentFees = '/parent-fees';
  static const String parentMeetings = '/parent-meetings';

  // Teacher Portal
  static const String teacherDashboard = '/teacher-dashboard';
  static const String teacherClasses = '/teacher-classes';
  static const String markAttendance = '/mark-attendance';
  static const String createAssignment = '/create-assignment';

  // Admin Portal
  static const String adminDashboard = '/admin-dashboard';
  static const String adminAdmissions = '/admin-admissions';
  static const String adminStudents = '/admin-students';
  static const String adminTeachers = '/admin-teachers';
  static const String adminFees = '/admin-fees';

  // Admissions
  static const String admissionsLanding = '/admissions-landing';
  static const String admissionApplyForm = '/admission-apply-form';
  static const String admissionTracker = '/admission-tracker';

  // School Information
  static const String aboutSchool = '/about-school';
  static const String principalsMessage = '/principals-message';
  static const String facilities = '/facilities';
  static const String events = '/events';
  static const String gallery = '/gallery';
  static const String notices = '/notices';
  static const String chat = '/chat';
  static const String schoolLocation = '/school-location';
  static const String settings = '/settings';
  static const String giveFeedback = '/give-feedback';
  static const String bookCampusVisit = '/book-campus-visit';

  /// Helper to navigate directly to the currently active portal
  static void navigateToActivePortal(BuildContext context) {
    switch (MockDatabase.currentUserRole) {
      case PortalRole.student:
        Navigator.pushReplacementNamed(context, studentDashboard);
        break;
      case PortalRole.parent:
        Navigator.pushReplacementNamed(context, parentDashboard);
        break;
      case PortalRole.teacher:
        Navigator.pushReplacementNamed(context, teacherDashboard);
        break;
      case PortalRole.admin:
        Navigator.pushReplacementNamed(context, adminDashboard);
        break;
    }
  }
}
