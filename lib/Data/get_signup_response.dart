import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp/config.dart';
import 'package:http/http.dart' as http;

import 'Models/signup_response_model.dart';

Future<SignupResponseModel> getSignupResponse(
    String firstName,
    String lastName,
    String userName,
    String password,
    String confirmPassword,
    String email,
    String role,
    context) async {
  SignupResponseModel _teacher = SignupResponseModel();

  try {
    final Map<String, dynamic> requestBody = {
      "firstName": firstName,
      "lastName": lastName,
      "username": userName,
      "password": password,
      "confirmPassword": confirmPassword,
      "email": email,
      "role": role,
    };
    final String jsonBody = jsonEncode(requestBody);
    final response = await http.post(
      Uri.parse("${URL}/api/users/register"),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
      body: jsonBody,
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      final item = json.decode(response.body);

      Fluttertoast.showToast(
          msg: "Signup Successfull",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.redAccent,
          textColor: Colors.white,
          fontSize: 16.0);
      _teacher = SignupResponseModel.fromJson(item);

    } else if (response.statusCode == 400 ) {
      Fluttertoast.showToast(
          msg: 'Passwords Dont Match',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.redAccent,
          textColor: Colors.white,
          fontSize: 16.0);

    }else{
      Fluttertoast.showToast(
          msg: 'Unable to Sign Up',
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
  return _teacher;
}
