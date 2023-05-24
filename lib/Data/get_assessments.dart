import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp/Data/Models/get_assessments_model.dart';
import 'package:fyp/Data/Models/get_students_model.dart';
import 'package:http/http.dart' as http;
import '../config.dart';

Future<GetAssessModel> getAssessments(String classID, String authToken, context) async {

  GetAssessModel assessments = GetAssessModel();

  try {
    Map<String, String> headers = {
      'Authorization': 'Bearer $authToken',
      'Content-Type': 'application/json',
    };

    final response = await http.get(
        Uri.parse("${URL}/api/assessments?classId=${classID}"),
        headers: headers
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      final item = json.decode(response.body);
      print("Before FromJSON");
      assessments = GetAssessModel.fromJson(item);
      print("After FromJSON");
    } else {
      print(response.body);
      Fluttertoast.showToast(
          msg: "Error Fetching Assessments",
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

  return assessments;
}