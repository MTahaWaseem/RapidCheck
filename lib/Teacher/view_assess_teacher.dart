import 'package:flutter/material.dart';
import 'package:fyp/Teacher/post_assessment.dart';

import '../Data/Models/assessment_model.dart';

class ViewAssessmentsTeacher extends StatefulWidget {
  const ViewAssessmentsTeacher({Key? key}) : super(key: key);

  @override
  State<ViewAssessmentsTeacher> createState() => _ViewAssessmentsTeacherState();
}

// For DropDown Container
final Color background = Colors.white;
final Color fill = Color(0xFF6096B4);
final double fillPercent = 20; // fills 56.23% for container from bottom
final double fillStop = (100 - fillPercent) / 100;
final List<double> stops = [0.0, fillStop, fillStop, 1.0];
final List<Color> gradient = [
  background,
  background,
  fill,
  fill,
];

// For Quizzes Container
final Color background2 = Color(0xFFBDCDD6);
final Color fill2 = Colors.white; // Active Quiz
final Color fill3 = Color(0xFF6096B4); // Ungraded
final Color fill4 = Color(0xFF6CB460); // Graded
final Color fill5 = Color(0xFF962929); // Cancelled
final double fillPercent2 = 70; // fills 56.23% for container from bottom
final double fillStop2 = (100 - fillPercent2) / 100;
final List<double> stops2 = [0.0, fillStop2, fillStop2, 1.0];

final List<Color> active = [
  background2,
  background2,
  fill2,
  fill2,
];

final List<Color> ungraded = [
  background2,
  background2,
  fill3,
  fill3,
];

final List<Color> graded = [
  background2,
  background2,
  fill4,
  fill4,
];

final List<Color> cancelled = [
  background2,
  background2,
  fill5,
  fill5,
];

class _ViewAssessmentsTeacherState extends State<ViewAssessmentsTeacher> {
  // Setting initial value for Dropdown
  String dropdownValue = 'Active';

//Testing ListBuilder
  List<AssessmentModel> assess = [];

  @override
  void initState() {
    super.initState();
    AssessmentModel result = new AssessmentModel();
    print(assess.length);
    assess.add(result);
    assess.add(result);assess.add(result);assess.add(result);assess.add(result);assess.add(result);assess.add(result);assess.add(result);
  }

  @override
  Widget build(BuildContext context) {
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
                  MainText(w, "Physics Evening"),
                  SubText(w, h, "PHY-9055"),
                  Stack(
                    children: [
                      Container(
                          height: _filteredAssessments.length < 2 ? 400 : 585,
                          color: Color(0xFFF4F4F4)),
                      Positioned(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(20, h / 32, 20, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10, right: 10),
                                child: Material(
                                  elevation: 3,
                                  shadowColor: Colors.grey,
                                  borderRadius: BorderRadius.circular(20),
                                  child: Ink(
                                    decoration: BoxDecoration(
                                      //color: Color(0xFF6096B4),
                                        color: Color(0xFF6096B4),
                                        borderRadius: BorderRadius.all(Radius.circular(20))),
                                    child: InkWell(
                                      borderRadius: BorderRadius.all(Radius.circular(20)),
                                      splashColor: Colors.blueGrey, // Splash color
                                      onTap: () => Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => PostAssessment(
                                              // Some parameter here?
                                            )),
                                      ),// Some Dialog Box
                                      child: Container(
                                        width: 290,
                                        height: 55,
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            children: [
                                              SizedBox(width: 20),
                                              Icon(Icons.add,
                                                  color: Colors.white),
                                              SizedBox(width: 20),
                                              Text("Create Assessment",
                                                style: TextStyle(color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18
                                                ),),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                'Class Assessments',
                                style: TextStyle(
                                  color: Color(0xFF737373),
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Dropdown(w),
                              SizedBox(
                                height: 20,
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
            top: h * 0.415,
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
                                colors: _filteredAssessments[index].status ==
                                    "Active"
                                    ? active
                                    : _filteredAssessments[index].status ==
                                    "Graded"
                                    ? graded
                                    : _filteredAssessments[index].status ==
                                    "Ungraded"
                                    ? ungraded
                                    : cancelled,
                                stops: stops2,
                                end: Alignment.centerRight,
                                begin: Alignment.centerLeft,
                              ),
                              borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                          child: InkWell(
                            splashColor: Colors.grey, // Splash color
                            onTap: () => print(
                                _filteredAssessments[index].totalMarks + index),
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
                                          _filteredAssessments[index]
                                              .assessmentName,
                                          style: TextStyle(
                                            color: Color(0xFF6096B4),
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
                                      SizedBox(width: 38),
                                      Icon(
                                        Icons.timer_outlined,
                                        color: Color(0xFF6096B4),
                                      ),
                                      Text(
                                        '20 min',
                                        style: TextStyle(
                                          color: Color(0xFF6096B4),
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 45),

                                      _filteredAssessments[index].status ==
                                          "Graded"
                                          ? Text(
                                        _filteredAssessments[index]
                                            .obtainedMarks.toInt()
                                            .toString() +
                                            "/" +
                                            _filteredAssessments[index]
                                                .totalMarks.toInt()
                                                .toString(),
                                        style: TextStyle(
                                          color: Color(0xFF6096B4),
                                          fontSize: 19.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                          : Padding(
                                        padding: const EdgeInsets.only(left: 18.0),
                                        child: Text(
                                          "/" +
                                              _filteredAssessments[index]
                                                  .totalMarks.toInt()
                                                  .toString(),
                                          style: TextStyle(
                                            color: Color(0xFF6096B4),
                                            fontSize: 23.0,
                                            fontWeight: FontWeight.bold,
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

  Material Dropdown(double w,) {
    return Material(
      elevation: 3,
      shadowColor: Colors.grey,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: gradient,
              stops: stops,
              end: Alignment.centerRight,
              begin: Alignment.centerLeft,
            ),
            borderRadius: BorderRadius.all(
                Radius.circular(10))),
        child: DropdownButton<String>(
          value: dropdownValue,
          icon: Padding(
              padding: EdgeInsets.only(right: w / 20),
              child:
              Icon(Icons.arrow_downward_rounded)),
          iconEnabledColor: Colors.white,
          isExpanded: true,
          iconSize: 24,
          elevation: 16,
          style: TextStyle(color: Colors.deepPurple),
          underline: Container(),
          onChanged: (String? newValue) {
            if (newValue != null) {
              setState(() {
                dropdownValue = newValue;
              });
            }
          },
          items: <String>[
            'Active',
            'Inactive',
            'Expired',
          ].map<DropdownMenuItem<String>>(
                  (String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                    padding:
                    const EdgeInsets.only(left: 30),
                    child: Text(
                      value,
                      style: TextStyle(
                        color: Color(0xFF737373),
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }).toList(),
        ),
      ),
    );
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

  List<AssessmentModel> get _filteredAssessments {
    return assess.where((item) => item.status == dropdownValue).toList();
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
