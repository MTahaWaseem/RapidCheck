import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fyp/Data/Models/get_one_asses_model.dart';
import 'package:provider/provider.dart';
import '../Controllers/take_assessment_provider.dart';
import '../Data/Models/answer.dart';
import '../Data/Models/class_model.dart';

class TakeAssessment extends StatefulWidget {
  final Class classId; // Add the classId parameter
  final String authToken;
  final String assessID;

  const TakeAssessment(
      {super.key,
      required this.classId,
      required this.authToken,
      required this.assessID});

  @override
  _TakeAssessmentState createState() => _TakeAssessmentState();
}

class _TakeAssessmentState extends State<TakeAssessment> {
  int _timer = 62;
  int total_time = 62;
  late Timer _countdownTimer;
  int _currentQuestion = 1;
  int _totalQuestions = 1;
  String _questionText = '';
  int _index = 1;
  int submit = 0;
  TextEditingController textEditingController = TextEditingController(); // Controller for the text field


  String authToken = '';
  String assessID = '';

  List<Answer> answers = [];

  @override
  void initState() {
    super.initState();

    assessID = widget.assessID;
    authToken = widget.authToken;

    loadData(assessID, authToken);

    _countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_timer > 0) {
          _timer--;
          if (_timer / total_time <= 0.1) {
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
    textEditingController.dispose();
    super.dispose();
  }

  Future<void> loadData(String assessID, String authToken) async {
    final myProvider =
        Provider.of<TakeAssessmentProvider>(context, listen: false);
    try {
      String token = authToken;
      await myProvider.getOneAssessmentData(assessID, token, context);
    } catch (error) {
      print("Error Loading Single Assessment");
    }
    _totalQuestions = myProvider.oneAssess.questions?.length ?? 1;
    _questionText = myProvider.oneAssess.questions![0].question;
  }

  void _goToQuestion(int questionNumber) {
    setState(() {
      _currentQuestion = questionNumber;
    });
  }

  void _changeQuestion(int questionNumber) {
    final myProvider =
        Provider.of<TakeAssessmentProvider>(context, listen: false);
    setState(() {
      _questionText = myProvider.oneAssess.questions![questionNumber].question;
    });
  }

  Color _progressColor = Colors.lightGreen.shade600;
  String myAnswer = '';


  void clearTextField() {
    setState(() {
      myAnswer = ''; // Clear the answer variable
      textEditingController.clear(); // Clear the text field
    });
  }

  @override
  Widget build(BuildContext context) {
    final myProvider = Provider.of<TakeAssessmentProvider>(context);
    final List<Question> questions = myProvider.oneAssess.questions ?? [];

    final classID = widget.classId;

    //print("Question list length " + questions.length.toString());

    return myProvider.loading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              double progress = _timer / total_time;
              double progressBarWidth = constraints.maxWidth * 230.0;
              double buttonWidth = (constraints.maxWidth * 0.8) / 5;
              double gapWidth = constraints.maxWidth * 0.025;
              double buttonHeight = 40.0;
              double fontSize = 16.0;

              return Scaffold(
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(35),
                  child: AppBar(
                    automaticallyImplyLeading: true,
                    backgroundColor: Colors.orange,
                  ),
                ),
                body: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
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
                    Card(
                      color: Colors.white,
                      elevation: 30,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.9,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              SizedBox(height: 20.0),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Text(
                                  myProvider
                                          .oneAssess.assessment?.assessmentName
                                          .toString() ??
                                      '',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Text(
                                  classID.className + " " + classID.courseCode,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF6096B4),
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
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: SizedBox(
                                            width: progressBarWidth,
                                            height: 24.0,
                                            child: LinearProgressIndicator(
                                              value: progress,
                                              backgroundColor:
                                                  Colors.grey.shade300,
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                      _progressColor),
                                            ),
                                          ),
                                        ),
                                        Positioned.fill(
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              '${(_timer ~/ 60).toString().padLeft(2, '0')}:${(_timer % 60).toString().padLeft(2, '0')}',
                                              style: TextStyle(
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 16.0),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: List.generate(
                                          _totalQuestions,
                                          (index) => Row(
                                            children: [
                                              ElevatedButton(
                                                child: Text('${index + 1}'),
                                                onPressed: () {
                                                  // _index = index;
                                                  // print(index);
                                                  // print(_index);
                                                  // _goToQuestion(index + 1);
                                                  // _changeQuestion(index);
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  primary: _currentQuestion ==
                                                          index + 1
                                                      ? Colors.blue.shade800
                                                      : Colors.grey,
                                                  minimumSize: Size(buttonWidth,
                                                      buttonHeight),
                                                  padding: EdgeInsets.zero,
                                                  textStyle: TextStyle(
                                                      fontSize: fontSize),
                                                ),
                                              ),
                                              SizedBox(width: gapWidth),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Card(
                                  color: Color(0xFF6096B4),
                                  elevation: 10,
                                  child: Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Center(
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.vertical,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              _questionText,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.325,
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Text(
                                        //   'Title',
                                        //   style: TextStyle(
                                        //     fontWeight: FontWeight.bold,
                                        //     fontSize: 16.0,
                                        //   ),
                                        // ),
                                        SizedBox(height: 8.0),

                                        TextFormField(
                                          controller: textEditingController,
                                          maxLines: null, // Allows unlimited lines
                                          minLines: 1, // Minimum of 1 line
                                          decoration: InputDecoration(
                                            hintText: 'Enter your response',
                                            filled: true, // Set to true to fill background
                                            fillColor: Color(0xFFF8F6F0), // Set background color to #DBE9FA
                                            hintStyle: TextStyle(color: Colors.grey), // Set hint text color to black
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.grey), // Set border color to black
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.black), // Set border color to black
                                            ),
                                          ),
                                          style: TextStyle(color: Colors.black),
                                          onChanged: (value) {
                                            setState(() {
                                              myAnswer = value; // Update the answer string on text field change
                                            });
                                          },
                                        )

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 30,
                      child: SizedBox(
                        height: 40,
                        width: 200,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: (_currentQuestion == _totalQuestions) ? Color(0xFF6CB460) : Color(0xFF6096B4) ,
                            foregroundColor: Colors.white,
                          ),
                          child: (_currentQuestion == _totalQuestions) ? Text("SUBMIT") : Text("NEXT"),
                          onPressed: () async {

                            print("Index: " + _index.toString());
                            if (_currentQuestion != _totalQuestions){
                              _goToQuestion(_index + 1);
                              _changeQuestion(_index);
                            }
                            print("After 2 methods " + _currentQuestion.toString());
                            setState(() {
                              Answer _myAnswer = Answer(
                                  questionId: myProvider.oneAssess.questions![_currentQuestion-1].id,
                                  answer: myAnswer
                              );
                              print("My answer is: " + _myAnswer.answer.toString());
                              answers.add(_myAnswer);
                              print("Inside SET STATE and submit is " + submit.toString() + _currentQuestion.toString());
                              clearTextField(); // Add the answer string to the list on button press
                            });
                            if (submit == 1){
                              await myProvider.submitAnswerData(assessID, total_time - _timer, answers, authToken, context);
                            }
                            if (_currentQuestion == _totalQuestions){
                              submit = 1;
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
  }
}
