import 'package:flutter/material.dart';
import 'package:fyp/getAPI.dart';
import 'package:fyp/test.dart';

import 'Teacher/teacher_home.dart';
import 'Student/view_assessments.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),

      home: ViewAssessments(), //const TeacherHome(),
    );
  }
}
