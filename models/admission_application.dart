enum AdmissionStatus { pending, underReview, approved, rejected }

class AdmissionApplication {
  final String applicationNumber;
  final String studentFullName;
  final String dateOfBirth;
  final String gender;
  final String applyingGrade;
  final String fatherName;
  final String guardianContact;
  final String guardianEmail;
  final String address;
  final String previousSchool;
  final String submissionDate;
  AdmissionStatus status;
  String remarks;

  AdmissionApplication({
    required this.applicationNumber,
    required this.studentFullName,
    required this.dateOfBirth,
    required this.gender,
    required this.applyingGrade,
    required this.fatherName,
    required this.guardianContact,
    required this.guardianEmail,
    required this.address,
    required this.previousSchool,
    required this.submissionDate,
    this.status = AdmissionStatus.pending,
    this.remarks = 'Application received and queued for review.',
  });
}

class ChatMessage {
  final String id;
  final String sender;
  final String senderRole;
  final String message;
  final DateTime timestamp;
  final bool isFromCurrentUser;

  ChatMessage({
    required this.id,
    required this.sender,
    required this.senderRole,
    required this.message,
    required this.timestamp,
    required this.isFromCurrentUser,
  });
}

class LibraryBook {
  final String id;
  final String title;
  final String author;
  final String category;
  final String isbn;
  final bool isAvailable;
  final String shelfLocation;
  final String coverPlaceholder;

  const LibraryBook({
    required this.id,
    required this.title,
    required this.author,
    required this.category,
    required this.isbn,
    required this.isAvailable,
    required this.shelfLocation,
    required this.coverPlaceholder,
  });
}
