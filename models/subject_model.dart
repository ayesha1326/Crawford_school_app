class SubjectModel {
  final String id;
  final String name;
  final String code;
  final String teacherName;
  final String room;
  final int creditHours;
  final double currentScore;
  final String description;
  final List<String> chapters;

  const SubjectModel({
    required this.id,
    required this.name,
    required this.code,
    required this.teacherName,
    required this.room,
    required this.creditHours,
    required this.currentScore,
    required this.description,
    required this.chapters,
  });
}
