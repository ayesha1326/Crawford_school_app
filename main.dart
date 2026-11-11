import 'package:flutter/material.dart';
import 'app/app_theme.dart';
import 'core/constants/app_constants.dart';
import 'navigation/app_routes.dart';

// Screens
import 'screens/splash/splash_screen.dart';
import 'screens/onboarding/onboarding_screen.dart';
import 'screens/welcome/welcome_screen.dart';
import 'screens/role_selection/role_selection_screen.dart';
import 'screens/authentication/login_screen.dart';
import 'screens/authentication/register_screen.dart';
import 'screens/authentication/forgot_password_screen.dart';

// Student Portal
import 'screens/student_portal/student_dashboard_screen.dart';
import 'screens/student_portal/student_academics_screen.dart';
import 'screens/student_portal/student_attendance_screen.dart';
import 'screens/student_portal/student_timetable_screen.dart';
import 'screens/student_portal/student_fees_screen.dart';
import 'screens/student_portal/student_challan_detail_screen.dart';
import 'screens/student_portal/student_exams_screen.dart';
import 'screens/student_portal/student_assignments_screen.dart';
import 'screens/student_portal/student_library_screen.dart';

// Parent Portal
import 'screens/parent_portal/parent_dashboard_screen.dart';
import 'screens/parent_portal/parent_meetings_screen.dart';

// Teacher Portal
import 'screens/teacher_portal/teacher_dashboard_screen.dart';
import 'screens/teacher_portal/mark_attendance_screen.dart';
import 'screens/teacher_portal/create_assignment_screen.dart';

// Admin Portal
import 'screens/admin_portal/admin_dashboard_screen.dart';
import 'screens/admin_portal/admin_admissions_screen.dart';

// Admissions Module
import 'screens/admissions/admissions_landing_screen.dart';
import 'screens/admissions/admission_apply_stepper_screen.dart';

// School Information & Principal
import 'screens/school_information/about_school_screen.dart';
import 'screens/principal/principals_message_screen.dart';
import 'screens/facilities/facilities_screen.dart';

// Events & Media
import 'screens/events/events_screen.dart';
import 'screens/gallery/gallery_screen.dart';

// Communication & Settings
import 'screens/notices/notices_screen.dart';
import 'screens/messages/messages_chat_screen.dart';
import 'screens/location/school_location_screen.dart';
import 'screens/settings/settings_screen.dart';
import 'screens/feedback/give_feedback_screen.dart';
import 'screens/campus_visit/book_campus_visit_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const CrawfordSchoolApp());
}

class CrawfordSchoolApp extends StatelessWidget {
  const CrawfordSchoolApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.splash,
      routes: {
        AppRoutes.splash: (context) => const SplashScreen(),
        AppRoutes.onboarding: (context) => const OnboardingScreen(),
        AppRoutes.welcome: (context) => const WelcomeScreen(),
        AppRoutes.roleSelection: (context) => const RoleSelectionScreen(),
        AppRoutes.login: (context) => const LoginScreen(),
        AppRoutes.register: (context) => const RegisterScreen(),
        AppRoutes.forgotPassword: (context) => const ForgotPasswordScreen(),

        // Student Portal
        AppRoutes.studentDashboard: (context) => const StudentDashboardScreen(),
        AppRoutes.studentAcademics: (context) => const StudentAcademicsScreen(),
        AppRoutes.studentAttendance: (context) => const StudentAttendanceScreen(),
        AppRoutes.studentTimetable: (context) => const StudentTimetableScreen(),
        AppRoutes.studentFees: (context) => const StudentFeesScreen(),
        AppRoutes.studentChallanDetail: (context) => const StudentChallanDetailScreen(),
        AppRoutes.studentExams: (context) => const StudentExamsScreen(),
        AppRoutes.studentAssignments: (context) => const StudentAssignmentsScreen(),
        AppRoutes.studentLibrary: (context) => const StudentLibraryScreen(),

        // Parent Portal
        AppRoutes.parentDashboard: (context) => const ParentDashboardScreen(),
        AppRoutes.parentMeetings: (context) => const ParentMeetingsScreen(),

        // Teacher Portal
        AppRoutes.teacherDashboard: (context) => const TeacherDashboardScreen(),
        AppRoutes.markAttendance: (context) => const MarkAttendanceScreen(),
        AppRoutes.createAssignment: (context) => const CreateAssignmentScreen(),

        // Admin Portal
        AppRoutes.adminDashboard: (context) => const AdminDashboardScreen(),
        AppRoutes.adminAdmissions: (context) => const AdminAdmissionsScreen(),

        // Admissions Module
        AppRoutes.admissionsLanding: (context) => const AdmissionsLandingScreen(),
        AppRoutes.admissionApplyForm: (context) => const AdmissionApplyStepperScreen(),

        // School Information & Facilities
        AppRoutes.aboutSchool: (context) => const AboutSchoolScreen(),
        AppRoutes.principalsMessage: (context) => const PrincipalsMessageScreen(),
        AppRoutes.facilities: (context) => const FacilitiesScreen(),

        // Events, Media, Notices
        AppRoutes.events: (context) => const EventsScreen(),
        AppRoutes.gallery: (context) => const GalleryScreen(),
        AppRoutes.notices: (context) => const NoticesScreen(),
        AppRoutes.chat: (context) => const MessagesChatScreen(),
        AppRoutes.schoolLocation: (context) => const SchoolLocationScreen(),
        AppRoutes.settings: (context) => const SettingsScreen(),
        AppRoutes.giveFeedback: (context) => const GiveFeedbackScreen(),
        AppRoutes.bookCampusVisit: (context) => const BookCampusVisitScreen(),
      },
    );
  }
}
