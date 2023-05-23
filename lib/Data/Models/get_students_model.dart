class GetStudentsModel {
  bool? success;
  List<Students>? students;
  int? count;

  GetStudentsModel({this.success, this.students, this.count});

  GetStudentsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['students'] != null) {
      students = <Students>[];
      json['students'].forEach((v) {
        students!.add(new Students.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.students != null) {
      data['students'] = this.students!.map((v) => v.toJson()).toList();
    }
    data['count'] = this.count;
    return data;
  }
}

class Students {
  String? sId;
  String? firstName;
  String? lastName;
  String? email;
  String? username;
  String? createdAt;
  Null? deletedAt;
  int? iV;
  Settings? settings;
  String? role;
  String? id;

  Students(
      {this.sId,
        this.firstName,
        this.lastName,
        this.email,
        this.username,
        this.createdAt,
        this.deletedAt,
        this.iV,
        this.settings,
        this.role,
        this.id});

  Students.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    username = json['username'];
    createdAt = json['createdAt'];
    deletedAt = json['deletedAt'];
    iV = json['__v'];
    settings = json['settings'] != null
        ? new Settings.fromJson(json['settings'])
        : null;
    role = json['role'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['username'] = this.username;
    data['createdAt'] = this.createdAt;
    data['deletedAt'] = this.deletedAt;
    data['__v'] = this.iV;
    if (this.settings != null) {
      data['settings'] = this.settings!.toJson();
    }
    data['role'] = this.role;
    data['id'] = this.id;
    return data;
  }
}

class Settings {
  bool? notificationsOn;
  bool? emailsOn;
  String? sId;

  Settings({this.notificationsOn, this.emailsOn, this.sId});

  Settings.fromJson(Map<String, dynamic> json) {
    notificationsOn = json['notificationsOn'];
    emailsOn = json['emailsOn'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notificationsOn'] = this.notificationsOn;
    data['emailsOn'] = this.emailsOn;
    data['_id'] = this.sId;
    return data;
  }
}