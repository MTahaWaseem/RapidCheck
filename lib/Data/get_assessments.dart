import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'Models/assessment_model.dart';

Future<AssessmentModel> getAssessments(context) async {

  AssessmentModel result;

  try {
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts/1"),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      result = AssessmentModel.fromJson(item);
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

  result = new AssessmentModel();

  return result;
}