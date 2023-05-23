import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp/Data/Models/submit_asnwer_model.dart';
import 'package:fyp/config.dart';
import 'package:http/http.dart' as http;
import 'Models/add_student_model.dart';
import 'Models/answer.dart';

Future<SubmitAnswerModel> submitAnswer(String assessID, int duration, List<Answer> answers, String authToken, context) async {

  SubmitAnswerModel _answer = SubmitAnswerModel();

  try {
    final Map<String, dynamic> requestBody = {
      "duration": duration, // in seconds
      "answers" : answers,
    };
    print(requestBody);
    print("Before Encoding");
    String jsonBody = jsonEncode(requestBody);
    print("After Encoding");
    print(requestBody);
    final response = await http.post(
      Uri.parse("${URL}/api/assessments/submit-assessment/${assessID}"),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: "BEARER $authToken"
      },
      body: jsonBody,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final item = json.decode(response.body);

      Fluttertoast.showToast(
          msg: "Assessment Submitted Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.redAccent,
          textColor: Colors.white,
          fontSize: 16.0);

      _answer = SubmitAnswerModel.fromJson(item);
    } else {
      print(response.statusCode);
      Fluttertoast.showToast(
          msg: "Error Submitting Answer",
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
