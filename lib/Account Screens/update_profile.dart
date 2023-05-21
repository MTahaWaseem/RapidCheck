import 'package:flutter/material.dart';

Color _buttonColorTeacher = Colors.grey.shade500;
Color _buttonColorStudent = Colors.blue.shade900;

bool teacher = false;
bool student = true;


class update_profile extends StatefulWidget {
  @override
  _updateState createState() => _updateState();
}

class _updateState extends State<update_profile> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _usernameController = TextEditingController();


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
            top: MediaQuery.of(context).size.height * 0.05,
            left: MediaQuery.of(context).size.width * 0.1,
            right: MediaQuery.of(context).size.width * 0.1,
            child: Image.asset(
              'assets/images/logo.png',
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
                height: MediaQuery.of(context).size.height * 0.50,
                width: MediaQuery.of(context).size.width * 0.8,
              ),
            ),
          ),




          Stack(
            children: [
              Positioned(
                top: MediaQuery.of(context).size.height * 0.29,
                left: MediaQuery.of(context).size.width * 0.1,
                right: MediaQuery.of(context).size.width * 0.1,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'UPDATE PROFILE',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.04,
                      fontWeight: FontWeight.bold,
                    ),
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
                top: MediaQuery.of(context).size.height * 0.48,
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
                top: MediaQuery.of(context).size.height * 0.56,
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

            ],
          ),


          Positioned(
            top: MediaQuery.of(context).size.height * 0.75 - MediaQuery.of(context).size.height * 0.045,
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
            top: MediaQuery.of(context).size.height * 0.75 - MediaQuery.of(context).size.height * 0.04,
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
