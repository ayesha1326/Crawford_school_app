class FeeChallan {
  final String challanNumber;
  final String studentName;
  final String studentId;
  final String grade;
  final String month;
  final String issueDate;
  final String dueDate;
  final double tuitionFee;
  final double examinationFee;
  final double labFee;
  final double libraryFee;
  final double totalAmount;
  bool isPaid;
  String? paidDate;
  String? paymentMethod;
  String? transactionId;

  FeeChallan({
    required this.challanNumber,
    required this.studentName,
    required this.studentId,
    required this.grade,
    required this.month,
    required this.issueDate,
    required this.dueDate,
    required this.tuitionFee,
    required this.examinationFee,
    required this.labFee,
    required this.libraryFee,
    required this.totalAmount,
    this.isPaid = false,
    this.paidDate,
    this.paymentMethod,
    this.transactionId,
  });

  FeeChallan copyWith({
    bool? isPaid,
    String? paidDate,
    String? paymentMethod,
    String? transactionId,
  }) {
    return FeeChallan(
      challanNumber: challanNumber,
      studentName: studentName,
      studentId: studentId,
      grade: grade,
      month: month,
      issueDate: issueDate,
      dueDate: dueDate,
      tuitionFee: tuitionFee,
      examinationFee: examinationFee,
      labFee: labFee,
      libraryFee: libraryFee,
      totalAmount: totalAmount,
      isPaid: isPaid ?? this.isPaid,
      paidDate: paidDate ?? this.paidDate,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      transactionId: transactionId ?? this.transactionId,
    );
  }
}
