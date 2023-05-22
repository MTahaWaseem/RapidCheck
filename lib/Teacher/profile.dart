import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp/config.dart';
import 'package:fyp/main.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../Account Screens/login.dart';
import '../Controllers/login_provider.dart';
import '../Data/Models/login_response_model.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<LoginProvider>(context).user;

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Profile content
            Text('User Profile'),
            // Logout button
            ElevatedButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs?.clear();
                try {
                  final response = await http.delete(
                    Uri.parse("${URL}/api/users/logout"),
                    headers: {
                      'Authorization': 'Bearer ${user.authToken}',
                    },
                  );
                  if (response.statusCode == 200 ||
                      response.statusCode == 201) {
                    Fluttertoast.showToast(
                        msg: "Logged Out Succesfully",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 2,
                        backgroundColor: Colors.redAccent,
                        textColor: Colors.white,
                        fontSize: 16.0);
                    Navigator.of(context, rootNavigator: true).pushReplacement(
                        MaterialPageRoute(builder: (context) => new Login()));
                  } else {
                    Fluttertoast.showToast(
                        msg: "Unable to Log Out",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 2,
                        backgroundColor: Colors.redAccent,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                } catch (e) {
                  log("Catched! ", error: e);
                }
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
