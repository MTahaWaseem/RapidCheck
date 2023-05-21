import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fyp/Student/text_box.dart';


class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _timer = 180;
  int total_time = 180;
  late Timer _countdownTimer;
  int _currentQuestion = 1;
  int _totalQuestions = 10;

  @override
  void initState() {
    super.initState();
    _countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_timer > 0) {
          _timer--;
          if (_timer/total_time <= 0.1) {
// change progress bar color to red when 10 seconds or less remaining
            _progressColor = Colors.red;
          }
        } else {
          _countdownTimer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _countdownTimer.cancel();
    super.dispose();
  }

  void _goToQuestion(int questionNumber) {
    setState(() {
      _currentQuestion = questionNumber;
    });
  }

  Color _progressColor = Colors.lightGreen.shade600;

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double progress = _timer / total_time;
        double progressBarWidth = constraints.maxWidth * 230.0;
        double buttonWidth = (constraints.maxWidth - 32) / _totalQuestions;
        double buttonHeight = 40.0;
        double fontSize = 16.0;
        return Scaffold(
          // appBar: AppBar(
          //   title: Text('Quiz'),
          // ),
          body: Stack(
            alignment: AlignmentDirectional.center,
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
              Card(
                color: Colors.white,
                elevation: 30,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.9,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Column(
                    children: [
                      SizedBox(height: 20.0),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Text(
                          "Quiz 3",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Text(
                          "Phy 504 - Physics",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: Colors.blue.shade800,
                          ),
                        ),
                      ),
                      SizedBox(height: 8.0),

                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(20.0),


                        child: Column(
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: SizedBox(
                                    width: progressBarWidth,
                                    height: 24.0,
                                    child: LinearProgressIndicator(
                                      value: progress,
                                      backgroundColor: Colors.grey.shade300,
                                      valueColor: AlwaysStoppedAnimation<Color>(_progressColor),
                                    ),
                                  ),
                                ),
                                Positioned.fill(
                                  child: Align(
                                    alignment: Alignment.center,


                                    child: Text(
                                      '${(_timer ~/ 60).toString().padLeft(2, '0')}:${(_timer % 60).toString().padLeft(2, '0')}',
                                      style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),


                            SizedBox(height: 16.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(
                                _totalQuestions,
                                    (index) => ElevatedButton(
                                  child: Text('${index + 1}'),
                                  onPressed: () {
                                    _goToQuestion(index + 1);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: _currentQuestion == index + 1
                                        ? Colors.blue.shade800
                                        : Colors.grey,
                                    minimumSize: Size(buttonWidth, buttonHeight),
                                    padding: EdgeInsets.zero,
                                    textStyle: TextStyle(fontSize: fontSize),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
// Code to display the quiz questions and answers goes here

                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.20,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Card(
                          color: Colors.blue.shade800,
                          elevation: 30,
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'What is the capital of France?',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0,

                                      //fontWeight: FontWeight.bold,
                                    ),
                                  ),


                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      // SizedBox(
                      //   width: MediaQuery.of(context).size.width * 0.8,
                      //   child: Card(
                      //     color: Colors.grey.shade400,
                      //     elevation: 30,
                      //     child: Padding(
                      //       padding: EdgeInsets.all(16.0),
                      //       child: Column(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           Text(
                      //             'Enter your response here:',
                      //             style: TextStyle(
                      //               fontSize: 15.0,
                      //               //color: Colors.white
                      //               fontWeight: FontWeight.bold,
                      //             ),
                      //           ),
                      //
                      //           SizedBox(height: 16.0),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),

                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.325,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Text(
                                //   'Title',
                                //   style: TextStyle(
                                //     fontWeight: FontWeight.bold,
                                //     fontSize: 16.0,
                                //   ),
                                // ),
                                SizedBox(height: 8.0),
                                Textbox(),
                              ],
                            ),
                          ),
                        ),
                      ),



                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.height * 0.08,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade800,
                    foregroundColor: Colors.white,
                  ),
                  child: Text("Next"),
                  onPressed: (){},
                ),
              ),
            ],

          ),
        );
      },
    );
  }
}
