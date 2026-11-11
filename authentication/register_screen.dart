import 'package:flutter/material.dart';
import '../../core/colors/app_colors.dart';
import '../../core/validators/form_validators.dart';
import '../../navigation/app_routes.dart';
import '../../widgets/crawford_logo.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _idController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  String _accountType = 'Student';
  bool _termsAgreed = false;
  bool _isLoading = false;

  void _handleRegister() {
    if (_formKey.currentState!.validate()) {
      if (!_termsAgreed) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please accept the Crawford School Terms & Conditions.'),
            backgroundColor: AppColors.primaryRed,
          ),
        );
        return;
      }

      setState(() => _isLoading = true);

      Future.delayed(const Duration(milliseconds: 700), () {
        if (mounted) {
          setState(() => _isLoading = false);
          _showSuccessDialog();
        }
      });
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.successLight,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.check_circle_rounded,
                  color: AppColors.successGreen, size: 48),
            ),
            const SizedBox(height: 16),
            const Text(
              'Account Created!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: AppColors.primaryText,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Your $_accountType portal registration request for Crawford Grammar School has been registered successfully.',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.secondaryText,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: 'Proceed to Login',
              onPressed: () {
                Navigator.pop(ctx);
                Navigator.pushReplacementNamed(context, AppRoutes.login);
              },
              type: ButtonType.primary,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _idController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
          'Create School Account',
          style: TextStyle(
            color: AppColors.primaryText,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: CrawfordLogo(size: 40, showText: true, compact: true),
                ),
                const SizedBox(height: 20),

                // Account Type Selector
                const Text(
                  'Select Account Type',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 8),
                Row(
                  children: ['Student', 'Parent', 'Teacher'].map((type) {
                    final isSel = _accountType == type;
                    return Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _accountType = type),
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: isSel ? AppColors.primaryRed : AppColors.lightGrey,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: isSel ? AppColors.primaryRed : AppColors.borderGrey,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              type,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: isSel ? AppColors.pureWhite : AppColors.primaryText,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 18),

                CustomTextField(
                  controller: _nameController,
                  label: 'Full Legal Name',
                  hintText: 'e.g. Sarah Ahmed',
                  prefixIcon: Icons.badge_outlined,
                  validator: (v) => FormValidators.requiredField(v, fieldName: 'Full Name'),
                ),
                const SizedBox(height: 14),

                CustomTextField(
                  controller: _emailController,
                  label: 'Official / Personal Email',
                  hintText: 'name@example.com',
                  prefixIcon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  validator: FormValidators.validateEmail,
                ),
                const SizedBox(height: 14),

                CustomTextField(
                  controller: _phoneController,
                  label: 'Contact Phone Number',
                  hintText: '+92 300 1234567',
                  prefixIcon: Icons.phone_outlined,
                  keyboardType: TextInputType.phone,
                  validator: FormValidators.validatePhone,
                ),
                const SizedBox(height: 14),

                CustomTextField(
                  controller: _idController,
                  label: _accountType == 'Teacher' ? 'Employee Faculty ID' : 'Student / Registration ID',
                  hintText: 'e.g. CGS-2026-1042',
                  prefixIcon: Icons.confirmation_number_outlined,
                  validator: (v) => FormValidators.requiredField(v, fieldName: 'ID number'),
                ),
                const SizedBox(height: 14),

                CustomTextField(
                  controller: _passwordController,
                  label: 'Create Secure Password',
                  hintText: 'Minimum 6 characters',
                  isPassword: true,
                  prefixIcon: Icons.lock_outline_rounded,
                  validator: FormValidators.validatePassword,
                ),
                const SizedBox(height: 14),

                CustomTextField(
                  controller: _confirmPasswordController,
                  label: 'Confirm Password',
                  hintText: 'Re-enter your password',
                  isPassword: true,
                  prefixIcon: Icons.lock_reset_rounded,
                  validator: (val) {
                    if (val != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 14),

                // Terms and Conditions checkbox
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: _termsAgreed,
                      activeColor: AppColors.primaryRed,
                      onChanged: (val) {
                        setState(() => _termsAgreed = val ?? false);
                      },
                    ),
                    const Expanded(
                      child: Text(
                        'I accept Crawford Grammar School policies, portal regulations & code of conduct.',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.secondaryText,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                CustomButton(
                  text: 'Create My Account',
                  onPressed: _handleRegister,
                  type: ButtonType.primary,
                  isLoading: _isLoading,
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
