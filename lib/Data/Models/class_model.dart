class ClassModel {
  final String classID;
  final String className;
  // final String courseCode;
  // final String classDescription;
  // final String teacherId;
  // final DateTime createdAt;

  ClassModel({
    this.classID = "123",
    this.className = "Physics Evening",
    // required this.courseCode,
    // required this.classDescription,
    // required this.teacherId,
    // required this.createdAt,
  });



  static fromJson(Map<String, dynamic> json) {
    return ClassModel(
      classID: json['PHY-ID'],
      className: json['Physics Evening'],
      // courseCode: json['courseCode'],
      // classDescription: json['classDescription'],
      // teacherId: json['teacherId'],
      // createdAt: json['createdAt'],
    );
  }

  toJson() {
    return {
      'classID': classID,
      'className': className,
      // 'courseCode': courseCode,
      // 'classDescription': classDescription,
      // 'teacherId': teacherId,
      // 'createdAt': createdAt,
    };
  }
}