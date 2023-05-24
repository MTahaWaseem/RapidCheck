import 'package:flutter/material.dart';
import 'package:fyp/Student/view_class_student.dart';
import 'package:fyp/Student/view_one_graded.dart';
import '../Data/Models/class_model.dart';
import '../Data/Models/get_assessments_model.dart';

class RegradeRequestsStudent extends StatefulWidget {

  final Class classId; // Add the classId parameter
  final String authToken;
  final List<Assessments> assess;

  const RegradeRequestsStudent(
      {Key? key,
        required this.classId,
        required this.authToken,
        required this.assess})
      : super(key: key);

  @override
  State<RegradeRequestsStudent> createState() => _RegradeRequestsStudentState();
}

// For Quizzes Container
final Color background2 = Colors.white;
final Color fill2 = Color(0xFF962929);
final double fillPercent2 = 70;
final double fillStop2 = (100 - fillPercent2) / 100;
final List<double> stops2 = [0.0, fillStop2, fillStop2, 1.0];

// for marks obtained container
final double fillPercent3 = 30;
final double fillStop3 = (100 - fillPercent3) / 100;
final List<double> stops3 = [0.0, fillStop3, fillStop3, 1.0];


final List<Color> marks = [
Color(0xFF962929),
Color(0xFF962929),
  fill2,
  fill2,
];

final List<Color> active = [
  background2,
  background2,
  fill2,
  fill2,
];


class _RegradeRequestsStudentState extends State<RegradeRequestsStudent> {

  List<Assessments> assess = [];
  @override
  void initState() {
    super.initState();
    authToken = widget.authToken;
  }

  @override
  Widget build(BuildContext context) {

    Class _class = widget.classId;
    assess = widget.assess;


    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(35),
        child: AppBar(
          leading: BackButton(color: Colors.black),
          shape: Border(bottom: BorderSide(color: Colors.black, width: 1)),
          //title: Text('Salam'),
          backgroundColor: Color(0xFFD2721A),
        ),
      ),
      body: Stack(
        children: [
          BackgroundScreen(),
          Positioned(
            top: h / 128,
            left: w / 32,
            right: w / 32,
            bottom: -10,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              elevation: 5.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: h / 25,
                  ),
                  MainText(w, _class.className),
                  SubText(w, h, _class.courseCode),
                  Stack(
                    children: [
                      Container(
                          height: assess.length < 2 ? 400 : 585,
                          color: Color(0xFFF4F4F4)),
                      Positioned(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(20, h / 32, 20, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Pending Regrade Requests',
                                style: TextStyle(
                                  color: Color(0xFF737373),
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: h * 0.25,
            left: w / 8,
            right: w / 8,
            bottom: 0,
            child: ListView.builder(
                itemCount: _filteredAssessments.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Material(
                        elevation: 5,
                        shadowColor: Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                        child: Ink(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: active,
                                stops: stops2,
                                end: Alignment.centerRight,
                                begin: Alignment.centerLeft,
                              ),
                              borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                          child: InkWell(
                            splashColor: Colors.grey, // Splash color
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => ViewOneGraded(
                                    authToken: authToken,
                                    classId: _class,
                                    assessID: _filteredAssessments[index].sId ?? '',
                                    duration: assess[index].duration ?? 120,
                                  )),
                            ),
                            child: Container(
                              height: 80,
                              child: Column(
                                children: [
                                  SizedBox(height: 13),
                                  Row(
                                    children: [
                                      SizedBox(width: 28),
                                      Text(
                                        'PHY',
                                        style: TextStyle(
                                          color: Color(0xFF6096B4),
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(left: 50.0),
                                        child: Text(
                                          _filteredAssessments[index].assessmentName ?? '',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 16),
                                  Row(
                                    children: [
                                      SizedBox(width: 25),
                                      Text(
                                        '9055',
                                        style: TextStyle(
                                          color: Color(0xFF6096B4),
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 150),
                                     Text(
                                       _filteredAssessments[index]
                                            .obtainedMarks.toString() +
                                            "/" +
                                           _filteredAssessments[index]
                                                .totalMarks.toString(),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 19.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20)
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }

  List<Assessments> get _filteredAssessments {
    return assess
        .where((item) => item.status == 'REGRADE REQUESTED')
        .toList();
  }



  Padding SubText(double w, double h, String text) {
    return Padding(
      padding: EdgeInsets.fromLTRB(w / 16, h / 128, 0, h / 32),
      child: Text(text,
        style: TextStyle(
          color: Color(0xFF6096B4),
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Padding MainText(double w, String text) {
    return Padding(
      padding: EdgeInsets.fromLTRB(w / 16, 0, 0, 0),
      child: Text(
        text,
        style: TextStyle(
          color: Color(0xFF737373),
          fontSize: 28.0,
          fontWeight: FontWeight.bold,
        ),
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
            height: MediaQuery.of(context).size.height / 3,
            color: Color(0xFFD2721A)),
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
