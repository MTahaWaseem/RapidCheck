import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp/Data/Models/get_announcements.dart';
import 'package:http/http.dart' as http;
import '../config.dart';

Future<GetAnnouncementsModel> getAnnouncements(String classID, String authToken, context) async {

  GetAnnouncementsModel announcements = GetAnnouncementsModel();

  try {
    Map<String, String> headers = {
      'Authorization': 'Bearer $authToken',
      'Content-Type': 'application/json',
    };

    final response = await http.get(
        Uri.parse("${URL}/api/classes/view-announcements/${classID}"),
        headers: headers
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      final item = json.decode(response.body);
      announcements = GetAnnouncementsModel.fromJson(item);
      print("After FromJSON");
    } else {
      print(response.body);
      Fluttertoast.showToast(
          msg: "Error Fetching Announcements",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.redAccent,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  } catch (e) {
    log("Catched! ", error: e);
  }

  return announcements;
}