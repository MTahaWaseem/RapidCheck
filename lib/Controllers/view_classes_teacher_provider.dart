import 'package:flutter/cupertino.dart';
import 'package:fyp/Data/Models/user_details_model.dart';
import '../Data/Models/class_model.dart';
import '../Data/get_classes.dart';
import '../Data/get_user_details.dart';

class ViewClassesTeacherProvider with ChangeNotifier {


  bool loading = true;
  ClassModel classes = ClassModel();
  UserDetailsModel user = UserDetailsModel();


  getClassesData(String authToken,context) async {
    loading = true;
    classes = await getClasses(authToken, context);
    loading = false;
    notifyListeners();
  }

  getUserData(String authToken, context) async {
    loading = true;
    user = await getUserDetails(authToken, context);
    notifyListeners();
  }
}