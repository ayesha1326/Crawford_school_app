class TimetablePeriod {
  final int periodNumber;
  final String day;
  final String startTime;
  final String endTime;
  final String subject;
  final String teacher;
  final String room;
  final bool isBreak;

  const TimetablePeriod({
    required this.periodNumber,
    required this.day,
    required this.startTime,
    required this.endTime,
    required this.subject,
    required this.teacher,
    required this.room,
    this.isBreak = false,
  });
}
