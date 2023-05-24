import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp/Data/Models/post_announcement.dart';
import 'package:fyp/config.dart';
import 'package:http/http.dart' as http;
import 'Models/add_student_model.dart';

Future<PostAnnouncementModel> postAnnouncement(String classID, String title, String desc, String authToken, context) async {

  PostAnnouncementModel announcementData = PostAnnouncementModel();

  try {
    final Map<String, String> requestBody = {
      "title": title,
      "description" : desc
    };

    String jsonBody = jsonEncode(requestBody);

    final response = await http.post(
      Uri.parse("${URL}/api/classes/post-announcement/${classID}"),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: "BEARER $authToken"
      },
      body: jsonBody,
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      final item = json.decode(response.body);

      Fluttertoast.showToast(
          msg: "Announcement Posted",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.redAccent,
          textColor: Colors.white,
          fontSize: 16.0);

      announcementData = PostAnnouncementModel.fromJson(item);
    } else {
      print(response.statusCode);
      Fluttertoast.showToast(
          msg: "Error Posting Announcement",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.redAccent,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  } catch (e) {
    print("Inside log!");
    log("Catched! ", error: e);
  }
  return announcementData;
}
