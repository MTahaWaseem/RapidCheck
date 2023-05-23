import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp/config.dart';
import 'package:http/http.dart' as http;
import '../Teacher/view_students.dart';
import 'Models/add_student_model.dart';

Future<AddStudentModel> addStudent(String classID, String email, String authToken, context) async {

  AddStudentModel studentData = AddStudentModel();

  try {
    final Map<String, String> requestBody = {
      "email": email
    };
    String jsonBody = jsonEncode(requestBody);
    final response = await http.post(
      Uri.parse("${URL}/api/classes/add-single-student/${classID}"),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: "BEARER $authToken"
      },
      body: jsonBody,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final item = json.decode(response.body);

      Fluttertoast.showToast(
          msg: "Student Added Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.redAccent,
          textColor: Colors.white,
          fontSize: 16.0);

      studentData = AddStudentModel.fromJson(item);
    } else {
      print(response.statusCode);
      Fluttertoast.showToast(
          msg: "Error Adding Student",
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
  return studentData;
}
