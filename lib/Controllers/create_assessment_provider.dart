import 'package:flutter/cupertino.dart';
import 'package:fyp/Data/create_assessment.dart';
import '../Data/Models/create_assessment_response_model.dart';
import '../Data/Models/create_assessment_model.dart';

class CreateAssessmentProvider with ChangeNotifier {
  CreateAssessment assessmentResponse = CreateAssessment();

  bool loading = false;

  createAssessmentData(
      String classID,
      String name,
      String desc,
      String open,
      String due,
      int duration,
      List<OneQuestion> questions,
      bool allow,
      String authToken,
      context) async {

    loading = true;
    assessmentResponse = await createAssessment(classID, name, desc, open, due, duration, questions, allow, authToken, context);
    loading = false;
    notifyListeners();

  }
}
