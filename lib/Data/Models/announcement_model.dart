class AnnouncementModel {
  final String announceID;
  final String announceText;
  // final String courseCode;
  // final String classDescription;
  // final String teacherId;
  // final DateTime createdAt;

  AnnouncementModel(
      {
        this.announceID = "Quiz Posted!",
        this.announceText = "Every student MUST attempt this quiz, Very important for your final exam.",
        // required this.courseCode,
        // required this.classDescription,
        // required this.teacherId,
        // required this.createdAt,
      });

  static fromJson(Map<String, dynamic> json) {
    return AnnouncementModel(
      announceID: json['announceID'],
      announceText: json['announceText'],
      // courseCode: json['courseCode'],
      // classDescription: json['classDescription'],
      // teacherId: json['teacherId'],
      // createdAt: json['createdAt'],
    );
  }

  toJson() {
    return {
      'announceID': announceID,
      'announceText': announceText,
      // 'courseCode': courseCode,
      // 'classDescription': classDescription,
      // 'teacherId': teacherId,
      // 'createdAt': createdAt,
    };
  }
}