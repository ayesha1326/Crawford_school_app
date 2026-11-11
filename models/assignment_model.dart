class AssignmentModel {
  final String id;
  final String title;
  final String subject;
  final String grade;
  final String assignedDate;
  final String dueDate;
  final int totalMarks;
  final String instructions;
  bool isSubmitted;
  String? submissionDate;
  int? obtainedMarks;
  String? feedback;

  AssignmentModel({
    required this.id,
    required this.title,
    required this.subject,
    required this.grade,
    required this.assignedDate,
    required this.dueDate,
    required this.totalMarks,
    required this.instructions,
    this.isSubmitted = false,
    this.submissionDate,
    this.obtainedMarks,
    this.feedback,
  });
}

class ExamResultModel {
  final String examName;
  final String term;
  final String date;
  final String subject;
  final int totalMarks;
  final int obtainedMarks;
  final String grade;
  final String remarks;

  const ExamResultModel({
    required this.examName,
    required this.term,
    required this.date,
    required this.subject,
    required this.totalMarks,
    required this.obtainedMarks,
    required this.grade,
    required this.remarks,
  });

  double get percentage => (obtainedMarks / totalMarks) * 100;
}
