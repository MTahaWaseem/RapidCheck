import 'package:flutter/material.dart';
import 'package:fyp/Controllers/login_provider.dart';
import 'package:fyp/splash_screen.dart';
import 'package:provider/provider.dart';
import 'Controllers/view_classes_teacher_provider.dart';

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
          ChangeNotifierProvider<ViewClassesTeacherProvider>(
            create: (context) => ViewClassesTeacherProvider(),
          ),
          // Add more providers as needed
        ],
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
