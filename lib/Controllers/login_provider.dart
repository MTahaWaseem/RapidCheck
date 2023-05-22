import 'package:flutter/cupertino.dart';
import 'package:fyp/Data/Models/login_response_model.dart';
import 'package:fyp/Data/get_login_response.dart';
import '../Data/Models/signup_response_model.dart';
import '../Data/get_signup_response.dart';

class LoginProvider with ChangeNotifier {

  LoginResponseModel user = LoginResponseModel();
  SignupResponseModel register = SignupResponseModel();

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

  getPostData(String role, context) async {
    loading = true;
    notifyListeners();
    user = await getLoginResponse(role, email, password, context);
    loading = false;
    notifyListeners();
  }

  getSignupResponseData(String firstName, String lastName, String userName, String password, String confirmPassword, String email, String role, context) async {
    loading = true;
    notifyListeners();
    register = await getSignupResponse(firstName, lastName, userName , password , confirmPassword, email, role, context);
    loading = false;
    notifyListeners();
  }

    void refresh() {
      email = '';
      password = '';
      // Notify listeners after refreshing the values
      notifyListeners();
  }

}