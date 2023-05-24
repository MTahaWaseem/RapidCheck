import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp/Data/Models/create_assessment_response_model.dart';
import 'package:fyp/Data/Models/questions_create.dart';
import 'package:fyp/config.dart';
import 'package:http/http.dart' as http;

Future<CreateAssessment> createAssessment(
    String classID,
    String name,
    String desc,
    String open,
    String due,
    int duration,
    List<OneQuestion> questions,
    bool allow,
    String authToken,
    context) async {
  CreateAssessment _answer = CreateAssessment();
//changeDate == null ? null : changeDate.toIso8601String(),
  try {
    final Map<String, dynamic> requestBody = {
      "assessmentName": name,
      'description': desc,
      'openDate': open,
      'dueDate':  due,
      'duration': duration,
      'questions': questions.map((question) => question.toJson()).toList(),
      'allowManualGrading': allow //2023-05-25T06:33:00.000
    };

    print(requestBody);
    print("Before Encoding");
    String jsonBody = jsonEncode(requestBody);
    print("After Encoding");
    print(requestBody);

    final response = await http.post(
      Uri.parse("${URL}/api/assessments/create-assessment/${classID}"),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: "BEARER $authToken"
      },
      body: jsonBody,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final item = json.decode(response.body);

      Fluttertoast.showToast(
          msg: "Assessment Created",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.redAccent,
          textColor: Colors.white,
          fontSize: 16.0);

      _answer = CreateAssessment.fromJson(item);
    } else {
      print(response.body);
      print("I AM HERE");
      print("I AM HERE");
      print("I AM HERE");
      print("I AM HERE");print("I AM HERE");print("I AM HERE");print("I AM HERE");print("I AM HERE");


      Fluttertoast.showToast(
          msg: "Error Creating",
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
  return _answer;
}
