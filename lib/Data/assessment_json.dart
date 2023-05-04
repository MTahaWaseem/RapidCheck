//assessmentName, assessmentId, status, totalMarks, obtainedMarks

class AssessmentJson {

  final String assessmentName;
  final String assessmentId;
  final String status;
  final double  totalMarks;
  final double  obtainedMarks;

  AssessmentJson({
    required this.assessmentName,
    required this.assessmentId,
    required this.status,
    required this.totalMarks,
    required this.obtainedMarks,
  });

  static AssessmentJson fromJson(Map<String, dynamic> json) =>

      AssessmentJson(
        assessmentId: json['assessmentId'],
        assessmentName: json['assessmentName'],
        status: json['status'],
        totalMarks: json['totalMarks'],
        obtainedMarks: json['obtainedMarks'],
      );
}


