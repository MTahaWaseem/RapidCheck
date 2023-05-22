import 'package:fyp/Data/Models/user_model.dart';

class SignupResponseModel {
  bool success;
  String message;
  String authToken;
  User user;

  SignupResponseModel({
    this.success = false,
    this.message = '',
    this.authToken = '',
    User? user,
  }) : user = user ?? User.empty();

  factory SignupResponseModel.fromJson(Map<String, dynamic> json) {
    return SignupResponseModel(
      success: json['success'],
      message: json['message'],
      authToken: json['authToken'],
      user: User.fromJson(json['user']),
    );
  }
}
