class CourseResponseModel {
  bool success;
  List<Course> courses;
  int count;

  CourseResponseModel({
    this.success = false,
    this.courses = const [],
    this.count = 0,
  });

  factory CourseResponseModel.fromJson(Map<String, dynamic> json) {
    var courseList = json['courses'] as List;
    List<Course> courses = courseList.map((course) => Course.fromJson(course)).toList();

    return CourseResponseModel(
      success: json['success'] ?? false,
      courses: courses,
      count: json['count'] ?? 0,
    );
  }
}

class Course {
  String id;
  String courseCode;
  String courseDescription;
  String courseName;

  Course({
    this.id = '',
    this.courseCode = '',
    this.courseDescription = '',
    this.courseName = '',
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['_id'] ?? '',
      courseCode: json['courseCode'] ?? '',
      courseDescription: json['courseDescription'] ?? '',
      courseName: json['courseName'] ?? '',
    );
  }
}
