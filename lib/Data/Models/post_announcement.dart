class PostAnnouncementModel {
  bool? success;
  String? message;
  Announcement? announcement;

  PostAnnouncementModel({this.success, this.message, this.announcement});

  PostAnnouncementModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    announcement = json['announcement'] != null
        ? new Announcement.fromJson(json['announcement'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.announcement != null) {
      data['announcement'] = this.announcement!.toJson();
    }
    return data;
  }
}

class Announcement {
  String? classId;
  String? description;
  String? title;
  String? createdAt;
  String? sId;
  int? iV;

  Announcement(
      {this.classId,
        this.description,
        this.title,
        this.createdAt,
        this.sId,
        this.iV});

  Announcement.fromJson(Map<String, dynamic> json) {
    classId = json['classId'];
    description = json['description'];
    title = json['title'];
    createdAt = json['createdAt'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['classId'] = this.classId;
    data['description'] = this.description;
    data['title'] = this.title;
    data['createdAt'] = this.createdAt;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}
