import 'package:flutter/cupertino.dart';
import 'package:fyp/Data/Models/get_announcements.dart';
import 'package:fyp/Data/Models/post_announcement.dart';
import 'package:fyp/Data/get_announcements.dart';
import '../Data/post_announcement.dart';

class AnnouncementsProvider with ChangeNotifier {

  GetAnnouncementsModel announcements = GetAnnouncementsModel();
  PostAnnouncementModel postAnnounce = PostAnnouncementModel();

  bool loading = false;

  getAnnouncementsData(String classID, String authToken, context) async {
    loading = true;
    notifyListeners();
    announcements = await getAnnouncements(classID, authToken, context);
    loading = false;
    notifyListeners();
  }

  postAnnouncementData(String classID, String title, String desc, String authToken, context) async {
    loading = true;
    notifyListeners();
    postAnnounce = await postAnnouncement(classID, title, desc, authToken, context);
    loading = false;
    notifyListeners();
  }
}