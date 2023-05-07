//assessmentName, assessmentId, status, totalMarks, obtainedMarks

class AssessmentModel {

  final String assessmentName;
  final String assessmentId;
  final String status;
  final double  totalMarks;
  final double  obtainedMarks;

  AssessmentModel({
    this.assessmentName = 'Quiz 01',
    this.assessmentId = 'Test_ID',
    this.status = 'Active',
    this.totalMarks = 15,
    this.obtainedMarks = 13,
  });

  static AssessmentModel fromJson(Map<String, dynamic> json) =>

      AssessmentModel(
        assessmentId: json['assessmentId'],
        assessmentName: json['assessmentName'],
        status: json['status'],
        totalMarks: json['totalMarks'],
        obtainedMarks: json['obtainedMarks'],
      );
}


