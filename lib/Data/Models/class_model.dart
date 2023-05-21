class ClassModel {
  bool success;
  List<Class> classes;
  int count;

  ClassModel({this.success = false, this.classes = const [], this.count = 0});

  factory ClassModel.fromJson(Map<String, dynamic> json) {
    return ClassModel(
      success: json['success'] ?? false,
      classes: (json['classes'] as List<dynamic>?)
              ?.map((classJson) => Class.fromJson(classJson))
              .toList() ??
          [],
      count: json['count'] ?? 0,
    );
  }
}

class Class {
  String createdAt;
  String id;
  String courseCode;
  Teacher teacher;
  String classDescription;
  String className;

  Class({
    this.createdAt = "",
    this.id = "",
    this.courseCode = "",
    required this.teacher,
    this.classDescription = "",
    this.className = "",
  });

  factory Class.fromJson(Map<String, dynamic> json) {
    return Class(
      createdAt: json['createdAt'] ?? "",
      id: json['_id'] ?? "",
      courseCode: json['courseCode'] ?? "",
      teacher: Teacher.fromJson(json['teacherId']),
      classDescription: json['classDescription'] ?? "",
      className: json['className'] ?? "",
    );
  }
}

class Teacher {
  String id;
  String firstName;
  String lastName;
  String role;

  Teacher({
    this.id = "",
    this.firstName = "",
    this.lastName = "",
    this.role = "",
  });

  factory Teacher.fromJson(Map<String, dynamic> json) {
    return Teacher(
      id: json['_id'] ?? "",
      firstName: json['firstName'] ?? "",
      lastName: json['lastName'] ?? "",
      role: json['role'] ?? "",
    );
  }
}
