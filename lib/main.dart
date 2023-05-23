import 'package:flutter/material.dart';
import 'package:fyp/Controllers/login_provider.dart';
import 'package:fyp/Controllers/take_assessment_provider.dart';
import 'package:fyp/Controllers/view_assessments_provider.dart';
import 'package:fyp/splash_screen.dart';
import 'package:provider/provider.dart';
import 'Controllers/view_classes_provider.dart';
import 'Controllers/view_students_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider<LoginProvider>(
            create: (context) => LoginProvider(),
          ),
          ChangeNotifierProvider<ViewClassesProvider>(
            create: (context) => ViewClassesProvider(),
          ),
          ChangeNotifierProvider<ViewStudentsProvider>(
            create: (context) => ViewStudentsProvider(),
          ),
          ChangeNotifierProvider<ViewAssessmentsProvider>(
            create: (context) => ViewAssessmentsProvider(),
          ),
          ChangeNotifierProvider<TakeAssessmentProvider>(
            create: (context) => TakeAssessmentProvider(),
          ),
          // Add more providers as needed
        ],

        //ViewStudentsProvider
        child: MaterialApp(
          title: 'RapidCheck',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: SplashScreen(),// isLoggedIn ? Navbar() : Login(),
        ),
      );

  }
}
