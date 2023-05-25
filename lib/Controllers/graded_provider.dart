import 'package:flutter/cupertino.dart';
import '../Data/Models/get_student_answers_model.dart';
import '../Data/get_graded_assessments.dart';

class GradedProvider with ChangeNotifier {
  ResponseGraded gradedResponse = ResponseGraded();

  bool loading = false;

  getGradedAssessmentsData(String assessID, String authToken, context) async {
    loading = true;
    notifyListeners();
    gradedResponse = await getGradedResponse(assessID, authToken, context);
    loading = false;
    notifyListeners();
  }


}
