import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../Account Screens/login.dart';
import '../Controllers/login_provider.dart';
import '../config.dart';
import '../nav_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

Color _buttonColorTeacher = Colors.grey.shade500;
Color _buttonColorStudent = Colors.blue.shade900;

bool teacher = false;
bool student = true;

class _ProfileScreenState extends State<ProfileScreen> {

  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _obscureConfirmPassword = !_obscureConfirmPassword;
    });
  }


  @override
  Widget build(BuildContext context) {

    final user = Provider.of<LoginProvider>(context).user;

    return Scaffold(
      body: Stack(
        children: [
          BackgroundScreen(),


          Center(
            child: Card(
              color: Colors.white,
              elevation: 30,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.70,
                width: MediaQuery.of(context).size.width * 0.8,
              ),
            ),
          ),





          Stack(
            children: [
              Positioned(
                top: MediaQuery.of(context).size.height * 0.14,
                left: MediaQuery.of(context).size.width * 0.1,
                right: MediaQuery.of(context).size.width * 0.1,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.06,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),


              Positioned(
                top: MediaQuery.of(context).size.height * 0.26,
                left: MediaQuery.of(context).size.width * 0.18,
                right: MediaQuery.of(context).size.width * 0.18,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.1,
                  child: TextFormField(
                    controller: _firstNameController,
                    decoration: InputDecoration(
                      hintText: 'First Name',
                      prefixIcon: const Icon(Icons.person),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your first name';
                      }
                      return null;
                    },
                  ),
                ),
              ),

              Positioned(
                top: MediaQuery.of(context).size.height * 0.33,
                left: MediaQuery.of(context).size.width * 0.18,
                right: MediaQuery.of(context).size.width * 0.18,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.1,
                  child: TextFormField(
                    controller: _lastNameController,
                    decoration: InputDecoration(
                      hintText: 'Last Name',
                      prefixIcon: const Icon(Icons.person),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your last name';
                      }
                      return null;
                    },
                  ),
                ),
              ),

              Positioned(
                top: MediaQuery.of(context).size.height * 0.4,
                left: MediaQuery.of(context).size.width * 0.18,
                right: MediaQuery.of(context).size.width * 0.18,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.1,
                  child: TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      hintText: 'Username',
                      prefixIcon: const Icon(Icons.account_circle),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a username';
                      }
                      return null;
                    },
                  ),
                ),
              ),


              Positioned(
                top: MediaQuery.of(context).size.height * 0.47,
                left: MediaQuery.of(context).size.width * 0.18,
                right: MediaQuery.of(context).size.width * 0.18,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.1,
                  child: TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      prefixIcon: const Icon(Icons.email),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email address';
                      }
                      if (!value.contains('@') || !value.contains('.')) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                ),
              ),

              Positioned(
                bottom: MediaQuery.of(context).size.height * 0.3,
                left: MediaQuery.of(context).size.width * 0.18,
                right: MediaQuery.of(context).size.width * 0.18,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade800,
                    foregroundColor: Colors.white,
                  ),
                  child: Text("Save Changes"),
                  onPressed: (){},
                ),
              ),

              Positioned(
                bottom: MediaQuery.of(context).size.height * 0.25,
                left: MediaQuery.of(context).size.width * 0.18,
                right: MediaQuery.of(context).size.width * 0.18,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade800,
                    foregroundColor: Colors.white,
                  ),
                  child: Text("Change Password"),
                  onPressed: (){},
                ),
              ),

              Positioned(
                bottom: MediaQuery.of(context).size.height * 0.17,
                left: MediaQuery.of(context).size.width * 0.3,
                right: MediaQuery.of(context).size.width * 0.3,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  child: Text("Logout"),
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
                ),
              ),
            ],
          ),


          // Positioned(
          //   top: MediaQuery.of(context).size.height * 0.85 - MediaQuery.of(context).size.height * 0.045,
          //   left: MediaQuery.of(context).size.width * 0.50 - MediaQuery.of(context).size.height * 0.045,
          //   child: Container(
          //     height: MediaQuery.of(context).size.height * 0.09,
          //     width: MediaQuery.of(context).size.height * 0.09,
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height * 0.045),
          //       color: Colors.white,
          //     ),
          //   ),
          // ),

          // Positioned(
          //   top: MediaQuery.of(context).size.height * 0.85 - MediaQuery.of(context).size.height * 0.04,
          //   left: MediaQuery.of(context).size.width * 0.50 - MediaQuery.of(context).size.height * 0.04,
          //   child: GestureDetector(
          //     onTap: () {
          //       // Handle button tap
          //     },
          //     child: Container(
          //       width: MediaQuery.of(context).size.height * 0.08,
          //       height: MediaQuery.of(context).size.height * 0.08,
          //       decoration: BoxDecoration(
          //         shape: BoxShape.circle,
          //         color: Colors.blue.shade900,
          //       ),
          //       child: Icon(
          //         Icons.arrow_right_alt,
          //         color: Colors.white,
          //         size:MediaQuery.of(context).size.height * 0.08,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class BackgroundScreen extends StatelessWidget {
  const BackgroundScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: MediaQuery.of(context).size.height / 2,
            color: Colors.orange),
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

