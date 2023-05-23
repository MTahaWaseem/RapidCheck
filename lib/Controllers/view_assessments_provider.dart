import 'package:flutter/cupertino.dart';
import '../Data/Models/get_assessments_model.dart';
import '../Data/get_assessments.dart';

class ViewAssessmentsProvider with ChangeNotifier {

  GetAssessModel assessments = GetAssessModel();
  bool loading = false;

  getAssessmentsData(String classID, String authToken, context) async {
    loading = true;
    assessments = await getAssessments(classID, authToken, context);
    loading = false;
    notifyListeners();
  }
}