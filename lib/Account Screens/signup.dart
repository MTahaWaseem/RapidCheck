import 'package:flutter/material.dart';
import 'package:fyp/Account%20Screens/login.dart';

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
              ),
            ),
          ),


          Stack(
            children: [
              Positioned(
                top: MediaQuery.of(context).size.height * 0.17,
                left: MediaQuery.of(context).size.width * 0.1,
                right: MediaQuery.of(context).size.width * 0.1,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'SIGNUP',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.06,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              Positioned(
                  top: MediaQuery.of(context).size.height * 0.27,
                  left: MediaQuery.of(context).size.width * 0.15,
                  right: MediaQuery.of(context).size.width * 0.15,
                  child:SizedBox(
                    //height: MediaQuery.of(context).size.height * 0.1,
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
                          height: MediaQuery.of(context).size.height * 0.05,
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
                  )
              ),

              Positioned(
                top: MediaQuery.of(context).size.height * 0.36,
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
                top: MediaQuery.of(context).size.height * 0.43,
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
                top: MediaQuery.of(context).size.height * 0.5,
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
                top: MediaQuery.of(context).size.height * 0.57,
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
                top: MediaQuery.of(context).size.height * 0.64,
                left: MediaQuery.of(context).size.width * 0.18,
                right: MediaQuery.of(context).size.width * 0.18,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.1,
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
              ),

              Positioned(
                top: MediaQuery.of(context).size.height * 0.71,
                left: MediaQuery.of(context).size.width * 0.18,
                right: MediaQuery.of(context).size.width * 0.18,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.1,
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
              ),


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
            top: MediaQuery.of(context).size.height * 0.85 - MediaQuery.of(context).size.height * 0.045,
            left: MediaQuery.of(context).size.width * 0.50 - MediaQuery.of(context).size.height * 0.045,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.09,
              width: MediaQuery.of(context).size.height * 0.09,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height * 0.045),
                color: Colors.white,
              ),
            ),
          ),

          Positioned(
            top: MediaQuery.of(context).size.height * 0.85 - MediaQuery.of(context).size.height * 0.04,
            left: MediaQuery.of(context).size.width * 0.50 - MediaQuery.of(context).size.height * 0.04,
            child: GestureDetector(
              onTap: () {
                // Handle button tap
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
                  size:MediaQuery.of(context).size.height * 0.08,
                ),
              ),
            ),
          ),


        ],
      ),
    );
  }
}
