enum AttendanceStatus {
  present,
  absent,
  late,
  leave,
}

class StudentAttendanceItem {
  final String studentId;
  final String studentName;
  final String rollNumber;
  AttendanceStatus status;
  String remarks;

  StudentAttendanceItem({
    required this.studentId,
    required this.studentName,
    required this.rollNumber,
    this.status = AttendanceStatus.present,
    this.remarks = '',
  });
}

class AttendanceDayRecord {
  final DateTime date;
  final AttendanceStatus status;
  final String checkInTime;
  final String checkOutTime;

  AttendanceDayRecord({
    required this.date,
    required this.status,
    required this.checkInTime,
    required this.checkOutTime,
  });
}
