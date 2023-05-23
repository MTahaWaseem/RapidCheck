import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp/Data/Models/get_students_model.dart';
import 'package:http/http.dart' as http;
import '../config.dart';

Future<GetStudentsModel> getStudents(String classID, String authToken, context) async {

  GetStudentsModel students = GetStudentsModel();

  try {
    Map<String, String> headers = {
      'Authorization': 'Bearer $authToken',
      'Content-Type': 'application/json',
    };

    final response = await http.get(
        Uri.parse("${URL}/api/classes/get-class-students/${classID}"),
        headers: headers
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      final item = json.decode(response.body);
      print("I am here");
      students = GetStudentsModel.fromJson(item);
      print("Sad lyfe");
    } else {
      Fluttertoast.showToast(
          msg: "Error Fetching Students",
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

  return students;
}