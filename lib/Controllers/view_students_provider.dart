import 'package:flutter/cupertino.dart';
import 'package:fyp/Data/Models/get_students_model.dart';
import '../Data/Models/add_student_model.dart';
import '../Data/add_student.dart';
import '../Data/get_students.dart';

class ViewStudentsProvider with ChangeNotifier {


  bool loading = true;
  GetStudentsModel students = GetStudentsModel();
  AddStudentModel added =  AddStudentModel();


  getStudentsData(String classID, String authToken,context) async {
    loading = true;
    notifyListeners();
    students = await getStudents(classID, authToken, context);
    loading = false;
    notifyListeners();
  }

  addStudentData(String classID, String email, String authToken,context) async {
    loading = true;
    notifyListeners();
    added = await addStudent(classID, email, authToken, context);
    loading = false;
    notifyListeners();
  }
}