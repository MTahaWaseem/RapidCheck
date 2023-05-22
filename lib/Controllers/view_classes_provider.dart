import 'package:flutter/cupertino.dart';
import 'package:fyp/Data/Models/course_model.dart';
import 'package:fyp/Data/Models/user_details_model.dart';
import '../Data/Models/class_model.dart';
import '../Data/add_class.dart';
import '../Data/get_classes.dart';
import '../Data/get_courses.dart';
import '../Data/get_user_details.dart';

class ViewClassesProvider with ChangeNotifier {


  bool loading = true;
  ClassModel classes = ClassModel();
  UserDetailsModel user = UserDetailsModel();
  CourseResponseModel courses = CourseResponseModel();
  AddClassModel _class = AddClassModel();

  getClassesData(String authToken,context) async {
    loading = true;
    notifyListeners();
    classes = await getClasses(authToken, context);
    loading = false;
    notifyListeners();
  }
  getUserData(String authToken, context) async {
    loading = true;
    notifyListeners();
    user = await getUserDetails(authToken, context);
    loading = false;
    notifyListeners();
  }
  getCoursesData(String authToken,context) async {
    loading = true;
    notifyListeners();
    courses = await getCourses(authToken, context);
    loading = false;
    notifyListeners();
  }
  addClassData(String code, String className, String desc, String authToken,context) async {
    loading = true;
    notifyListeners();
    _class = await addClass(code, className, desc, authToken, context);
    loading = false;
    notifyListeners();
  }
}