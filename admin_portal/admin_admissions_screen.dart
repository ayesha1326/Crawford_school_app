import 'package:flutter/material.dart';
import '../../core/colors/app_colors.dart';
import '../../data/mock_database.dart';
import '../../models/admission_application.dart';

class AdminAdmissionsScreen extends StatefulWidget {
  const AdminAdmissionsScreen({Key? key}) : super(key: key);

  @override
  State<AdminAdmissionsScreen> createState() => _AdminAdmissionsScreenState();
}

class _AdminAdmissionsScreenState extends State<AdminAdmissionsScreen> {
  void _updateStatus(AdmissionApplication app, AdmissionStatus status) {
    setState(() {
      app.status = status;
      app.remarks = status == AdmissionStatus.approved
          ? 'Approved by Principal Dr. Katherine Crawford. Admission test date assigned.'
          : 'Application did not meet grade eligibility criteria.';
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Application ${app.applicationNumber} status set to ${status.name.toUpperCase()}'),
        backgroundColor: status == AdmissionStatus.approved ? AppColors.successGreen : AppColors.primaryRed,
      ),
    );
  }

  void _showApplicationDetails(AdmissionApplication app) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (ctx) => Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      app.studentFullName,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                    ),
                    Text(
                      'App No: ${app.applicationNumber}',
                      style: const TextStyle(fontSize: 12, color: AppColors.secondaryText),
                    ),
                  ],
                ),
                IconButton(icon: const Icon(Icons.close), onPressed: () => Navigator.pop(ctx)),
              ],
            ),
            const Divider(height: 20),
            _buildDetailRow('Applying For', app.applyingGrade),
            _buildDetailRow('Date of Birth', app.dateOfBirth),
            _buildDetailRow('Gender', app.gender),
            _buildDetailRow('Father / Guardian', app.fatherName),
            _buildDetailRow('Emergency Contact', app.guardianContact),
            _buildDetailRow('Guardian Email', app.guardianEmail),
            _buildDetailRow('Previous School', app.previousSchool),
            _buildDetailRow('Residential Address', app.address),
            _buildDetailRow('Submitted On', app.submissionDate),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.lightGrey,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Secretariat Note: ${app.remarks}',
                style: const TextStyle(fontSize: 11, fontStyle: FontStyle.italic),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.successGreen,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    onPressed: () {
                      Navigator.pop(ctx);
                      _updateStatus(app, AdmissionStatus.approved);
                    },
                    child: const Text('Approve (Demo)', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryRed,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    onPressed: () {
                      Navigator.pop(ctx);
                      _updateStatus(app, AdmissionStatus.rejected);
                    },
                    child: const Text('Reject (Demo)', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          SizedBox(
            width: 130,
            child: Text(label, style: const TextStyle(fontSize: 12, color: AppColors.secondaryText)),
          ),
          Expanded(
            child: Text(value, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final applications = MockDatabase.admissionApplications;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Admission Decisions'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: applications.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final app = applications[index];
          return InkWell(
            onTap: () => _showApplicationDetails(app),
            borderRadius: BorderRadius.circular(16),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.cardWhite,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.borderGrey),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        app.applicationNumber,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                          color: AppColors.primaryRed,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: app.status == AdmissionStatus.approved
                              ? AppColors.successLight
                              : app.status == AdmissionStatus.rejected
                                  ? AppColors.accentRedLight
                                  : AppColors.warningLight,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          app.status.name.toUpperCase(),
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                            color: app.status == AdmissionStatus.approved
                                ? AppColors.successGreen
                                : app.status == AdmissionStatus.rejected
                                    ? AppColors.primaryRed
                                    : AppColors.warningAmber,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    app.studentFullName,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Applying for ${app.applyingGrade} • Father: ${app.fatherName}',
                    style: const TextStyle(fontSize: 12, color: AppColors.secondaryText),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Contact: ${app.guardianContact} • Prev: ${app.previousSchool}',
                    style: const TextStyle(fontSize: 11, color: AppColors.secondaryText),
                  ),
                  const Divider(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Submitted: 09 Nov 2026', style: TextStyle(fontSize: 11, color: AppColors.secondaryText)),
                      Row(
                        children: [
                          Text(
                            'Review File',
                            style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: AppColors.primaryRed),
                          ),
                          SizedBox(width: 4),
                          Icon(Icons.arrow_forward_ios_rounded, size: 10, color: AppColors.primaryRed),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
