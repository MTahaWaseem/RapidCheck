import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp/Data/Models/user_model.dart';
import 'package:fyp/config.dart';
import 'package:http/http.dart' as http;

Future<UserModel> getUser(String username, String password, context) async {

  UserModel user = UserModel();

  try {
    final Map<String, dynamic> requestBody = {
      "usernameOrEmail": username,
      "password": password,
      "role": "TEACHER",
    };
    final String jsonBody = jsonEncode(requestBody);
    final response = await http.post(
      Uri.parse("${URL}/api/users/login"),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
      body: jsonBody,
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      final item = json.decode(response.body);
      user = UserModel.fromJson(item);
    } else {
      Fluttertoast.showToast(
          msg: "Invalid Login Credentials",
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

  return user;
}