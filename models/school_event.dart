class SchoolEvent {
  final String id;
  final String title;
  final String category;
  final String date;
  final String time;
  final String location;
  final String description;
  final String imageUrl;
  bool isRsvpRegistered;

  SchoolEvent({
    required this.id,
    required this.title,
    required this.category,
    required this.date,
    required this.time,
    required this.location,
    required this.description,
    required this.imageUrl,
    this.isRsvpRegistered = false,
  });
}

class SchoolNotice {
  final String id;
  final String title;
  final String date;
  final String category;
  final String content;
  final String issuedBy;
  final bool isHighPriority;
  bool isRead;

  SchoolNotice({
    required this.id,
    required this.title,
    required this.date,
    required this.category,
    required this.content,
    required this.issuedBy,
    this.isHighPriority = false,
    this.isRead = false,
  });
}
