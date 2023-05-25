import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Controllers/graded_provider.dart';
import '../Data/Models/answer.dart';
import '../Data/Models/class_model.dart';

class ViewOneGraded extends StatefulWidget {
  final Class classId; // Add the classId parameter
  final String authToken;
  final String assessID;
  final int duration;

  const ViewOneGraded(
      {super.key,
      required this.classId,
      required this.authToken,
      required this.assessID,
      required this.duration});

  @override
  _ViewOneGradedState createState() => _ViewOneGradedState();
}

class _ViewOneGradedState extends State<ViewOneGraded> {
  Color _A = Colors.grey;
  Color _B = Colors.grey;
  Color _C = Colors.grey;
  Color _D = Colors.grey;
  Color _selected = Colors.lightGreen.shade600;

  int _timer = 62;
  int total_time = 62;
  int _currentQuestion = 1;
  int _totalQuestions = 1;
  String _questionText = '';
  int _index = 1;
  int submit = 0;
  TextEditingController textEditingController =
      TextEditingController(); // Controller for the text field

  String authToken = '';
  String assessID = '';

  @override
  void initState() {
    super.initState();

    assessID = widget.assessID;
    authToken = widget.authToken;

    loadData(assessID, authToken);
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  Future<void> loadData(String assessID, String authToken) async {
    final myProvider = Provider.of<GradedProvider>(context, listen: false);
    try {
      String token = authToken;
      await myProvider.getGradedAssessmentsData(assessID, token, context);
    } catch (error) {
      print("Error Loading Single Assessment");
    }
    _totalQuestions = myProvider.gradedResponse.questions!.length ??
        1; // oneAssess.questions?.length ?? 1;
    _questionText = myProvider.gradedResponse.questions![0]
        .question!; //oneAssess.questions![0].question;
  }

  void _goToQuestion(int questionNumber) {
    setState(() {
      _currentQuestion = questionNumber;
      print("CQ: " + _currentQuestion.toString());
    });
  }

  String myAnswer = '';

  @override
  Widget build(BuildContext context) {
    final myProvider = Provider.of<GradedProvider>(context);

    final classID = widget.classId;

    return myProvider.loading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
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
                                  myProvider.gradedResponse.assessment
                                          ?.assessmentName ??
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
                                                  _goToQuestion(index + 1);
                                                  //  _changeQuestion(_index);
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
                                              myProvider
                                                  .gradedResponse
                                                  .questions![
                                                      _currentQuestion - 1]
                                                  .question!,
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
                                    MediaQuery.of(context).size.height * 0.5,
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        (myProvider
                                                    .gradedResponse
                                                    .questions![
                                                        _currentQuestion - 1]
                                                    .questionType !=
                                                'MCQ')
                                            ? Container(
                                                padding: EdgeInsets.all(16.0),
                                                decoration: BoxDecoration(
                                                  color: Colors.grey[200],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                child: Text(
                                                  "${myProvider.gradedResponse.studentAnswers![_currentQuestion - 1].answer}",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.grey[800],
                                                  ),
                                                ),
                                              )
                                            : Column(
                                                children: [
                                                  SizedBox(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.02),
                                                  SizedBox(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.05,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.8,
                                                    child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        primary: _A,
                                                        foregroundColor:
                                                            Colors.white,
                                                      ),
                                                      child: Text(myProvider
                                                              .gradedResponse
                                                              .questions![
                                                                  _currentQuestion -
                                                                      1]
                                                              .msAnswer[0][
                                                          0]), //oneAssess.questions![_currentQuestion-1].msAnswer[0][0]),
                                                      onPressed: () {},
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.02),
                                                  SizedBox(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.05,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.8,
                                                    child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        primary: _B,
                                                        foregroundColor:
                                                            Colors.white,
                                                      ),
                                                      child: Text(myProvider
                                                          .gradedResponse
                                                          .questions![
                                                              _currentQuestion -
                                                                  1]
                                                          .msAnswer![0][1]),
                                                      onPressed: () {
                                                        //myAnswer = myProvider.oneAssess.questions![_currentQuestion-1].msAnswer[0][1];
                                                      },
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.02),
                                                  SizedBox(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.05,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.8,
                                                    child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        primary: _C,
                                                        foregroundColor:
                                                            Colors.white,
                                                      ),
                                                      child: Text(myProvider
                                                          .gradedResponse
                                                          .questions![
                                                              _currentQuestion -
                                                                  1]
                                                          .msAnswer![0][2]),
                                                      onPressed: () {},
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.02),
                                                  SizedBox(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.05,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.8,
                                                    child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        primary: _D,
                                                        //backgroundColor: _normal,
                                                        foregroundColor:
                                                            Colors.white,
                                                      ),
                                                      child: Text(myProvider
                                                          .gradedResponse
                                                          .questions![
                                                              _currentQuestion -
                                                                  1]
                                                          .msAnswer![0][3]),
                                                      onPressed: () {},
                                                    ),
                                                  ),
                                                  SizedBox(height: 15),
                                                  SizedBox(height: 3),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    decoration: BoxDecoration(
                                                      color: Colors
                                                          .blueAccent[200],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    child: Text(
                                                      "${myProvider.gradedResponse.studentAnswers![_currentQuestion - 1].answer}",
                                                      style: TextStyle(
                                                        fontSize: 18.0,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
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
                        child: (myProvider
                                    .gradedResponse
                                    .questions![_currentQuestion - 1]
                                    .questionType ==
                                'DESCRIPTIVE')
                            ? ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF6CB460),
                                  foregroundColor: Colors.white,
                                ),
                                child: Text("REQUEST REGRADE"),
                                onPressed: () {


                                },
                              )
                            : Text(''),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
  }
}
//   if (_index !=
//       myProvider.oneAssess.questions!.length - 1) {
//     _index++;
//   }
// }
