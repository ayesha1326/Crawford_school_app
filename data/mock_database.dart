import '../models/portal_role.dart';
import '../models/student_model.dart';
import '../models/subject_model.dart';
import '../models/timetable_period.dart';
import '../models/fee_challan.dart';
import '../models/attendance_record.dart';
import '../models/assignment_model.dart';
import '../models/school_event.dart';
import '../models/admission_application.dart';

/// Comprehensive local in-memory database for Crawford Grammar School
class MockDatabase {
  MockDatabase._();

  // Active Session State
  static PortalRole currentUserRole = PortalRole.student;
  static int selectedChildIndex = 0; // For Parent Portal: 0 = Sarah, 1 = Rayyan

  static String get currentUserName {
    switch (currentUserRole) {
      case PortalRole.student:
        return 'Sarah Ahmed';
      case PortalRole.parent:
        return 'Tariq Ahmed (Parent)';
      case PortalRole.teacher:
        return 'Prof. Muhammad Usman';
      case PortalRole.admin:
        return 'Dr. Katherine Crawford';
    }
  }

  static String get currentUserSubtitle {
    switch (currentUserRole) {
      case PortalRole.student:
        return 'Grade 10-A • Roll No. 24';
      case PortalRole.parent:
        return 'Father of Sarah & Rayyan Ahmed';
      case PortalRole.teacher:
        return 'Senior Physics & Mathematics Faculty';
      case PortalRole.admin:
        return 'Principal & Head of Administration';
    }
  }

  static String getRoleDisplayName(PortalRole role) {
    switch (role) {
      case PortalRole.student:
        return 'Student Portal';
      case PortalRole.parent:
        return 'Parent Portal';
      case PortalRole.teacher:
        return 'Teacher Portal';
      case PortalRole.admin:
        return 'Admin Portal';
    }
  }

  // Children for Parent Portal
  static final List<Student> parentChildren = [
    const Student(
      id: 'CGS-2026-1042',
      rollNumber: '24',
      name: 'Sarah Ahmed',
      grade: 'Grade 10',
      section: 'A',
      photoUrl: 'assets/images/students/student_profile.jpg',
      attendancePercentage: 94.5,
      bloodGroup: 'B+',
      emergencyContact: '+92 300 1234567',
      address: 'House 142, Block 4, Clifton, Karachi',
      parentName: 'Tariq Ahmed',
      parentPhone: '+92 321 9876543',
    ),
    const Student(
      id: 'CGS-2026-0618',
      rollNumber: '09',
      name: 'Rayyan Ahmed',
      grade: 'Grade 6',
      section: 'B',
      photoUrl: 'assets/images/students/student_profile.jpg',
      attendancePercentage: 91.0,
      bloodGroup: 'O+',
      emergencyContact: '+92 300 1234567',
      address: 'House 142, Block 4, Clifton, Karachi',
      parentName: 'Tariq Ahmed',
      parentPhone: '+92 321 9876543',
    ),
  ];

  static Student get activeStudent {
    if (currentUserRole == PortalRole.parent) {
      return parentChildren[selectedChildIndex];
    }
    return parentChildren[0];
  }

  // Subjects for Grade 10
  static final List<SubjectModel> subjects = [
    const SubjectModel(
      id: 'SUB-101',
      name: 'Advanced Mathematics',
      code: 'MTH-10',
      teacherName: 'Prof. Muhammad Usman',
      room: 'Room 204, Science Wing',
      creditHours: 5,
      currentScore: 92.0,
      description: 'Comprehensive study of algebraic structures, geometry, trigonometry, and calculus principles.',
      chapters: [
        'Chapter 1: Quadratic Equations',
        'Chapter 2: Theory of Quadratic Equations',
        'Chapter 3: Variations & Proportions',
        'Chapter 4: Partial Fractions',
        'Chapter 5: Sets and Functions',
        'Chapter 6: Trigonometric Identities',
      ],
    ),
    const SubjectModel(
      id: 'SUB-102',
      name: 'Physics (Theory & Lab)',
      code: 'PHY-10',
      teacherName: 'Dr. Harris Qureshi',
      room: 'Sir Isaac Newton Physics Lab',
      creditHours: 4,
      currentScore: 88.5,
      description: 'Covers physical measurements, optics, electromagnetism, modern atomic physics, and experimental mechanics.',
      chapters: [
        'Chapter 1: Simple Harmonic Motion',
        'Chapter 2: Sound and Wave Motion',
        'Chapter 3: Geometrical Optics',
        'Chapter 4: Electrostatics & Coulomb’s Law',
        'Chapter 5: Current Electricity',
        'Chapter 6: Nuclear Physics',
      ],
    ),
    const SubjectModel(
      id: 'SUB-103',
      name: 'Chemistry',
      code: 'CHM-10',
      teacherName: 'Ms. Ayesha Siddiqui',
      room: 'Marie Curie Chemistry Lab',
      creditHours: 4,
      currentScore: 90.0,
      description: 'Organic chemistry, acids & bases, environmental chemical cycles, and laboratory titration techniques.',
      chapters: [
        'Chapter 1: Chemical Equilibrium',
        'Chapter 2: Acids, Bases and Salts',
        'Chapter 3: Organic Chemistry Fundamentals',
        'Chapter 4: Hydrocarbons',
        'Chapter 5: Biochemistry',
      ],
    ),
    const SubjectModel(
      id: 'SUB-104',
      name: 'English Language & Literature',
      code: 'ENG-10',
      teacherName: 'Mrs. Evelyn Stone',
      room: 'Room 102, Main Block',
      creditHours: 4,
      currentScore: 94.0,
      description: 'Shakespearean drama analysis, rhetorical essay composition, comprehension, and public rhetoric.',
      chapters: [
        'Unit 1: The Art of Critical Reading',
        'Unit 2: Poetry Analysis: Wordsworth & Frost',
        'Unit 3: Persuasive Essay Writing',
        'Unit 4: Advanced Grammar and Syntax',
      ],
    ),
    const SubjectModel(
      id: 'SUB-105',
      name: 'Computer Science',
      code: 'CSC-10',
      teacherName: 'Engr. Bilal Farooq',
      room: 'Alan Turing Computing Lab',
      creditHours: 4,
      currentScore: 96.0,
      description: 'Algorithmic problem solving, Python programming, database schema design, and computer networks.',
      chapters: [
        'Chapter 1: Algorithms & Flowcharts',
        'Chapter 2: Programming Fundamentals in Python',
        'Chapter 3: Loops and Data Structures',
        'Chapter 4: SQL & Relational Databases',
      ],
    ),
    const SubjectModel(
      id: 'SUB-106',
      name: 'Pakistan Studies & Civics',
      code: 'PST-10',
      teacherName: 'Mr. Tariq Mansoor',
      room: 'Room 108, Main Block',
      creditHours: 3,
      currentScore: 89.0,
      description: 'Constitutional evolution, geographical economic zones, and cultural heritage of Pakistan.',
      chapters: [
        'Chapter 1: Historical Genesis 1857-1947',
        'Chapter 2: Constitutional Development',
        'Chapter 3: Topography & Climate Resources',
        'Chapter 4: Foreign Policy & Economy',
      ],
    ),
  ];

  // Weekly Timetable (Monday to Saturday)
  static final Map<String, List<TimetablePeriod>> weeklyTimetable = {
    'Monday': [
      const TimetablePeriod(periodNumber: 1, day: 'Monday', startTime: '08:00 AM', endTime: '08:45 AM', subject: 'Advanced Mathematics', teacher: 'Prof. Muhammad Usman', room: 'Room 204'),
      const TimetablePeriod(periodNumber: 2, day: 'Monday', startTime: '08:50 AM', endTime: '09:35 AM', subject: 'Physics Theory', teacher: 'Dr. Harris Qureshi', room: 'Physics Lab'),
      const TimetablePeriod(periodNumber: 3, day: 'Monday', startTime: '09:40 AM', endTime: '10:25 AM', subject: 'Chemistry', teacher: 'Ms. Ayesha Siddiqui', room: 'Chemistry Lab'),
      const TimetablePeriod(periodNumber: 4, day: 'Monday', startTime: '10:25 AM', endTime: '10:55 AM', subject: 'Morning Recess / Break', teacher: 'Campus Grounds', room: 'Cafeteria', isBreak: true),
      const TimetablePeriod(periodNumber: 5, day: 'Monday', startTime: '11:00 AM', endTime: '11:45 AM', subject: 'English Literature', teacher: 'Mrs. Evelyn Stone', room: 'Room 102'),
      const TimetablePeriod(periodNumber: 6, day: 'Monday', startTime: '11:50 AM', endTime: '12:35 PM', subject: 'Computer Science Lab', teacher: 'Engr. Bilal Farooq', room: 'Computing Lab'),
      const TimetablePeriod(periodNumber: 7, day: 'Monday', startTime: '12:40 PM', endTime: '01:25 PM', subject: 'Pakistan Studies', teacher: 'Mr. Tariq Mansoor', room: 'Room 108'),
    ],
    'Tuesday': [
      const TimetablePeriod(periodNumber: 1, day: 'Tuesday', startTime: '08:00 AM', endTime: '08:45 AM', subject: 'Physics Lab Practical', teacher: 'Dr. Harris Qureshi', room: 'Physics Lab'),
      const TimetablePeriod(periodNumber: 2, day: 'Tuesday', startTime: '08:50 AM', endTime: '09:35 AM', subject: 'Physics Lab Practical', teacher: 'Dr. Harris Qureshi', room: 'Physics Lab'),
      const TimetablePeriod(periodNumber: 3, day: 'Tuesday', startTime: '09:40 AM', endTime: '10:25 AM', subject: 'Advanced Mathematics', teacher: 'Prof. Muhammad Usman', room: 'Room 204'),
      const TimetablePeriod(periodNumber: 4, day: 'Tuesday', startTime: '10:25 AM', endTime: '10:55 AM', subject: 'Morning Recess / Break', teacher: 'Campus Grounds', room: 'Cafeteria', isBreak: true),
      const TimetablePeriod(periodNumber: 5, day: 'Tuesday', startTime: '11:00 AM', endTime: '11:45 AM', subject: 'Computer Programming', teacher: 'Engr. Bilal Farooq', room: 'Computing Lab'),
      const TimetablePeriod(periodNumber: 6, day: 'Tuesday', startTime: '11:50 AM', endTime: '12:35 PM', subject: 'English Language', teacher: 'Mrs. Evelyn Stone', room: 'Room 102'),
      const TimetablePeriod(periodNumber: 7, day: 'Tuesday', startTime: '12:40 PM', endTime: '01:25 PM', subject: 'Physical Education / Sports', teacher: 'Coach Zeeshan', room: 'Sports Complex'),
    ],
    'Wednesday': [
      const TimetablePeriod(periodNumber: 1, day: 'Wednesday', startTime: '08:00 AM', endTime: '08:45 AM', subject: 'Chemistry Lab', teacher: 'Ms. Ayesha Siddiqui', room: 'Chemistry Lab'),
      const TimetablePeriod(periodNumber: 2, day: 'Wednesday', startTime: '08:50 AM', endTime: '09:35 AM', subject: 'Chemistry Lab', teacher: 'Ms. Ayesha Siddiqui', room: 'Chemistry Lab'),
      const TimetablePeriod(periodNumber: 3, day: 'Wednesday', startTime: '09:40 AM', endTime: '10:25 AM', subject: 'Advanced Mathematics', teacher: 'Prof. Muhammad Usman', room: 'Room 204'),
      const TimetablePeriod(periodNumber: 4, day: 'Wednesday', startTime: '10:25 AM', endTime: '10:55 AM', subject: 'Morning Recess / Break', teacher: 'Campus Grounds', room: 'Cafeteria', isBreak: true),
      const TimetablePeriod(periodNumber: 5, day: 'Wednesday', startTime: '11:00 AM', endTime: '11:45 AM', subject: 'Pakistan Studies', teacher: 'Mr. Tariq Mansoor', room: 'Room 108'),
      const TimetablePeriod(periodNumber: 6, day: 'Wednesday', startTime: '11:50 AM', endTime: '12:35 PM', subject: 'English Essay Writing', teacher: 'Mrs. Evelyn Stone', room: 'Room 102'),
      const TimetablePeriod(periodNumber: 7, day: 'Wednesday', startTime: '12:40 PM', endTime: '01:25 PM', subject: 'Library & Research Period', teacher: 'Mr. Imran (Librarian)', room: 'Central Library'),
    ],
    'Thursday': [
      const TimetablePeriod(periodNumber: 1, day: 'Thursday', startTime: '08:00 AM', endTime: '08:45 AM', subject: 'Advanced Mathematics', teacher: 'Prof. Muhammad Usman', room: 'Room 204'),
      const TimetablePeriod(periodNumber: 2, day: 'Thursday', startTime: '08:50 AM', endTime: '09:35 AM', subject: 'Physics Theory', teacher: 'Dr. Harris Qureshi', room: 'Room 204'),
      const TimetablePeriod(periodNumber: 3, day: 'Thursday', startTime: '09:40 AM', endTime: '10:25 AM', subject: 'Computer Science', teacher: 'Engr. Bilal Farooq', room: 'Computing Lab'),
      const TimetablePeriod(periodNumber: 4, day: 'Thursday', startTime: '10:25 AM', endTime: '10:55 AM', subject: 'Morning Recess / Break', teacher: 'Campus Grounds', room: 'Cafeteria', isBreak: true),
      const TimetablePeriod(periodNumber: 5, day: 'Thursday', startTime: '11:00 AM', endTime: '11:45 AM', subject: 'Chemistry Theory', teacher: 'Ms. Ayesha Siddiqui', room: 'Room 204'),
      const TimetablePeriod(periodNumber: 6, day: 'Thursday', startTime: '11:50 AM', endTime: '12:35 PM', subject: 'English Literature', teacher: 'Mrs. Evelyn Stone', room: 'Room 102'),
      const TimetablePeriod(periodNumber: 7, day: 'Thursday', startTime: '12:40 PM', endTime: '01:25 PM', subject: 'Art & Design Workshop', teacher: 'Ms. Saima Noor', room: 'Studio 3'),
    ],
    'Friday': [
      const TimetablePeriod(periodNumber: 1, day: 'Friday', startTime: '08:00 AM', endTime: '08:45 AM', subject: 'Islamic Studies / Ethics', teacher: 'Qari Abdul Rehman', room: 'Room 104'),
      const TimetablePeriod(periodNumber: 2, day: 'Friday', startTime: '08:50 AM', endTime: '09:35 AM', subject: 'Advanced Mathematics', teacher: 'Prof. Muhammad Usman', room: 'Room 204'),
      const TimetablePeriod(periodNumber: 3, day: 'Friday', startTime: '09:40 AM', endTime: '10:25 AM', subject: 'Physics Seminar', teacher: 'Dr. Harris Qureshi', room: 'Auditorium'),
      const TimetablePeriod(periodNumber: 4, day: 'Friday', startTime: '10:25 AM', endTime: '10:55 AM', subject: 'Morning Recess / Break', teacher: 'Campus Grounds', room: 'Cafeteria', isBreak: true),
      const TimetablePeriod(periodNumber: 5, day: 'Friday', startTime: '11:00 AM', endTime: '11:45 AM', subject: 'Computer Project Lab', teacher: 'Engr. Bilal Farooq', room: 'Computing Lab'),
      const TimetablePeriod(periodNumber: 6, day: 'Friday', startTime: '11:50 AM', endTime: '12:30 PM', subject: 'Jummah Assembly & Dismissal', teacher: 'School Faculty', room: 'Auditorium'),
    ],
    'Saturday': [
      const TimetablePeriod(periodNumber: 1, day: 'Saturday', startTime: '08:30 AM', endTime: '09:30 AM', subject: 'Robotics & STEM Club', teacher: 'Engr. Bilal Farooq', room: 'STEM Center'),
      const TimetablePeriod(periodNumber: 2, day: 'Saturday', startTime: '09:35 AM', endTime: '10:35 AM', subject: 'Debate & Public Speaking', teacher: 'Mrs. Evelyn Stone', room: 'Auditorium'),
      const TimetablePeriod(periodNumber: 3, day: 'Saturday', startTime: '10:40 AM', endTime: '11:40 AM', subject: 'Inter-House Sports Practice', teacher: 'Coach Zeeshan', room: 'Sports Complex'),
    ],
  };

  // Fee Challans (PKR)
  static final List<FeeChallan> feeChallans = [
    FeeChallan(
      challanNumber: 'CGS-FEE-2026-1104',
      studentName: 'Sarah Ahmed',
      studentId: 'CGS-2026-1042',
      grade: 'Grade 10-A',
      month: 'November 2026',
      issueDate: '01 Nov 2026',
      dueDate: '15 Nov 2026',
      tuitionFee: 14500.0,
      examinationFee: 1500.0,
      labFee: 1500.0,
      libraryFee: 1000.0,
      totalAmount: 18500.0,
      isPaid: false,
    ),
    FeeChallan(
      challanNumber: 'CGS-FEE-2026-1004',
      studentName: 'Sarah Ahmed',
      studentId: 'CGS-2026-1042',
      grade: 'Grade 10-A',
      month: 'October 2026',
      issueDate: '01 Oct 2026',
      dueDate: '15 Oct 2026',
      tuitionFee: 14500.0,
      examinationFee: 0.0,
      labFee: 1500.0,
      libraryFee: 1000.0,
      totalAmount: 17000.0,
      isPaid: true,
      paidDate: '08 Oct 2026',
      paymentMethod: 'Bank Alfalah Online Transfer',
      transactionId: 'TXN-98432104',
    ),
    FeeChallan(
      challanNumber: 'CGS-FEE-2026-0904',
      studentName: 'Sarah Ahmed',
      studentId: 'CGS-2026-1042',
      grade: 'Grade 10-A',
      month: 'September 2026',
      issueDate: '01 Sep 2026',
      dueDate: '15 Sep 2026',
      tuitionFee: 14500.0,
      examinationFee: 0.0,
      labFee: 1500.0,
      libraryFee: 1000.0,
      totalAmount: 17000.0,
      isPaid: true,
      paidDate: '05 Sep 2026',
      paymentMethod: 'JazzCash Digital Wallet',
      transactionId: 'TXN-87239401',
    ),
  ];

  // Interactive Live Attendance Roster for Grade 10-A (Used by Teachers)
  static final List<StudentAttendanceItem> grade10AttendanceList = [
    StudentAttendanceItem(studentId: 'CGS-1001', studentName: 'Abdul Rafay', rollNumber: '01', status: AttendanceStatus.present),
    StudentAttendanceItem(studentId: 'CGS-1002', studentName: 'Aiman Khan', rollNumber: '02', status: AttendanceStatus.present),
    StudentAttendanceItem(studentId: 'CGS-1003', studentName: 'Ali Zain', rollNumber: '03', status: AttendanceStatus.late, remarks: 'Arrived 10 mins late due to van delay'),
    StudentAttendanceItem(studentId: 'CGS-1004', studentName: 'Bilal Mustafa', rollNumber: '04', status: AttendanceStatus.present),
    StudentAttendanceItem(studentId: 'CGS-1005', studentName: 'Dua Fatima', rollNumber: '05', status: AttendanceStatus.present),
    StudentAttendanceItem(studentId: 'CGS-1006', studentName: 'Hamza Sohail', rollNumber: '06', status: AttendanceStatus.absent, remarks: 'Medical leave submitted'),
    StudentAttendanceItem(studentId: 'CGS-1007', studentName: 'Hania Amir', rollNumber: '07', status: AttendanceStatus.present),
    StudentAttendanceItem(studentId: 'CGS-1008', studentName: 'Ibrahim Qureshi', rollNumber: '08', status: AttendanceStatus.present),
    StudentAttendanceItem(studentId: 'CGS-1009', studentName: 'Maham Noor', rollNumber: '09', status: AttendanceStatus.present),
    StudentAttendanceItem(studentId: 'CGS-1024', studentName: 'Sarah Ahmed', rollNumber: '24', status: AttendanceStatus.present),
    StudentAttendanceItem(studentId: 'CGS-1025', studentName: 'Shahzain Raza', rollNumber: '25', status: AttendanceStatus.present),
    StudentAttendanceItem(studentId: 'CGS-1026', studentName: 'Zoya Siddiqui', rollNumber: '26', status: AttendanceStatus.present),
  ];

  // Assignments
  static final List<AssignmentModel> assignments = [
    AssignmentModel(
      id: 'ASN-201',
      title: 'Quadratic Curves & Parabolic Modeling',
      subject: 'Advanced Mathematics',
      grade: 'Grade 10-A',
      assignedDate: '08 Nov 2026',
      dueDate: '16 Nov 2026',
      totalMarks: 25,
      instructions: 'Solve Exercises 3.4 to 3.8. Plot the quadratic trajectories with vertex coordinates and roots marked clearly.',
      isSubmitted: false,
    ),
    AssignmentModel(
      id: 'ASN-202',
      title: 'Geometrical Optics Ray Diagrams',
      subject: 'Physics',
      grade: 'Grade 10-A',
      assignedDate: '04 Nov 2026',
      dueDate: '12 Nov 2026',
      totalMarks: 20,
      instructions: 'Construct ray diagrams for convex and concave lenses at five discrete object positions. Include focal calculation.',
      isSubmitted: true,
      submissionDate: '10 Nov 2026',
      obtainedMarks: 19,
      feedback: 'Excellent precision in ray trace angles. Neat presentation.',
    ),
    AssignmentModel(
      id: 'ASN-203',
      title: 'Python Sorting Algorithms Implementation',
      subject: 'Computer Science',
      grade: 'Grade 10-A',
      assignedDate: '01 Nov 2026',
      dueDate: '08 Nov 2026',
      totalMarks: 30,
      instructions: 'Write modular Python scripts implementing Bubble Sort and Merge Sort. Measure execution time with 1,000 randomized integers.',
      isSubmitted: true,
      submissionDate: '06 Nov 2026',
      obtainedMarks: 30,
      feedback: 'Flawless code structure and detailed complexity analysis.',
    ),
  ];

  // Exam Results
  static final List<ExamResultModel> examResults = [
    const ExamResultModel(examName: 'Mid-Term Examinations 2026', term: 'Term 1', date: 'October 2026', subject: 'Advanced Mathematics', totalMarks: 100, obtainedMarks: 94, grade: 'A*', remarks: 'Exceptional algebraic logic and speed.'),
    const ExamResultModel(examName: 'Mid-Term Examinations 2026', term: 'Term 1', date: 'October 2026', subject: 'Physics', totalMarks: 100, obtainedMarks: 89, grade: 'A', remarks: 'Strong theoretical grasp; high marks in numericals.'),
    const ExamResultModel(examName: 'Mid-Term Examinations 2026', term: 'Term 1', date: 'October 2026', subject: 'Chemistry', totalMarks: 100, obtainedMarks: 91, grade: 'A*', remarks: 'Accurate reaction mechanisms and neat lab reports.'),
    const ExamResultModel(examName: 'Mid-Term Examinations 2026', term: 'Term 1', date: 'October 2026', subject: 'English Language', totalMarks: 100, obtainedMarks: 95, grade: 'A*', remarks: 'Superb vocabulary, tone control, and literary flair.'),
    const ExamResultModel(examName: 'Mid-Term Examinations 2026', term: 'Term 1', date: 'October 2026', subject: 'Computer Science', totalMarks: 100, obtainedMarks: 98, grade: 'A*', remarks: 'Highest score in grade; brilliant programming skills.'),
    const ExamResultModel(examName: 'Mid-Term Examinations 2026', term: 'Term 1', date: 'October 2026', subject: 'Pakistan Studies', totalMarks: 100, obtainedMarks: 88, grade: 'A', remarks: 'Good analytical arguments on historical events.'),
  ];

  // School Events
  static final List<SchoolEvent> events = [
    SchoolEvent(
      id: 'EVT-101',
      title: 'Annual Crawford Science & STEM Olympiad 2026',
      category: 'Academic Exhibition',
      date: '20 Nov 2026',
      time: '09:00 AM – 03:00 PM',
      location: 'Crawford Main Sports Complex & Science Wing',
      description: 'Showcasing over 120 student robotics prototypes, chemistry spectacles, environmental innovations, and interactive coding demonstrations.',
      imageUrl: 'assets/images/events/science_fair.jpg',
      isRsvpRegistered: true,
    ),
    SchoolEvent(
      id: 'EVT-102',
      title: 'Crawford Annual Inter-House Athletics Meet',
      category: 'Sports & Athletics',
      date: '28 Nov 2026',
      time: '08:30 AM – 04:00 PM',
      location: 'School Athletic Stadium',
      description: 'Track and field championships, relay races, high jump, javelin, and tug-of-war between Red, Green, Blue, and Gold houses.',
      imageUrl: 'assets/images/events/sports_day.jpg',
      isRsvpRegistered: false,
    ),
    SchoolEvent(
      id: 'EVT-103',
      title: 'Parent-Teacher Consultative Conference (PTC)',
      category: 'Academic Review',
      date: '05 Dec 2026',
      time: '09:00 AM – 02:00 PM',
      location: 'Auditorium & Classrooms',
      description: 'One-on-one personalized consultations between parents and subject educators to review mid-term performance cards.',
      imageUrl: 'assets/images/events/art_fair.jpg',
      isRsvpRegistered: true,
    ),
    SchoolEvent(
      id: 'EVT-104',
      title: 'Class of 2026 Graduation & Honors Convocation',
      category: 'Ceremony',
      date: '18 Dec 2026',
      time: '04:00 PM – 07:30 PM',
      location: 'Grand Auditorium',
      description: 'Celebrating high-achieving Crawford graduates, presentation of valedictorian medals, and inspiring addresses by distinguished alumni.',
      imageUrl: 'assets/images/events/graduation.jpg',
      isRsvpRegistered: false,
    ),
  ];

  // School Notices
  static final List<SchoolNotice> notices = [
    SchoolNotice(
      id: 'NOT-301',
      title: 'Admissions Open for Academic Session 2026-27',
      date: '10 Nov 2026',
      category: 'Admissions',
      content: 'Crawford Grammar School invites applications from Nursery to Grade 11. Early bird admissions assessment test dates and fee concessions are now published on the school portal.',
      issuedBy: 'Office of the Registrar',
      isHighPriority: true,
      isRead: false,
    ),
    SchoolNotice(
      id: 'NOT-302',
      title: 'Winter Uniform Mandatory Guidelines from 15th Nov',
      date: '08 Nov 2026',
      category: 'General',
      content: 'All students must adhere to the official Crawford Grammar winter uniform (Navy blazer with embroidered school crest, Crawford red necktie, and charcoal trousers).',
      issuedBy: 'Discipline Committee',
      isHighPriority: false,
      isRead: true,
    ),
    SchoolNotice(
      id: 'NOT-303',
      title: 'November 2026 Monthly Tuition Fee Challan Generated',
      date: '01 Nov 2026',
      category: 'Accounts',
      content: 'Monthly fee vouchers for November 2026 have been generated. Due date for penalty-free payment is 15th November. Online payment demo is active in the fee module.',
      issuedBy: 'Accounts Department',
      isHighPriority: true,
      isRead: false,
    ),
    SchoolNotice(
      id: 'NOT-304',
      title: 'Crawford STEM Club Robotics Team Secures 1st Prize',
      date: '28 Oct 2026',
      category: 'Achievements',
      content: 'Congratulations to our Grade 10 robotics contingent for securing the National Championship trophy at the All-Pakistan STEM Summit in Islamabad!',
      issuedBy: 'Principal Dr. Katherine Crawford',
      isHighPriority: false,
      isRead: true,
    ),
  ];

  // Admission Applications
  static final List<AdmissionApplication> admissionApplications = [
    AdmissionApplication(
      applicationNumber: 'CGS-ADM-2026-8941',
      studentFullName: 'Zubair Farhan',
      dateOfBirth: '14 May 2011',
      gender: 'Male',
      applyingGrade: 'Grade 9',
      fatherName: 'Farhan Ali',
      guardianContact: '+92 312 3456789',
      guardianEmail: 'farhan.ali@gmail.com',
      address: 'Plot 88, Phase 6, DHA, Karachi',
      previousSchool: 'Beaconhouse School System',
      submissionDate: '09 Nov 2026',
      status: AdmissionStatus.pending,
      remarks: 'Application under administrative review.',
    ),
    AdmissionApplication(
      applicationNumber: 'CGS-ADM-2026-8872',
      studentFullName: 'Mahnoor Tariq',
      dateOfBirth: '22 Aug 2014',
      gender: 'Female',
      applyingGrade: 'Grade 6',
      fatherName: 'Tariq Mehmood',
      guardianContact: '+92 333 9871234',
      guardianEmail: 'tariq.mehmood@outlook.com',
      address: 'B-12, Gulshan-e-Iqbal, Karachi',
      previousSchool: 'The City School',
      submissionDate: '06 Nov 2026',
      status: AdmissionStatus.approved,
      remarks: 'Selected for interview and diagnostic assessment. Welcome letter dispatched.',
    ),
    AdmissionApplication(
      applicationNumber: 'CGS-ADM-2026-8715',
      studentFullName: 'Kashan Raza',
      dateOfBirth: '10 Jan 2017',
      gender: 'Male',
      applyingGrade: 'Grade 3',
      fatherName: 'Raza Haider',
      guardianContact: '+92 301 5554321',
      guardianEmail: 'raza.haider@live.com',
      address: 'Street 4, PECHS Block 2, Karachi',
      previousSchool: 'Karachi Grammar School',
      submissionDate: '02 Nov 2026',
      status: AdmissionStatus.underReview,
      remarks: 'Academic records verified; awaiting birth registration certificate.',
    ),
  ];

  // In-Memory Live Chat Messages
  static final List<ChatMessage> liveChatMessages = [
    ChatMessage(
      id: 'MSG-01',
      sender: 'Prof. Muhammad Usman',
      senderRole: 'Senior Teacher',
      message: 'Good morning Sarah! Remember to bring your geometry kit and lab workbook for Tuesday’s physics ray diagram experiment.',
      timestamp: DateTime.now().subtract(const Duration(hours: 4)),
      isFromCurrentUser: false,
    ),
    ChatMessage(
      id: 'MSG-02',
      sender: 'Sarah Ahmed',
      senderRole: 'Student',
      message: 'Good morning Sir! Yes, I have completed the exercise and packed the ray tracing prisms.',
      timestamp: DateTime.now().subtract(const Duration(hours: 3)),
      isFromCurrentUser: true,
    ),
    ChatMessage(
      id: 'MSG-03',
      sender: 'Prof. Muhammad Usman',
      senderRole: 'Senior Teacher',
      message: 'Splendid work. We will also preview the quadratic variations unit before lunch.',
      timestamp: DateTime.now().subtract(const Duration(hours: 2)),
      isFromCurrentUser: false,
    ),
  ];

  // Digital Library Catalog
  static final List<LibraryBook> libraryBooks = [
    const LibraryBook(
      id: 'BK-101',
      title: 'Halliday & Resnick Fundamentals of Physics (Extended)',
      author: 'David Halliday, Robert Resnick, Jearl Walker',
      category: 'Science & Physics',
      isbn: '978-1118230725',
      isAvailable: true,
      shelfLocation: 'Aisle 3 • Shelf B',
      coverPlaceholder: 'Physics',
    ),
    const LibraryBook(
      id: 'BK-102',
      title: 'Thomas’ Calculus: Early Transcendentals (14th Ed)',
      author: 'George B. Thomas, Maurice D. Weir',
      category: 'Mathematics',
      isbn: '978-0134438986',
      isAvailable: false,
      shelfLocation: 'Aisle 2 • Shelf D',
      coverPlaceholder: 'Calculus',
    ),
    const LibraryBook(
      id: 'BK-103',
      title: 'To Kill a Mockingbird (Critical Edition)',
      author: 'Harper Lee',
      category: 'English Literature',
      isbn: '978-0060935467',
      isAvailable: true,
      shelfLocation: 'Aisle 1 • Shelf A',
      coverPlaceholder: 'Literature',
    ),
    const LibraryBook(
      id: 'BK-104',
      title: 'Introduction to Algorithms (CLRS 4th Edition)',
      author: 'Thomas H. Cormen, Charles E. Leiserson',
      category: 'Computer Science',
      isbn: '978-0262046305',
      isAvailable: true,
      shelfLocation: 'Aisle 4 • Shelf C',
      coverPlaceholder: 'Algorithms',
    ),
    const LibraryBook(
      id: 'BK-105',
      title: 'Organic Chemistry: Structure and Function',
      author: 'K. Peter C. Vollhardt, Neil E. Schore',
      category: 'Chemistry',
      isbn: '978-1319079451',
      isAvailable: true,
      shelfLocation: 'Aisle 3 • Shelf A',
      coverPlaceholder: 'Chemistry',
    ),
    const LibraryBook(
      id: 'BK-106',
      title: 'The Struggle for Pakistan: A Muslim Homeland',
      author: 'Ayesha Jalal',
      category: 'Pakistan Studies',
      isbn: '978-0674052895',
      isAvailable: true,
      shelfLocation: 'Aisle 5 • Shelf E',
      coverPlaceholder: 'History',
    ),
  ];

  // Helper Methods for State Modifications
  static void markChallanAsPaid(String challanNumber, String method) {
    for (var challan in feeChallans) {
      if (challan.challanNumber == challanNumber) {
        challan.isPaid = true;
        challan.paidDate = 'Today, 11 Nov 2026';
        challan.paymentMethod = method;
        challan.transactionId = 'TXN-${DateTime.now().millisecondsSinceEpoch.toString().substring(5)}';
        break;
      }
    }
  }

  static void addAdmissionApplication(AdmissionApplication application) {
    admissionApplications.insert(0, application);
  }

  static void updateAdmissionStatus(String appNumber, AdmissionStatus newStatus, String remarks) {
    for (var app in admissionApplications) {
      if (app.applicationNumber == appNumber) {
        app.status = newStatus;
        app.remarks = remarks;
        break;
      }
    }
  }

  static void sendChatMessage(String message) {
    final newMsg = ChatMessage(
      id: 'MSG-${DateTime.now().millisecondsSinceEpoch}',
      sender: currentUserName,
      senderRole: getRoleDisplayName(currentUserRole),
      message: message,
      timestamp: DateTime.now(),
      isFromCurrentUser: true,
    );
    liveChatMessages.add(newMsg);

    // Auto reply simulation after delay
    Future.delayed(const Duration(milliseconds: 900), () {
      final replyMsg = ChatMessage(
        id: 'MSG-${DateTime.now().millisecondsSinceEpoch + 1}',
        sender: 'Crawford Academic Support',
        senderRole: 'Coordinator',
        message: 'Thank you for your inquiry. Your message has been received by the Crawford faculty desk. An educator will follow up shortly.',
        timestamp: DateTime.now(),
        isFromCurrentUser: false,
      );
      liveChatMessages.add(replyMsg);
    });
  }

  static void toggleNoticeRead(String id) {
    for (var notice in notices) {
      if (notice.id == id) {
        notice.isRead = !notice.isRead;
        break;
      }
    }
  }

  static void markAllNoticesAsRead() {
    for (var notice in notices) {
      notice.isRead = true;
    }
  }

  static int get unreadNoticeCount => notices.where((n) => !n.isRead).length;
}
