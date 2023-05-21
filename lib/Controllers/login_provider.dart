import 'package:flutter/cupertino.dart';
import 'package:fyp/Data/Models/user_model.dart';
import 'package:fyp/Data/get_user.dart';

class LoginProvider with ChangeNotifier {

  UserModel user = UserModel();
  String email = '';
  String password = '';
  bool loading = false;

  void updateEmail(String value) {
    email = value;
    notifyListeners();
  }

  void updatePassword(String value) {
    password = value;
    notifyListeners();
  }

  getPostData(context) async {
    loading = true;
    notifyListeners();
    user = await getUser(email, password, context);
    loading = false;
    notifyListeners();
  }
}