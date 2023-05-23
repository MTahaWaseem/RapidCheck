import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../config.dart';
import 'Models/get_one_asses_model.dart';

Future<GetOneAssessModel> getOneAssessment(String assessID, String authToken, context) async {

  GetOneAssessModel oneAssess = GetOneAssessModel();

  try {
    Map<String, String> headers = {
      'Authorization': 'Bearer $authToken',
      'Content-Type': 'application/json',
    };

    print("AssessID + " + assessID);

    final response = await http.get(
        Uri.parse("${URL}/api/assessments/view-assessment/${assessID}"),
        headers: headers
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      final item = json.decode(response.body);
      print("Before FromJSON");
      oneAssess = GetOneAssessModel.fromJson(item);
      print("After FromJSON");
    } else {
      print(response.statusCode);
      print(response.body);
      Fluttertoast.showToast(
          msg: "Error Fetching One Assessment",
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

  return oneAssess;
}