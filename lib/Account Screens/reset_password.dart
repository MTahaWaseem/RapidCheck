import 'package:flutter/material.dart';
import 'package:fyp/Account%20Screens/signup.dart';

Color _buttonColorTeacher = Colors.grey.shade500;
Color _buttonColorStudent = Colors.blue.shade900;

bool teacher = false;
bool student = true;


class ResetPassword extends StatefulWidget {
  @override
  _resetState createState() => _resetState();
}

class _resetState extends State<ResetPassword> {



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
            top: MediaQuery.of(context).size.height * 0.05,
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
                height: MediaQuery.of(context).size.height * 0.50,
                width: MediaQuery.of(context).size.width * 0.8,
              ),
            ),
          ),





          Stack(
            children: [
              Positioned(
                top: MediaQuery.of(context).size.height * 0.3,
                left: MediaQuery.of(context).size.width * 0.1,
                right: MediaQuery.of(context).size.width * 0.1,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'RESET PASSWORD',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.035,
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
                    decoration: InputDecoration(
                        hintText: 'Email',
                        prefixIcon: Icon(Icons.email),
                        contentPadding: EdgeInsets.symmetric(vertical: 1)
                    ),
                  ),
                ),
              ),

              Positioned(
                top: MediaQuery.of(context).size.height * 0.5,
                left: MediaQuery.of(context).size.width * 0.18,
                right: MediaQuery.of(context).size.width * 0.15,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                  child: Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {},
                      child: Text('Please follow the steps to reset your password as received in the email.',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.022,
                          color: Colors.grey.shade700,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ),

                ),
              ),

              Positioned(
                top: MediaQuery.of(context).size.height * 0.815,
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
                          fontSize: MediaQuery.of(context).size.height * 0.027,
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
