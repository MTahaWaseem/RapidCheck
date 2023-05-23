import 'package:flutter/cupertino.dart';
import '../Data/Models/answer.dart';
import '../Data/Models/get_one_asses_model.dart';
import '../Data/Models/submit_asnwer_model.dart';
import '../Data/get_one_assessment.dart';
import '../Data/submit_answer.dart';

class TakeAssessmentProvider with ChangeNotifier {

  GetOneAssessModel oneAssess = GetOneAssessModel();
  SubmitAnswerModel answerData = SubmitAnswerModel();

  bool loading = false;

  getOneAssessmentData(String assessID, String authToken, context) async {
    loading = true;
    oneAssess = await getOneAssessment(assessID, authToken, context);
    loading = false;
    notifyListeners();
  }

  submitAnswerData(String assessID, int duration, List<Answer> answers, String authToken, context) async {
    loading = true;
    answerData = await submitAnswer(assessID, duration, answers, authToken, context);
    loading = false;
    notifyListeners();
  }

}