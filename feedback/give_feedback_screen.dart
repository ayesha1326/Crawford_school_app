import 'package:flutter/material.dart';
import '../../core/colors/app_colors.dart';
import '../../widgets/custom_button.dart';

class GiveFeedbackScreen extends StatefulWidget {
  const GiveFeedbackScreen({super.key});

  @override
  State<GiveFeedbackScreen> createState() => _GiveFeedbackScreenState();
}

class _GiveFeedbackScreenState extends State<GiveFeedbackScreen> {
  final _formKey = GlobalKey<FormState>();

  String _selectedCategory = 'Academics & Curriculum';
  String _userRole = 'Student';
  int _overallRating = 5;
  bool _isAnonymous = false;
  bool _isSubmitting = false;

  final TextEditingController _nameController = TextEditingController(text: 'Sarah Ahmed');
  final TextEditingController _emailController = TextEditingController(text: 'sarah.ahmed@crawford.edu.pk');
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _commentsController = TextEditingController();

  final List<String> _categories = [
    'Academics & Curriculum',
    'Faculty & Teaching',
    'Campus Facilities',
    'Transport & Safety',
    'Sports & Extracurriculars',
    'Administration & Fees',
    'General Suggestions',
  ];

  final List<String> _roles = [
    'Student',
    'Parent',
    'Teacher / Staff',
    'Visitor / Alumni',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _commentsController.dispose();
    super.dispose();
  }

  void _submitFeedback() {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSubmitting = true);

    Future.delayed(const Duration(milliseconds: 900), () {
      if (!mounted) return;
      setState(() => _isSubmitting = false);

      final referenceId = 'CGS-FB-${DateTime.now().year}-${(1000 + DateTime.now().millisecond * 7) % 9000 + 1000}';

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (ctx) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          contentPadding: const EdgeInsets.all(24),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: const BoxDecoration(
                  color: AppColors.successLight,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check_circle_rounded, color: AppColors.successGreen, size: 40),
              ),
              const SizedBox(height: 16),
              const Text(
                'Feedback Received!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkNavy,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Thank you for helping Crawford Grammar School maintain academic and campus excellence.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, color: AppColors.secondaryText, height: 1.4),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: AppColors.lightGrey,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.borderGrey),
                ),
                child: Column(
                  children: [
                    const Text(
                      'REFERENCE TICKET ID',
                      style: TextStyle(fontSize: 10, letterSpacing: 1.2, fontWeight: FontWeight.w700, color: AppColors.secondaryText),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      referenceId,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        color: AppColors.primaryRed,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.darkNavy,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {
                    Navigator.pop(ctx);
                    Navigator.pop(context);
                  },
                  child: const Text('Return to Dashboard', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Give School Feedback'),
        backgroundColor: AppColors.darkNavy,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hero Banner
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.darkNavy, Color(0xFF1F3B4D)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.darkNavy.withValues(alpha: 0.15),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.primaryRed.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Icon(Icons.rate_review_rounded, color: AppColors.primaryRed, size: 32),
                    ),
                    const SizedBox(width: 16),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Your Opinion Matters',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Help Crawford Grammar School continuously improve academics, safety, and student life.',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                              height: 1.3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Rating Section
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: AppColors.cardWhite,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.borderGrey),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Overall Experience Rating',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.darkNavy),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        final starValue = index + 1;
                        final isFilled = starValue <= _overallRating;
                        return IconButton(
                          iconSize: 34,
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          icon: Icon(
                            isFilled ? Icons.star_rounded : Icons.star_border_rounded,
                            color: isFilled ? const Color(0xFFFFB800) : AppColors.mutedText,
                          ),
                          onPressed: () => setState(() => _overallRating = starValue),
                        );
                      }),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      _getRatingLabel(_overallRating),
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryRed,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Category Selector
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: AppColors.cardWhite,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.borderGrey),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Select Feedback Category',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.darkNavy),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: _categories.map((cat) {
                        final isSelected = _selectedCategory == cat;
                        return ChoiceChip(
                          label: Text(
                            cat,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                              color: isSelected ? Colors.white : AppColors.primaryText,
                            ),
                          ),
                          selected: isSelected,
                          selectedColor: AppColors.primaryRed,
                          backgroundColor: AppColors.lightGrey,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          onSelected: (selected) {
                            if (selected) setState(() => _selectedCategory = cat);
                          },
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Form Details
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: AppColors.cardWhite,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.borderGrey),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Your Details & Comments',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.darkNavy),
                    ),
                    const SizedBox(height: 16),

                    // User role dropdown
                    const Text('I am submitting as:', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.secondaryText)),
                    const SizedBox(height: 6),
                    DropdownButtonFormField<String>(
                      value: _userRole,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      items: _roles.map((r) => DropdownMenuItem(value: r, child: Text(r))).toList(),
                      onChanged: (val) {
                        if (val != null) setState(() => _userRole = val);
                      },
                    ),

                    const SizedBox(height: 14),

                    // Anonymous toggle
                    SwitchListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Submit Anonymously', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                      subtitle: const Text('Keep your name and email private from feedback records', style: TextStyle(fontSize: 11, color: AppColors.secondaryText)),
                      value: _isAnonymous,
                      activeColor: AppColors.primaryRed,
                      onChanged: (val) => setState(() => _isAnonymous = val),
                    ),

                    if (!_isAnonymous) ...[
                      const SizedBox(height: 12),
                      const Text('Full Name', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.secondaryText)),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person_outline_rounded, color: AppColors.secondaryText),
                          hintText: 'Enter your name',
                          contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        validator: (val) {
                          if (!_isAnonymous && (val == null || val.trim().isEmpty)) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 14),
                      const Text('Email Address', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.secondaryText)),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.email_outlined, color: AppColors.secondaryText),
                          hintText: 'Enter your email address',
                          contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        validator: (val) {
                          if (!_isAnonymous && (val == null || !val.contains('@'))) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                    ],

                    const SizedBox(height: 14),
                    const Text('Feedback Subject', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.secondaryText)),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: _subjectController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.title_rounded, color: AppColors.secondaryText),
                        hintText: 'e.g. Science Lab Equipment, Transport Route #4',
                        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      validator: (val) {
                        if (val == null || val.trim().isEmpty) {
                          return 'Please enter a feedback subject';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 14),
                    const Text('Detailed Comments / Suggestions', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.secondaryText)),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: _commentsController,
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: 'Please share your experience, constructive suggestions, or concerns in detail...',
                        contentPadding: const EdgeInsets.all(14),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      validator: (val) {
                        if (val == null || val.trim().length < 10) {
                          return 'Please provide at least 10 characters of feedback';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              CustomButton(
                text: 'Submit Feedback to School',
                icon: Icons.send_rounded,
                isLoading: _isSubmitting,
                onPressed: _submitFeedback,
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  String _getRatingLabel(int rating) {
    switch (rating) {
      case 1:
        return 'Needs Significant Improvement';
      case 2:
        return 'Below Expectations';
      case 3:
        return 'Satisfactory Experience';
      case 4:
        return 'Very Good & Commendable';
      case 5:
        return 'Excellent — True Crawford Quality!';
      default:
        return 'Great';
    }
  }
}
