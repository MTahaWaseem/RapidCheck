//assessmentName, assessmentId, status, totalMarks, obtainedMarks

class AnnouncementModel {

  final String assessmentName;
  final String assessmentId;
  final String status;
  final double  totalMarks;
  final double  obtainedMarks;

  AnnouncementModel({
    this.assessmentName = 'Test_name',
    this.assessmentId = 'Test_ID',
    this.status = 'Active',
    this.totalMarks = 15,
    this.obtainedMarks = 13,

  });

  static AnnouncementModel fromJson(Map<String, dynamic> json) =>

      AnnouncementModel(
        assessmentId: json['assessmentId'],
        assessmentName: json['assessmentName'],
        status: json['status'],
        totalMarks: json['totalMarks'],
        obtainedMarks: json['obtainedMarks'],
      );
}


