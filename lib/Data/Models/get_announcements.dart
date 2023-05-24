class GetAnnouncementsModel {
  bool? success;
  String? message;
  List<Announcements>? announcements;
  int? count;

  GetAnnouncementsModel({this.success, this.message, this.announcements, this.count});

  GetAnnouncementsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['announcements'] != null) {
      announcements = <Announcements>[];
      json['announcements'].forEach((v) {
        announcements!.add(new Announcements.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.announcements != null) {
      data['announcements'] =
          this.announcements!.map((v) => v.toJson()).toList();
    }
    data['count'] = this.count;
    return data;
  }
}

class Announcements {
  String? sId;
  String? description;
  String? title;

  Announcements({this.sId, this.description, this.title});

  Announcements.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    description = json['description'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['description'] = this.description;
    data['title'] = this.title;
    return data;
  }
}