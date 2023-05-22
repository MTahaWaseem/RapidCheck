import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp/Data/Models/user_details_model.dart';
import 'package:http/http.dart' as http;
import '../config.dart';

Future<UserDetailsModel> getUserDetails(String authToken, context) async {

  UserDetailsModel result = UserDetailsModel();

  try {
    Map<String, String> headers = {
      'Authorization': 'Bearer $authToken',
      'Content-Type': 'application/json',
    };

    final response = await http.get(
        Uri.parse("${URL}/api/users/me"),
      headers: headers
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      final item = json.decode(response.body);
      result = UserDetailsModel.fromJson(item);
    } else {
      Fluttertoast.showToast(
          msg: "Error Fetching User Details",
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