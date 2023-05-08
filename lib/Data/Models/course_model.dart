class CourseModel {
  final String courseID;
  final String courseName;
  // final String courseCode;
  // final String classDescription;
  // final String teacherId;
  // final DateTime createdAt;

  CourseModel(
      {
    this.courseID = "123",
    this.courseName = "Physics Evening",
    // required this.courseCode,
    // required this.classDescription,
    // required this.teacherId,
    // required this.createdAt,
  });

  static fromJson(Map<String, dynamic> json) {
    return CourseModel(
      courseID: json['PHY-C'],
      courseName: json['Physics'],
      // courseCode: json['courseCode'],
      // classDescription: json['classDescription'],
      // teacherId: json['teacherId'],
      // createdAt: json['createdAt'],
    );
  }

  toJson() {
    return {
      'courseID': courseID,
      'courseName': courseName,
      // 'courseCode': courseCode,
      // 'classDescription': classDescription,
      // 'teacherId': teacherId,
      // 'createdAt': createdAt,
    };
  }
}