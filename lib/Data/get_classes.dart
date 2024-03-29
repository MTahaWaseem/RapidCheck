import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../config.dart';
import 'Models/class_model.dart';

Future<ClassModel> getClasses(String authToken, context) async {

  ClassModel result = ClassModel();

  try {

    Map<String, String> headers = {
      'Authorization': 'Bearer $authToken',
      'Content-Type': 'application/json',
    };

    final response = await http.get(
        Uri.parse("${URL}/api/classes"),
        headers: headers
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      final item = json.decode(response.body);
      result = ClassModel.fromJson(item);
    } else {
      print(response.body);
      Fluttertoast.showToast(
          msg: "Error Fetching Classes",
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