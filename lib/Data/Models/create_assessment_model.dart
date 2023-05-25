class OneQuestion {
  final String question;
  final String questionType;
  final int totalMarks;
  final List<List<String>> msAnswer;

  OneQuestion({
    required this.question,
    required this.questionType,
    required this.totalMarks,
    required this.msAnswer,
  });

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'questionType': questionType,
      'totalMarks': totalMarks,
      'msAnswer': msAnswer,
    };
  }
}
