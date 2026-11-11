import 'package:flutter/material.dart';
import '../../core/colors/app_colors.dart';
import '../../core/validators/form_validators.dart';
import '../../navigation/app_routes.dart';
import '../../widgets/crawford_logo.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  int _currentStep = 1; // 1: Email, 2: OTP, 3: New Password, 4: Success
  final _emailController = TextEditingController(text: 'student@crawford.edu.pk');
  final _otpController = TextEditingController(text: '582914');
  final _newPassController = TextEditingController();
  final _confirmPassController = TextEditingController();
  bool _isLoading = false;

  void _submitStep1() {
    if (FormValidators.validateEmail(_emailController.text) == null) {
      setState(() => _isLoading = true);
      Future.delayed(const Duration(milliseconds: 600), () {
        if (mounted) {
          setState(() {
            _isLoading = false;
            _currentStep = 2;
          });
        }
      });
    }
  }

  void _submitStep2() {
    if (_otpController.text.length >= 4) {
      setState(() => _isLoading = true);
      Future.delayed(const Duration(milliseconds: 600), () {
        if (mounted) {
          setState(() {
            _isLoading = false;
            _currentStep = 3;
          });
        }
      });
    }
  }

  void _submitStep3() {
    if (_newPassController.text.length >= 6 &&
        _newPassController.text == _confirmPassController.text) {
      setState(() => _isLoading = true);
      Future.delayed(const Duration(milliseconds: 600), () {
        if (mounted) {
          setState(() {
            _isLoading = false;
            _currentStep = 4;
          });
        }
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _otpController.dispose();
    _newPassController.dispose();
    _confirmPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pureWhite,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.primaryText),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Password Recovery',
          style: TextStyle(color: AppColors.primaryText, fontWeight: FontWeight.w700),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CrawfordLogo(size: 40, showText: true, compact: true),
              const SizedBox(height: 24),

              if (_currentStep == 1) ...[
                const Text(
                  'Forgot Your Password?',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Enter your registered school email address to receive a secure 6-digit verification code.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.secondaryText, fontSize: 13),
                ),
                const SizedBox(height: 24),
                CustomTextField(
                  controller: _emailController,
                  label: 'Registered Email',
                  prefixIcon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 24),
                CustomButton(
                  text: 'Send Verification Code',
                  onPressed: _submitStep1,
                  type: ButtonType.primary,
                  isLoading: _isLoading,
                ),
              ] else if (_currentStep == 2) ...[
                const Text(
                  'Enter Verification Code',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 8),
                Text(
                  'A demo verification code has been sent to ${_emailController.text}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: AppColors.secondaryText, fontSize: 13),
                ),
                const SizedBox(height: 24),
                CustomTextField(
                  controller: _otpController,
                  label: '6-Digit Verification Code',
                  hintText: 'Enter code',
                  prefixIcon: Icons.pin_outlined,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 24),
                CustomButton(
                  text: 'Verify Code',
                  onPressed: _submitStep2,
                  type: ButtonType.primary,
                  isLoading: _isLoading,
                ),
              ] else if (_currentStep == 3) ...[
                const Text(
                  'Reset Your Password',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Create a new strong password for your Crawford School account.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.secondaryText, fontSize: 13),
                ),
                const SizedBox(height: 24),
                CustomTextField(
                  controller: _newPassController,
                  label: 'New Password',
                  isPassword: true,
                  prefixIcon: Icons.lock_outline_rounded,
                ),
                const SizedBox(height: 14),
                CustomTextField(
                  controller: _confirmPassController,
                  label: 'Confirm New Password',
                  isPassword: true,
                  prefixIcon: Icons.lock_reset_rounded,
                ),
                const SizedBox(height: 24),
                CustomButton(
                  text: 'Update Password',
                  onPressed: _submitStep3,
                  type: ButtonType.primary,
                  isLoading: _isLoading,
                ),
              ] else if (_currentStep == 4) ...[
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: AppColors.successLight,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.check_circle_rounded,
                      color: AppColors.successGreen, size: 56),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Password Reset Successfully!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 8),
                const Text(
                  'You can now login to your Crawford School portal with your new password.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.secondaryText, fontSize: 13),
                ),
                const SizedBox(height: 24),
                CustomButton(
                  text: 'Back to Login',
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, AppRoutes.login);
                  },
                  type: ButtonType.primary,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
