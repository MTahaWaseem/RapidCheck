import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp/Data/Models/course_model.dart';
import 'package:http/http.dart' as http;
import 'Models/assessment_model.dart';
import 'Models/class_model.dart';

Future<CourseModel> getCourses(context) async {

  CourseModel result;

  try {
    final response = await http.post(
      Uri.parse("http://localhost:3018/api/users/login",),

      body: {	"usernameOrEmail": "teacher@mailinator.com",
        "password": "password123",
        "role": "TEACHER"},
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },

    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      final item = json.decode(response.body);
      result = ClassModel.fromJson(item);
    } else {
      Fluttertoast.showToast(
          msg: "Data not found",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.redAccent,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  } catch (e) {
    log("Catched! ", error: e);
  }

  result = new CourseModel();

  return result;
}