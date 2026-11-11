import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../core/colors/app_colors.dart';
import '../../core/constants/asset_paths.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/safe_image.dart';

class BookCampusVisitScreen extends StatefulWidget {
  const BookCampusVisitScreen({super.key});

  @override
  State<BookCampusVisitScreen> createState() => _BookCampusVisitScreenState();
}

class _BookCampusVisitScreenState extends State<BookCampusVisitScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _parentNameController = TextEditingController(text: 'Tariq Ahmed');
  final TextEditingController _phoneController = TextEditingController(text: '+92 300 1234567');
  final TextEditingController _emailController = TextEditingController(text: 'tariq.ahmed@example.com');
  final TextEditingController _notesController = TextEditingController();

  DateTime _selectedDate = DateTime.now().add(const Duration(days: 2));
  String _selectedSlot = '09:30 AM - 10:30 AM (Morning Tour)';
  String _selectedGrade = 'O-Levels (Grade 9-10)';
  int _visitorCount = 2;
  bool _isSubmitting = false;

  final List<String> _gradeOptions = [
    'Playgroup & Nursery',
    'Kindergarten (KG-I & KG-II)',
    'Junior School (Grades 1 to 5)',
    'Middle School (Grades 6 to 8)',
    'O-Levels (Grade 9-10)',
    'Matriculation (Grade 9-10)',
    'A-Levels (Grade 11-12)',
    'Intermediate (FSc / ICS)',
  ];

  final List<String> _timeSlots = [
    '09:30 AM - 10:30 AM (Morning Tour)',
    '11:30 AM - 12:30 PM (Midday Session)',
    '02:30 PM - 03:30 PM (Afternoon Tour)',
  ];

  final List<String> _areasOfInterest = [
    'Robotics & STEM Labs',
    'Science Laboratories',
    'Sports Grounds & Arena',
    'Smart Classrooms',
    'Library & Resource Center',
    'Art & Music Studios',
  ];

  final Set<String> _selectedAreas = {
    'Robotics & STEM Labs',
    'Smart Classrooms',
  };

  @override
  void dispose() {
    _parentNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now().add(const Duration(days: 1)),
      lastDate: DateTime.now().add(const Duration(days: 60)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primaryRed,
              onPrimary: Colors.white,
              onSurface: AppColors.darkNavy,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() => _selectedDate = picked);
    }
  }

  void _submitBooking() {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSubmitting = true);

    Future.delayed(const Duration(milliseconds: 900), () {
      if (!mounted) return;
      setState(() => _isSubmitting = false);

      final passNumber = 'CGS-VISIT-2026-${(2000 + DateTime.now().millisecond * 5) % 8000 + 1000}';
      final formattedDate = DateFormat('EEEE, MMMM d, yyyy').format(_selectedDate);

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (ctx) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
          contentPadding: const EdgeInsets.all(24),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: const BoxDecoration(
                  color: AppColors.successLight,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.confirmation_number_rounded, color: AppColors.successGreen, size: 36),
              ),
              const SizedBox(height: 16),
              const Text(
                'Campus Visit Scheduled!',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkNavy,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'An admissions coordinator has reserved your tour slot.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: AppColors.secondaryText),
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: AppColors.lightGrey,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.borderGrey),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('VISITOR PASS', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: AppColors.secondaryText)),
                        Text(
                          passNumber,
                          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: AppColors.primaryRed),
                        ),
                      ],
                    ),
                    const Divider(height: 16),
                    _passRow('Visitor:', _parentNameController.text),
                    _passRow('Grade:', _selectedGrade),
                    _passRow('Date:', formattedDate),
                    _passRow('Time Slot:', _selectedSlot.split('(').first.trim()),
                    _passRow('Attendees:', '$_visitorCount Person(s)'),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              const Row(
                children: [
                  Icon(Icons.info_outline, size: 14, color: AppColors.secondaryText),
                  SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      'Please present this pass at Gate #1 (Main Reception desk).',
                      style: TextStyle(fontSize: 11, color: AppColors.secondaryText),
                    ),
                  ),
                ],
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
                  child: const Text('Done & Return', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _passRow(String title, String val) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 76,
            child: Text(title, style: const TextStyle(fontSize: 11, color: AppColors.secondaryText, fontWeight: FontWeight.w600)),
          ),
          Expanded(
            child: Text(val, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: AppColors.darkNavy)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Book a Campus Visit'),
        backgroundColor: AppColors.darkNavy,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Campus Image banner
            Stack(
              children: [
                SafeImage(
                  assetPath: AssetPaths.schoolCampus,
                  width: double.infinity,
                  height: 180,
                  label: 'Crawford Grammar School Campus',
                  fallbackIcon: Icons.apartment_rounded,
                ),
                Container(
                  width: double.infinity,
                  height: 180,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withValues(alpha: 0.1),
                        AppColors.darkNavy.withValues(alpha: 0.85),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  right: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.primaryRed,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'CAMPUS EXPERIENCE',
                          style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w800, letterSpacing: 1),
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'Discover Crawford Grammar School',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'Guided tours led by academic counselors for prospective families.',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Visit Date & Slot Card
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.cardWhite,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppColors.borderGrey),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Icon(Icons.calendar_today_rounded, color: AppColors.primaryRed, size: 20),
                              SizedBox(width: 8),
                              Text(
                                'Select Visit Date & Time',
                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.darkNavy),
                              ),
                            ],
                          ),
                          const SizedBox(height: 14),

                          // Date picker tile
                          InkWell(
                            onTap: _selectDate,
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                              decoration: BoxDecoration(
                                color: AppColors.lightGrey,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: AppColors.borderGrey),
                              ),
                              child: Row(
                                children: [
                                  const Icon(Icons.event_available_rounded, color: AppColors.darkNavy),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text('Selected Date', style: TextStyle(fontSize: 11, color: AppColors.secondaryText)),
                                        Text(
                                          DateFormat('EEEE, MMMM d, yyyy').format(_selectedDate),
                                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.darkNavy),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Icon(Icons.arrow_drop_down, color: AppColors.secondaryText),
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(height: 14),
                          const Text('Available Tour Slots:', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.secondaryText)),
                          const SizedBox(height: 8),
                          ..._timeSlots.map((slot) {
                            final isSel = _selectedSlot == slot;
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: InkWell(
                                onTap: () => setState(() => _selectedSlot = slot),
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                                  decoration: BoxDecoration(
                                    color: isSel ? AppColors.accentRedLight : AppColors.lightGrey,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: isSel ? AppColors.primaryRed : AppColors.borderGrey,
                                      width: isSel ? 1.5 : 1.0,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        isSel ? Icons.radio_button_checked : Icons.radio_button_off,
                                        size: 18,
                                        color: isSel ? AppColors.primaryRed : AppColors.secondaryText,
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Text(
                                          slot,
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: isSel ? FontWeight.bold : FontWeight.w500,
                                            color: isSel ? AppColors.primaryRed : AppColors.primaryText,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Visitor Details Card
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.cardWhite,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppColors.borderGrey),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Icon(Icons.person_rounded, color: AppColors.primaryRed, size: 20),
                              SizedBox(width: 8),
                              Text(
                                'Visitor & Student Info',
                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.darkNavy),
                              ),
                            ],
                          ),
                          const SizedBox(height: 14),

                          const Text('Parent / Guardian Name', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.secondaryText)),
                          const SizedBox(height: 6),
                          TextFormField(
                            controller: _parentNameController,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.badge_outlined, color: AppColors.secondaryText),
                              contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                            validator: (val) => (val == null || val.trim().isEmpty) ? 'Please enter guardian name' : null,
                          ),

                          const SizedBox(height: 12),
                          const Text('Mobile / WhatsApp Number', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.secondaryText)),
                          const SizedBox(height: 6),
                          TextFormField(
                            controller: _phoneController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.phone_outlined, color: AppColors.secondaryText),
                              contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                            validator: (val) => (val == null || val.trim().isEmpty) ? 'Please enter contact number' : null,
                          ),

                          const SizedBox(height: 12),
                          const Text('Grade Interested In', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.secondaryText)),
                          const SizedBox(height: 6),
                          DropdownButtonFormField<String>(
                            value: _selectedGrade,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.school_outlined, color: AppColors.secondaryText),
                              contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                            items: _gradeOptions.map((g) => DropdownMenuItem(value: g, child: Text(g, style: const TextStyle(fontSize: 13)))).toList(),
                            onChanged: (val) {
                              if (val != null) setState(() => _selectedGrade = val);
                            },
                          ),

                          const SizedBox(height: 14),
                          const Text('Number of Visitors', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.secondaryText)),
                          const SizedBox(height: 8),
                          Row(
                            children: [1, 2, 3, 4].map((count) {
                              final isSel = _visitorCount == count;
                              return Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 3.0),
                                  child: OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      backgroundColor: isSel ? AppColors.darkNavy : AppColors.lightGrey,
                                      foregroundColor: isSel ? Colors.white : AppColors.primaryText,
                                      side: BorderSide(color: isSel ? AppColors.darkNavy : AppColors.borderGrey),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                    ),
                                    onPressed: () => setState(() => _visitorCount = count),
                                    child: Text('$count ${count == 4 ? '+' : ''}', style: const TextStyle(fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Areas of Interest Card
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.cardWhite,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppColors.borderGrey),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Icon(Icons.explore_outlined, color: AppColors.primaryRed, size: 20),
                              SizedBox(width: 8),
                              Text(
                                'Campus Areas You Want to Tour',
                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.darkNavy),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: _areasOfInterest.map((area) {
                              final isSel = _selectedAreas.contains(area);
                              return FilterChip(
                                label: Text(
                                  area,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: isSel ? Colors.white : AppColors.primaryText,
                                    fontWeight: isSel ? FontWeight.bold : FontWeight.normal,
                                  ),
                                ),
                                selected: isSel,
                                selectedColor: AppColors.primaryRed,
                                backgroundColor: AppColors.lightGrey,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                onSelected: (selected) {
                                  setState(() {
                                    if (selected) {
                                      _selectedAreas.add(area);
                                    } else {
                                      _selectedAreas.remove(area);
                                    }
                                  });
                                },
                              );
                            }).toList(),
                          ),

                          const SizedBox(height: 14),
                          const Text('Questions or Specific Requests (Optional)', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.secondaryText)),
                          const SizedBox(height: 6),
                          TextFormField(
                            controller: _notesController,
                            maxLines: 2,
                            decoration: InputDecoration(
                              hintText: 'e.g. Inquiring about Cambridge scholarships, transport to DHA...',
                              contentPadding: const EdgeInsets.all(12),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    CustomButton(
                      text: 'Confirm Campus Visit Booking',
                      icon: Icons.check_circle_outline_rounded,
                      isLoading: _isSubmitting,
                      onPressed: _submitBooking,
                    ),

                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
