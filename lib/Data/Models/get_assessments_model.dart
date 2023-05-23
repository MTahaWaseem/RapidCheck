class GetAssessModel {
  bool? success;
  int? totalObtainedMarks;
  int? totalAvailableMarks;
  List<Assessments>? assessments;
  int? count;

  GetAssessModel(
      {this.success,
        this.totalObtainedMarks,
        this.totalAvailableMarks,
        this.assessments,
        this.count});

  GetAssessModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    totalObtainedMarks = json['totalObtainedMarks'];
    totalAvailableMarks = json['totalAvailableMarks'];
    if (json['assessments'] != null) {
      assessments = <Assessments>[];
      json['assessments'].forEach((v) {
        assessments!.add(new Assessments.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['totalObtainedMarks'] = this.totalObtainedMarks;
    data['totalAvailableMarks'] = this.totalAvailableMarks;
    if (this.assessments != null) {
      data['assessments'] = this.assessments!.map((v) => v.toJson()).toList();
    }
    data['count'] = this.count;
    return data;
  }
}

class Assessments {

  String? sId;
  ClassId? classId;
  String? assessmentName;
  String? openDate;
  String? dueDate;
  String? description;
  int? duration;
  int? totalMarks;
  String? createdAt;
  int? obtainedMarks;
  String? status;

  Assessments(
      {this.sId,
        this.classId,
        this.assessmentName,
        this.openDate,
        this.dueDate,
        this.description,
        this.duration,
        this.totalMarks,
        this.createdAt,
        this.obtainedMarks,
        this.status});

  Assessments.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    classId =
    json['classId'] != null ? new ClassId.fromJson(json['classId']) : null;
    assessmentName = json['assessmentName'];
    openDate = json['openDate'];
    dueDate = json['dueDate'];
    description = json['description'];
    duration = json['duration'];
    totalMarks = json['totalMarks'];
    createdAt = json['createdAt'];
    obtainedMarks = json['obtainedMarks'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.classId != null) {
      data['classId'] = this.classId!.toJson();
    }
    data['assessmentName'] = this.assessmentName;
    data['openDate'] = this.openDate;
    data['dueDate'] = this.dueDate;
    data['description'] = this.description;
    data['duration'] = this.duration;
    data['totalMarks'] = this.totalMarks;
    data['createdAt'] = this.createdAt;
    data['obtainedMarks'] = this.obtainedMarks;
    data['status'] = this.status;
    return data;
  }
}

class ClassId {
  String? sId;
  String? courseCode;
  String? classDescription;
  String? className;

  ClassId({this.sId, this.courseCode, this.classDescription, this.className});

  ClassId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    courseCode = json['courseCode'];
    classDescription = json['classDescription'];
    className = json['className'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['courseCode'] = this.courseCode;
    data['classDescription'] = this.classDescription;
    data['className'] = this.className;
    return data;
  }
}