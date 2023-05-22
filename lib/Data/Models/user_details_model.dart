import 'package:fyp/Data/Models/user_model.dart';

class UserDetailsModel {
  bool success;
  User user;

  UserDetailsModel({
    this.success = false,
    User? user,
  }) : user = user ?? User.empty();

  factory UserDetailsModel.fromJson(Map<String, dynamic> json) {
    return UserDetailsModel(
      success: json['success'] ?? false,
      user: User.fromJson(json['user'] ?? {}),
    );
  }
}