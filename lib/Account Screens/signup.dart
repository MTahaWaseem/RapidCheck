import 'package:flutter/material.dart';
import 'package:fyp/Account%20Screens/login.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Controllers/login_provider.dart';
import '../config.dart';
import '../nav_bar.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

Color _buttonColorTeacher = Colors.grey.shade500;
Color _buttonColorStudent = Colors.blue.shade900;

bool teacher = false;
bool student = true;

class _SignupState extends State<Signup> {
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
    final loginProvider = Provider.of<LoginProvider>(context);
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: double.infinity,
                    color: Colors.orange,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: double.infinity,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.01,
            left: MediaQuery.of(context).size.width * 0.1,
            right: MediaQuery.of(context).size.width * 0.1,
            child: Image.asset(
              'assets/images/logo.jpeg',
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width * 0.15,
            ),
          ),
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
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'SIGNUP',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * 0.06,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      Padding(
                        padding:
                            EdgeInsets.only(left: w * 0.03, right: w * 0.03),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: MediaQuery.of(context).size.height * 0.05,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (student) {
                                    setState(() {
                                      _buttonColorTeacher =
                                          Colors.blue.shade900;
                                      _buttonColorStudent =
                                          Colors.grey.shade500;
                                      teacher = true;
                                      student = false;
                                    });
                                  }
                                },
                                child: Text('Teacher'),
                                style: ElevatedButton.styleFrom(
                                  primary: _buttonColorTeacher,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: MediaQuery.of(context).size.height * 0.05,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (teacher) {
                                    setState(() {
                                      _buttonColorTeacher =
                                          Colors.grey.shade500;
                                      _buttonColorStudent =
                                          Colors.blue.shade900;
                                      teacher = false;
                                      student = true;
                                    });
                                  }
                                },
                                child: Text('Student'),
                                style: ElevatedButton.styleFrom(
                                  primary: _buttonColorStudent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: h * 0.035),
                      MyTextField(
                          h: h,
                          w: w,
                          firstNameController: _firstNameController,
                          Message: 'Please Enter Your First Name',
                          HintText: 'First Name',
                          MyIcon: Icon(Icons.person)),
                      SizedBox(height: h * 0.01),
                      MyTextField(
                        h: h,
                        w: w,
                        firstNameController: _lastNameController,
                        Message: 'Please Enter Your Last Name',
                        HintText: 'Last Name',
                        MyIcon: Icon(Icons.person),
                      ),
                      SizedBox(height: h * 0.01),
                      MyTextField(
                          h: h,
                          w: w,
                          firstNameController: _usernameController,
                          Message: 'Please Enter Your Username',
                          HintText: 'Username',
                          MyIcon: Icon(Icons.account_circle)),
                      SizedBox(height: h * 0.01),
                      MyTextField(
                        h: h,
                        w: w,
                        firstNameController: _emailController,
                        Message: 'Please Enter Your Email',
                        HintText: 'Email',
                        MyIcon: Icon(Icons.email),
                      ),
                      SizedBox(height: h * 0.01),
                      SizedBox(
                        height: h * 0.05,
                        width: w * 0.65,
                        child: TextFormField(
                          controller: _passwordController,
                          obscureText: _obscurePassword,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                              onPressed: _togglePasswordVisibility,
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters long';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: h * 0.015),
                      SizedBox(
                        height: h * 0.05,
                        width: w * 0.65,
                        child: TextFormField(
                          controller: _confirmPasswordController,
                          obscureText: _obscureConfirmPassword,
                          decoration: InputDecoration(
                            hintText: 'Confirm Password',
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                              onPressed: _toggleConfirmPasswordVisibility,
                              icon: Icon(
                                _obscureConfirmPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            }
                            if (value != _passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Stack(
            children: [
              Positioned(
                top: MediaQuery.of(context).size.height * 0.915,
                left: MediaQuery.of(context).size.width * 0.1,
                right: MediaQuery.of(context).size.width * 0.1,
                child: Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.027,
                          color: Colors.orange,
                        ),
                        children: [
                          TextSpan(text: 'Registered?'),
                          TextSpan(
                            text: ' Login',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.85 -
                MediaQuery.of(context).size.height * 0.045,
            left: MediaQuery.of(context).size.width * 0.50 -
                MediaQuery.of(context).size.height * 0.045,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.09,
              width: MediaQuery.of(context).size.height * 0.09,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.height * 0.045),
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.85 -
                MediaQuery.of(context).size.height * 0.04,
            left: MediaQuery.of(context).size.width * 0.50 -
                MediaQuery.of(context).size.height * 0.04,
            child: GestureDetector(
              onTap: () async {
                String role = 'TEACHER';
                if (student) {
                  role = 'STUDENT';
                }
                await loginProvider.getSignupResponseData(
                    _firstNameController.text,
                    _lastNameController.text,
                    _usernameController.text,
                    _passwordController.text,
                    _confirmPasswordController.text,
                    _emailController.text,
                    role,
                    context);

                if (loginProvider.register.success) {
                  String authToken = loginProvider.register.authToken;

                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setBool('isLoggedIn', true);
                  await prefs.setString('authToken', authToken);
                  if (teacher) {
                    await prefs.setBool('isTeacher', true);
                  } else {
                    await prefs.setBool('isTeacher', false);
                  }

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Navbar()),
                  );
                }
              },
              child: Container(
                width: MediaQuery.of(context).size.height * 0.08,
                height: MediaQuery.of(context).size.height * 0.08,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue.shade900,
                ),
                child: Icon(
                  Icons.arrow_right_alt,
                  color: Colors.white,
                  size: MediaQuery.of(context).size.height * 0.08,
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Visibility(
              visible: loginProvider.loading,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.h,
    required this.w,
    required this.HintText,
    required this.Message,
    required this.MyIcon,
    required TextEditingController firstNameController,
  }) : _firstNameController = firstNameController;

  final double h;
  final double w;
  final HintText;
  final Message;
  final Icon MyIcon;
  final TextEditingController _firstNameController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: h * 0.05,
      width: w * 0.65,
      child: TextFormField(
        controller: _firstNameController,
        decoration: InputDecoration(
          hintText: HintText,
          prefixIcon: MyIcon,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return Message;
          }
          return null;
        },
      ),
    );
  }
}
