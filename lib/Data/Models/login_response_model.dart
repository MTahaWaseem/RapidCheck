import 'package:fyp/Data/Models/user_model.dart';

class LoginResponseModel {
  bool success;
  String message;
  String authToken;
  User user;

  LoginResponseModel({
    this.success = false,
    this.message = '',
    this.authToken = '',
    User? user,
  }) : user = user ?? User.empty();

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      success: json['success'],
      message: json['message'],
      authToken: json['authToken'],
      user: User.fromJson(json['user']),
    );
  }
}
