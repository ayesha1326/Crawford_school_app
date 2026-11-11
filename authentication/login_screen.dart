import 'package:flutter/material.dart';
import '../../core/colors/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../core/validators/form_validators.dart';
import '../../data/mock_database.dart';
import '../../models/portal_role.dart';
import '../../navigation/app_routes.dart';
import '../../widgets/crawford_logo.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/wave_painter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fillDefaultDemoCredentials();
  }

  void _fillDefaultDemoCredentials() {
    switch (MockDatabase.currentUserRole) {
      case PortalRole.student:
        _usernameController.text = AppConstants.demoStudentEmail;
        _passwordController.text = AppConstants.demoStudentPassword;
        break;
      case PortalRole.parent:
        _usernameController.text = AppConstants.demoParentEmail;
        _passwordController.text = AppConstants.demoParentPassword;
        break;
      case PortalRole.teacher:
        _usernameController.text = AppConstants.demoTeacherEmail;
        _passwordController.text = AppConstants.demoTeacherPassword;
        break;
      case PortalRole.admin:
        _usernameController.text = AppConstants.demoAdminEmail;
        _passwordController.text = AppConstants.demoAdminPassword;
        break;
    }
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      Future.delayed(const Duration(milliseconds: 600), () {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
          AppRoutes.navigateToActivePortal(context);
        }
      });
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final roleName = MockDatabase.getRoleDisplayName(MockDatabase.currentUserRole);

    return Scaffold(
      backgroundColor: AppColors.pureWhite,
      body: WaveBackground(
        showTopWave: true,
        showBottomWave: true,
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  // Back / Portal Switcher
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios_new_rounded,
                            size: 18, color: AppColors.primaryText),
                        onPressed: () => Navigator.pop(context),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.roleSelection);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: AppColors.accentRedLight,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.swap_horiz, size: 14, color: AppColors.primaryRed),
                              const SizedBox(width: 4),
                              Text(
                                roleName,
                                style: const TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.primaryRed,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),
                  // Logo matching reference design
                  const CrawfordLogo(
                    size: 52,
                    showText: true,
                  ),
                  const SizedBox(height: 20),

                  // Header texts matching screenshot 3
                  const Text(
                    'Login to Your Account',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: AppColors.primaryText,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Access your school portal',
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.secondaryText,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Input: Email / Username
                  CustomTextField(
                    controller: _usernameController,
                    hintText: 'Email / Username',
                    prefixIcon: Icons.person_outline_rounded,
                    validator: FormValidators.validateEmail,
                  ),
                  const SizedBox(height: 14),

                  // Input: Password
                  CustomTextField(
                    controller: _passwordController,
                    hintText: 'Password',
                    isPassword: true,
                    prefixIcon: Icons.lock_outline_rounded,
                    validator: FormValidators.validatePassword,
                  ),

                  // Forgot Password
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.forgotPassword);
                      },
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.secondaryText,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Login Button
                  CustomButton(
                    text: 'Login',
                    onPressed: _handleLogin,
                    type: ButtonType.primary,
                    isLoading: _isLoading,
                  ),
                  const SizedBox(height: 14),

                  // Don't have an account? Register
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account? ",
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.secondaryText,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.register);
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                            color: AppColors.primaryRed,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Or continue with
                  Row(
                    children: const [
                      Expanded(child: Divider()),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.secondaryText,
                          ),
                        ),
                      ),
                      Expanded(child: Divider()),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Social login buttons matching screenshot
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSocialButton(Icons.g_mobiledata_rounded, 'Google', Colors.redAccent),
                      const SizedBox(width: 16),
                      _buildSocialButton(Icons.apple_rounded, 'Apple', Colors.black87),
                      const SizedBox(width: 16),
                      _buildSocialButton(Icons.window_rounded, 'Microsoft', Colors.blue),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Quick Demo Switcher helper pills for testing
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.lightGrey,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.borderGrey),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Quick University Demo Fill:',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: AppColors.secondaryText,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Wrap(
                          spacing: 6,
                          children: [
                            _buildRoleDemoPill('Student', PortalRole.student),
                            _buildRoleDemoPill('Parent', PortalRole.parent),
                            _buildRoleDemoPill('Teacher', PortalRole.teacher),
                            _buildRoleDemoPill('Admin', PortalRole.admin),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRoleDemoPill(String label, PortalRole role) {
    final isCurrent = MockDatabase.currentUserRole == role;
    return InkWell(
      onTap: () {
        setState(() {
          MockDatabase.currentUserRole = role;
          _fillDefaultDemoCredentials();
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: isCurrent ? AppColors.primaryRed : AppColors.cardWhite,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isCurrent ? AppColors.primaryRed : AppColors.borderGrey,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            color: isCurrent ? AppColors.pureWhite : AppColors.primaryText,
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(IconData icon, String label, Color color) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$label single sign-on authenticated in demo mode.'),
            backgroundColor: AppColors.darkNavy,
          ),
        );
        _handleLogin();
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 52,
        height: 52,
        decoration: BoxDecoration(
          color: AppColors.cardWhite,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.borderGrey),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(icon, size: 26, color: color),
      ),
    );
  }
}
