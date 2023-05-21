import 'package:flutter/material.dart';
import 'package:fyp/Controllers/login_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

import 'Account Screens/login.dart';
import 'nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoggedIn = false;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  void checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    });
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return MaterialApp(
        home: Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    } else {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider<LoginProvider>(
            create: (context) => LoginProvider(),
          ),
          ChangeNotifierProvider<Provider2>(
            create: (context) => Provider2(),
          ),
          // Add more providers as needed
        ],
        child: MaterialApp(
          title: 'My App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: isLoggedIn ? Navbar() : Login(),
        ),
      );
    }
  }
}

class Provider2 with ChangeNotifier {
  // Provider 2 logic and state
}
