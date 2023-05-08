import 'package:flutter/cupertino.dart';
import '../Data/Models/assessment_model.dart';
import '../Data/Models/class_model.dart';
import '../Data/get_assessments.dart';
import '../Data/get_classes.dart';

class ViewClassesProvider with ChangeNotifier {

  ClassModel classes = ClassModel();
  bool loading = false;

  getPostData(context) async {
    loading = true;
    classes = await getClasses(context);
    loading = false;

    notifyListeners();
  }
}