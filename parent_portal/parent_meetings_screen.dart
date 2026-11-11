import 'package:flutter/material.dart';
import '../../core/colors/app_colors.dart';
import '../../widgets/custom_button.dart';

class ParentMeetingsScreen extends StatefulWidget {
  const ParentMeetingsScreen({Key? key}) : super(key: key);

  @override
  State<ParentMeetingsScreen> createState() => _ParentMeetingsScreenState();
}

class _ParentMeetingsScreenState extends State<ParentMeetingsScreen> {
  String _selectedTeacher = 'Prof. Muhammad Usman (Mathematics)';
  String _selectedSlot = '10:00 AM – 10:20 AM';
  final _reasonController = TextEditingController(text: 'Discuss term 1 calculus progress and examination preparation.');

  final List<String> _teachers = [
    'Prof. Muhammad Usman (Mathematics)',
    'Dr. Harris Qureshi (Physics)',
    'Ms. Ayesha Siddiqui (Chemistry)',
    'Mrs. Evelyn Stone (English Literature)',
    'Dr. Katherine Crawford (Principal Consultation)',
  ];

  final List<String> _slots = [
    '09:00 AM – 09:20 AM',
    '10:00 AM – 10:20 AM',
    '11:30 AM – 11:50 AM',
    '01:00 PM – 01:20 PM',
  ];

  void _bookAppointment() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.check_circle_rounded, color: AppColors.successGreen, size: 52),
            const SizedBox(height: 14),
            const Text(
              'Consultation Confirmed!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 8),
            Text(
              'Your meeting request with $_selectedTeacher for $_selectedSlot has been registered with Crawford Academic Secretariat.',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12, color: AppColors.secondaryText),
            ),
            const SizedBox(height: 16),
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
    _reasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Schedule Faculty Meeting'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.darkNavy,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  const Icon(Icons.event_available_rounded, color: AppColors.primaryRed, size: 28),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Parent-Teacher Consultations (PTC)',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 13),
                        ),
                        Text(
                          'Book 20-minute private review sessions with Crawford faculty.',
                          style: TextStyle(color: Colors.white70, fontSize: 11),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            const Text('Select Educator / Faculty Member',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
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
                  value: _selectedTeacher,
                  items: _teachers
                      .map((t) => DropdownMenuItem(value: t, child: Text(t, style: const TextStyle(fontSize: 13))))
                      .toList(),
                  onChanged: (val) => setState(() => _selectedTeacher = val!),
                ),
              ),
            ),
            const SizedBox(height: 18),

            const Text('Available Time Slots (Saturday PTC)',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _slots.map((s) {
                final isSel = _selectedSlot == s;
                return ChoiceChip(
                  label: Text(s, style: TextStyle(fontSize: 11, color: isSel ? Colors.white : Colors.black87)),
                  selected: isSel,
                  selectedColor: AppColors.primaryRed,
                  onSelected: (val) => setState(() => _selectedSlot = s),
                );
              }).toList(),
            ),
            const SizedBox(height: 18),

            const Text('Discussion Agenda / Reason',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
            TextField(
              controller: _reasonController,
              maxLines: 3,
              style: const TextStyle(fontSize: 13),
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.cardWhite,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppColors.borderGrey),
                ),
              ),
            ),
            const SizedBox(height: 24),

            CustomButton(
              text: 'Confirm Appointment',
              icon: Icons.calendar_month_rounded,
              onPressed: _bookAppointment,
              type: ButtonType.primary,
            ),
          ],
        ),
      ),
    );
  }
}
