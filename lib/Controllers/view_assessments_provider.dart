import 'package:flutter/cupertino.dart';
import '../Data/Models/assessment_model.dart';
import '../Data/get_assessments.dart';

class ViewAssessmentsProvider with ChangeNotifier {

  AssessmentModel assessment = AssessmentModel();
  bool loading = false;

  getPostData(context) async {
    loading = true;
    assessment = await getAssessments(context);
    loading = false;
    notifyListeners();
  }
}