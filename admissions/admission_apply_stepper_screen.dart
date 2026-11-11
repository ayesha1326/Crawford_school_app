import 'package:flutter/material.dart';
import '../../core/colors/app_colors.dart';
import '../../data/mock_database.dart';
import '../../models/admission_application.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

class AdmissionApplyStepperScreen extends StatefulWidget {
  const AdmissionApplyStepperScreen({Key? key}) : super(key: key);

  @override
  State<AdmissionApplyStepperScreen> createState() => _AdmissionApplyStepperScreenState();
}

class _AdmissionApplyStepperScreenState extends State<AdmissionApplyStepperScreen> {
  int _currentStep = 0;

  // Form Controllers
  final _studentNameController = TextEditingController(text: 'Hamza Farooq');
  final _dobController = TextEditingController(text: '12 March 2012');
  String _gender = 'Male';
  String _applyingGrade = 'Grade 8';

  final _fatherNameController = TextEditingController(text: 'Farooq Ahmed');
  final _guardianPhoneController = TextEditingController(text: '+92 300 4567890');
  final _guardianEmailController = TextEditingController(text: 'farooq.ahmed@example.com');
  final _occupationController = TextEditingController(text: 'Chartered Accountant');

  final _prevSchoolController = TextEditingController(text: 'Army Public School');
  final _prevGradeController = TextEditingController(text: 'Grade 7 (88% marks)');

  final _addressController = TextEditingController(text: 'Apartment 4B, Hilltop Heights, Gulshan-e-Iqbal, Karachi');
  final _emergencyContactController = TextEditingController(text: '+92 321 8877665');
  final _medicalNotesController = TextEditingController(text: 'None / Fully Immunized');

  bool _photoAttached = true;
  bool _bformAttached = true;
  bool _reportAttached = true;
  bool _isSubmitting = false;

  void _nextStep() {
    if (_currentStep < 5) {
      setState(() => _currentStep++);
    } else {
      _submitApplication();
    }
  }

  void _prevStep() {
    if (_currentStep > 0) {
      setState(() => _currentStep--);
    }
  }

  void _submitApplication() {
    setState(() => _isSubmitting = true);

    Future.delayed(const Duration(milliseconds: 900), () {
      if (mounted) {
        final generatedAppNumber = 'CGS-ADM-2026-${DateTime.now().millisecondsSinceEpoch.toString().substring(9)}';

        final newApp = AdmissionApplication(
          applicationNumber: generatedAppNumber,
          studentFullName: _studentNameController.text,
          dateOfBirth: _dobController.text,
          gender: _gender,
          applyingGrade: _applyingGrade,
          fatherName: _fatherNameController.text,
          guardianContact: _guardianPhoneController.text,
          guardianEmail: _guardianEmailController.text,
          address: _addressController.text,
          previousSchool: _prevSchoolController.text,
          submissionDate: 'Today, 11 Nov 2026',
          status: AdmissionStatus.pending,
        );

        MockDatabase.addAdmissionApplication(newApp);

        setState(() => _isSubmitting = false);
        _showSuccessDialog(generatedAppNumber);
      }
    });
  }

  void _showSuccessDialog(String appNumber) {
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
              decoration: const BoxDecoration(
                color: AppColors.successLight,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.check_circle_rounded,
                  color: AppColors.successGreen, size: 52),
            ),
            const SizedBox(height: 16),
            const Text(
              'Application Submitted!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 8),
            Text(
              'Your application for ${_studentNameController.text} has been registered with Crawford Grammar School.',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12, color: AppColors.secondaryText),
            ),
            const SizedBox(height: 14),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.accentRedLight,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Reference: $appNumber',
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                  color: AppColors.primaryRed,
                ),
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: 'Done',
              onPressed: () {
                Navigator.pop(ctx);
                Navigator.pop(context);
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
    _studentNameController.dispose();
    _dobController.dispose();
    _fatherNameController.dispose();
    _guardianPhoneController.dispose();
    _guardianEmailController.dispose();
    _occupationController.dispose();
    _prevSchoolController.dispose();
    _prevGradeController.dispose();
    _addressController.dispose();
    _emergencyContactController.dispose();
    _medicalNotesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Admission Application'),
      ),
      body: Column(
        children: [
          // Step Indicator Header
          Container(
            color: AppColors.darkNavy,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(6, (index) {
                final isDone = index < _currentStep;
                final isCurrent = index == _currentStep;
                return Row(
                  children: [
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: isDone
                          ? AppColors.successGreen
                          : isCurrent
                              ? AppColors.primaryRed
                              : Colors.white24,
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    if (index < 5)
                      Container(
                        width: 24,
                        height: 2,
                        color: isDone ? AppColors.successGreen : Colors.white24,
                      ),
                  ],
                );
              }),
            ),
          ),

          // Active Step Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: _buildStepBody(),
            ),
          ),

          // Bottom Stepper Navigation Controls
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: AppColors.cardWhite,
              border: Border(top: BorderSide(color: AppColors.borderGrey)),
            ),
            child: Row(
              children: [
                if (_currentStep > 0)
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: _prevStep,
                      child: const Text('Back'),
                    ),
                  ),
                if (_currentStep > 0) const SizedBox(width: 12),
                Expanded(
                  flex: 2,
                  child: CustomButton(
                    text: _currentStep == 5 ? 'Confirm & Submit Application' : 'Continue to Step ${_currentStep + 2}',
                    onPressed: _nextStep,
                    type: ButtonType.primary,
                    isLoading: _isSubmitting,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepBody() {
    switch (_currentStep) {
      case 0:
        return _buildStep1StudentInfo();
      case 1:
        return _buildStep2ParentInfo();
      case 2:
        return _buildStep3AcademicInfo();
      case 3:
        return _buildStep4AdditionalInfo();
      case 4:
        return _buildStep5Documents();
      case 5:
        return _buildStep6Review();
      default:
        return const SizedBox();
    }
  }

  Widget _buildStep1StudentInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Step 1 of 6: Student Particulars',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
        const SizedBox(height: 6),
        const Text('Enter the applicant’s legal identification particulars.',
            style: TextStyle(fontSize: 12, color: AppColors.secondaryText)),
        const SizedBox(height: 18),
        CustomTextField(
          controller: _studentNameController,
          label: 'Student Full Name',
          hintText: 'e.g. Hamza Farooq',
          prefixIcon: Icons.badge_outlined,
        ),
        const SizedBox(height: 14),
        CustomTextField(
          controller: _dobController,
          label: 'Date of Birth',
          hintText: 'DD Month YYYY',
          prefixIcon: Icons.calendar_month_outlined,
        ),
        const SizedBox(height: 14),
        const Text('Gender', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
        const SizedBox(height: 6),
        Row(
          children: ['Male', 'Female'].map((g) {
            final isSel = _gender == g;
            return Expanded(
              child: GestureDetector(
                onTap: () => setState(() => _gender = g),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: isSel ? AppColors.primaryRed : AppColors.cardWhite,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: isSel ? AppColors.primaryRed : AppColors.borderGrey),
                  ),
                  child: Center(
                    child: Text(
                      g,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: isSel ? Colors.white : AppColors.primaryText,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 14),
        const Text('Applying Grade', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            color: AppColors.cardWhite,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.borderGrey),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              value: _applyingGrade,
              items: [
                'Nursery',
                'KG 1',
                'KG 2',
                'Grade 1',
                'Grade 5',
                'Grade 6',
                'Grade 8',
                'Grade 9 (CAIE O-Levels)',
                'Grade 11 (CAIE A-Levels)',
              ]
                  .map((g) => DropdownMenuItem(value: g, child: Text(g, style: const TextStyle(fontSize: 13))))
                  .toList(),
              onChanged: (val) => setState(() => _applyingGrade = val!),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStep2ParentInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Step 2 of 6: Parent / Guardian Information',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
        const SizedBox(height: 6),
        const Text('Contact details for admission notifications and interview scheduling.',
            style: TextStyle(fontSize: 12, color: AppColors.secondaryText)),
        const SizedBox(height: 18),
        CustomTextField(
          controller: _fatherNameController,
          label: 'Father / Guardian Name',
          prefixIcon: Icons.person_outline_rounded,
        ),
        const SizedBox(height: 14),
        CustomTextField(
          controller: _guardianPhoneController,
          label: 'Contact Mobile Number',
          keyboardType: TextInputType.phone,
          prefixIcon: Icons.phone_outlined,
        ),
        const SizedBox(height: 14),
        CustomTextField(
          controller: _guardianEmailController,
          label: 'Guardian Email Address',
          keyboardType: TextInputType.emailAddress,
          prefixIcon: Icons.email_outlined,
        ),
        const SizedBox(height: 14),
        CustomTextField(
          controller: _occupationController,
          label: 'Guardian Occupation / Profession',
          prefixIcon: Icons.work_outline_rounded,
        ),
      ],
    );
  }

  Widget _buildStep3AcademicInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Step 3 of 6: Prior Academic History',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
        const SizedBox(height: 6),
        const Text('Details regarding previous institution and academic performance.',
            style: TextStyle(fontSize: 12, color: AppColors.secondaryText)),
        const SizedBox(height: 18),
        CustomTextField(
          controller: _prevSchoolController,
          label: 'Previous School Attended',
          prefixIcon: Icons.school_outlined,
        ),
        const SizedBox(height: 14),
        CustomTextField(
          controller: _prevGradeController,
          label: 'Last Grade & Score / Division',
          prefixIcon: Icons.grade_outlined,
        ),
      ],
    );
  }

  Widget _buildStep4AdditionalInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Step 4 of 6: Residential & Health',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
        const SizedBox(height: 6),
        const Text('Address for correspondence and medical safety disclosures.',
            style: TextStyle(fontSize: 12, color: AppColors.secondaryText)),
        const SizedBox(height: 18),
        CustomTextField(
          controller: _addressController,
          label: 'Residential Street Address',
          maxLines: 2,
          prefixIcon: Icons.home_outlined,
        ),
        const SizedBox(height: 14),
        CustomTextField(
          controller: _emergencyContactController,
          label: 'Alternate Emergency Number',
          prefixIcon: Icons.contact_phone_outlined,
        ),
        const SizedBox(height: 14),
        CustomTextField(
          controller: _medicalNotesController,
          label: 'Allergies / Special Medical Notes',
          prefixIcon: Icons.medical_information_outlined,
        ),
      ],
    );
  }

  Widget _buildStep5Documents() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Step 5 of 6: Document Uploads',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
        const SizedBox(height: 6),
        const Text('Simulation: Attached files for admission verification.',
            style: TextStyle(fontSize: 12, color: AppColors.secondaryText)),
        const SizedBox(height: 18),
        _buildUploadTile('Student Passport Photograph', _photoAttached, () {
          setState(() => _photoAttached = !_photoAttached);
        }),
        const SizedBox(height: 12),
        _buildUploadTile('NADRA Birth Certificate / Form-B', _bformAttached, () {
          setState(() => _bformAttached = !_bformAttached);
        }),
        const SizedBox(height: 12),
        _buildUploadTile('Previous School Leaving Transcript', _reportAttached, () {
          setState(() => _reportAttached = !_reportAttached);
        }),
      ],
    );
  }

  Widget _buildUploadTile(String title, bool attached, VoidCallback onToggle) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.cardWhite,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: attached ? AppColors.successGreen : AppColors.borderGrey),
      ),
      child: Row(
        children: [
          Icon(
            attached ? Icons.check_circle_rounded : Icons.upload_file_rounded,
            color: attached ? AppColors.successGreen : AppColors.secondaryText,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
                Text(
                  attached ? 'File Attached (Verified)' : 'Click to attach file',
                  style: TextStyle(
                    fontSize: 11,
                    color: attached ? AppColors.successGreen : AppColors.secondaryText,
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: onToggle,
            child: Text(attached ? 'Remove' : 'Attach'),
          ),
        ],
      ),
    );
  }

  Widget _buildStep6Review() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Step 6 of 6: Application Review',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
        const SizedBox(height: 6),
        const Text('Verify all submitted particulars before sending to the Admissions Registrar.',
            style: TextStyle(fontSize: 12, color: AppColors.secondaryText)),
        const SizedBox(height: 18),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.cardWhite,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.borderGrey),
          ),
          child: Column(
            children: [
              _buildReviewRow('Applicant', _studentNameController.text),
              const Divider(),
              _buildReviewRow('Date of Birth', _dobController.text),
              const Divider(),
              _buildReviewRow('Gender', _gender),
              const Divider(),
              _buildReviewRow('Applying Grade', _applyingGrade),
              const Divider(),
              _buildReviewRow('Guardian', _fatherNameController.text),
              const Divider(),
              _buildReviewRow('Contact', _guardianPhoneController.text),
              const Divider(),
              _buildReviewRow('Email', _guardianEmailController.text),
              const Divider(),
              _buildReviewRow('Previous School', _prevSchoolController.text),
              const Divider(),
              _buildReviewRow('Address', _addressController.text),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildReviewRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(label, style: const TextStyle(fontSize: 11, color: AppColors.secondaryText)),
          ),
          Expanded(
            child: Text(value, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
          ),
        ],
      ),
    );
  }
}
