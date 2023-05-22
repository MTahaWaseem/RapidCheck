import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp/Account%20Screens/reset_password.dart';
import 'package:fyp/Account%20Screens/signup.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Controllers/login_provider.dart';
import '../nav_bar.dart';

Color _buttonColorTeacher = Colors.grey.shade500;
Color _buttonColorStudent = Colors.blue.shade900;

bool teacher = false;
bool student = true;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool _obscurePassword = true;
  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  @override
  void initState() {
    super.initState();

    // Refresh the provider values
    Provider.of<LoginProvider>(context, listen: false).refresh();

    // Other actions you may need to perform after refreshing
    // ...
  }

  @override
  Widget build(BuildContext context) {
    final passwordController = TextEditingController();
    final loginProvider = Provider.of<LoginProvider>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
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
          Positioned(
            top: (MediaQuery.of(context).size.height) * 0.05,
            left: (MediaQuery.of(context).size.width) * 0.1,
            right: MediaQuery.of(context).size.width * 0.1,
            child: Image.asset(
              'assets/images/logo.jpeg',
              height: (MediaQuery.of(context).size.height) * 0.15,
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
                height: (MediaQuery.of(context).size.height) * 0.50,
                width: MediaQuery.of(context).size.width * 0.8,
              ),
            ),
          ),
          Stack(
            children: [
              Positioned(
                top: (MediaQuery.of(context).size.height) * 0.28,
                left: MediaQuery.of(context).size.width * 0.1,
                right: MediaQuery.of(context).size.width * 0.1,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: (MediaQuery.of(context).size.height) * 0.06,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Arial',
                    ),
                  ),
                ),
              ),
              Positioned(
                  top: (MediaQuery.of(context).size.height) * 0.38,
                  left: MediaQuery.of(context).size.width * 0.15,
                  right: MediaQuery.of(context).size.width * 0.15,
                  child: SizedBox(
                    //height: MediaQuery.of(context).size.height * 0.1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: (MediaQuery.of(context).size.height) * 0.05,
                          child: ElevatedButton(
                            onPressed: () {
                              if (student) {
                                setState(() {
                                  _buttonColorTeacher = Colors.blue.shade900;
                                  _buttonColorStudent = Colors.grey.shade500;
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
                          height: (MediaQuery.of(context).size.height) * 0.05,
                          child: ElevatedButton(
                            onPressed: () {
                              if (teacher) {
                                setState(() {
                                  _buttonColorTeacher = Colors.grey.shade500;
                                  _buttonColorStudent = Colors.blue.shade900;
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
                  )),
              Positioned(
                top: (MediaQuery.of(context).size.height) * 0.48,
                left: MediaQuery.of(context).size.width * 0.18,
                right: MediaQuery.of(context).size.width * 0.18,
                child: SizedBox(
                  height: (MediaQuery.of(context).size.height) * 0.045,
                  width: MediaQuery.of(context).size.width * 0.1,
                  child: TextFormField(
                    onChanged: loginProvider.updateEmail,
                    decoration: InputDecoration(
                        hintText: 'Email',
                        prefixIcon: Icon(Icons.email),
                        contentPadding: EdgeInsets.symmetric(vertical: 1)),
                  ),
                ),
              ),
              Positioned(
                top: (MediaQuery.of(context).size.height) * 0.56,
                left: MediaQuery.of(context).size.width * 0.18,
                right: MediaQuery.of(context).size.width * 0.18,
                child: SizedBox(
                  height: (MediaQuery.of(context).size.height) * 0.045,
                  width: MediaQuery.of(context).size.width * 0.1,
                  child: TextFormField(
                    onChanged: loginProvider.updatePassword,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        onPressed: _togglePasswordVisibility,
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 1)
                    ),
                  ),
                ),
              ),
              Positioned(
                top: (MediaQuery.of(context).size.height) * 0.62,
                right: MediaQuery.of(context).size.width * 0.15,
                bottom: (MediaQuery.of(context).size.height) * 0.32,
                child: SizedBox(
                  height: (MediaQuery.of(context).size.height) * 0.03,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResetPassword()),
                        );
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: (MediaQuery.of(context).size.height) * 0.815,
                left: MediaQuery.of(context).size.width * 0.1,
                right: MediaQuery.of(context).size.width * 0.1,
                child: Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Signup()),
                      );
                    },
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: (MediaQuery.of(context).size.height) * 0.03,
                          color: Colors.orange,
                        ),
                        children: [
                          TextSpan(
                            text: 'Signup',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: ' Instead?'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: (MediaQuery.of(context).size.height) * 0.75 -
                (MediaQuery.of(context).size.height) * 0.045,
            left: MediaQuery.of(context).size.width * 0.50 -
                (MediaQuery.of(context).size.height) * 0.045,
            child: Container(
              height: (MediaQuery.of(context).size.height) * 0.09,
              width: (MediaQuery.of(context).size.height) * 0.09,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    (MediaQuery.of(context).size.height) * 0.045),
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: (MediaQuery.of(context).size.height) * 0.75 -
                (MediaQuery.of(context).size.height) * 0.04,
            left: MediaQuery.of(context).size.width * 0.50 -
                (MediaQuery.of(context).size.height) * 0.04,
            child: GestureDetector(
              onTap: () async {
                String role = 'TEACHER';
                if (student) {
                  role = 'STUDENT';
                }

                await loginProvider.getPostData(
                    role, context);

                if (loginProvider.user.success) {

                  String authToken = loginProvider.user.authToken;

                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setBool('isLoggedIn', true);
                  await prefs.setString('authToken', authToken);
                  if (teacher) {
                    await prefs.setBool('isTeacher', true);
                  }else{
                    await prefs.setBool('isTeacher', false);
                  }

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Navbar()),
                  );
                }
              },
              child: Container(
                width: (MediaQuery.of(context).size.height) * 0.08,
                height: (MediaQuery.of(context).size.height) * 0.08,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue.shade900,
                ),
                child: Icon(
                  Icons.arrow_right_alt,
                  color: Colors.white,
                  size: (MediaQuery.of(context).size.height) * 0.08,
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
