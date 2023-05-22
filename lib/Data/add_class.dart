import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp/Data/Models/class_model.dart';
import 'package:fyp/config.dart';
import 'package:http/http.dart' as http;

Future<AddClassModel> addClass(String code, String className, String desc,String authToken, context) async {

  AddClassModel user = AddClassModel();

  try {
    Map<String, String> headers = {
      'Authorization': 'BEARER $authToken',
      'Content-Type': 'application/json',
    };

    final Map<String, dynamic> requestBody = {
      "courseCode": code,
      "className": className,
      "classDescription": desc,
    };

    final String jsonBody = jsonEncode(requestBody);

    final response = await http.post(
      Uri.parse("${URL}/api/classes/create-class"),
      headers: headers,
      body: jsonBody,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final item = json.decode(response.body);
      user = AddClassModel.fromJson(item);
      Fluttertoast.showToast(
          msg: "Class Succesfully Added",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.redAccent,
          textColor: Colors.white,
          fontSize: 16.0);

    } else {
      print(response.statusCode);
      Fluttertoast.showToast(

          msg: "Error Adding Class",
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

  return user;
}
