import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp/Data/Models/course_model.dart';
import 'package:http/http.dart' as http;
import '../config.dart';

Future<CourseResponseModel> getCourses(String authToken, context) async {

  CourseResponseModel result = CourseResponseModel();

  try {
    print("INSIDE GET COURSES");
    Map<String, String> headers = {
      'Authorization': 'Bearer $authToken',
      'Content-Type': 'application/json',
    };

    final response = await http.get(
        Uri.parse("${URL}/api/course"),
        headers: headers
    );
    print("AFTER RESPONSE AND HEADER");
    if (response.statusCode == 200 || response.statusCode == 201) {
      final item = json.decode(response.body);
      result = CourseResponseModel.fromJson(item);
      print("202 length: " + result.courses.length.toString());
    } else {
      Fluttertoast.showToast(
          msg: "Error Fetching Courses",
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
  return result;
}