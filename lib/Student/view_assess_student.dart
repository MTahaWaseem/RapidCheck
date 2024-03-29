import 'package:flutter/material.dart';
import 'package:fyp/Student/take_assessment.dart';
import 'package:fyp/Student/view_class_student.dart';
import 'package:fyp/Student/view_one_graded.dart';
import '../Data/Models/class_model.dart';
import '../Data/Models/get_assessments_model.dart';

class ViewAssessStudent extends StatefulWidget {
  final Class classId; // Add the classId parameter
  final String authToken;
  final List<Assessments> assess;

  const ViewAssessStudent(
      {Key? key,
      required this.classId,
      required this.authToken,
      required this.assess})
      : super(key: key);

  @override
  State<ViewAssessStudent> createState() => _ViewAssessStudentState();
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
final Color background2 = Color(0xFFFFFFFF);
final Color fill2 = Color(0xFF6096B4);  // Active Quiz
final Color fill3 = Color(0xFF6096B4); // Ungraded
final Color fill4 = Color(0xFF6CB460); // Graded
final Color fill5 = Color(0xFFFF6666); // Expired
final Color fill6 = Color(0xFFFF6666); // Expired
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
final List<Color> inactive = [
  background2,
  background2,
  fill6,
  fill6,
];

class _ViewAssessStudentState extends State<ViewAssessStudent> {
  // Setting initial value for Dropdown
  List<Assessments> assess = [];

  String dropdownValue = 'Active';

  @override
  void initState() {
    super.initState();
    authToken = widget.authToken;
  }

  @override
  Widget build(BuildContext context) {
    assess = widget.assess;
    Class _class = widget.classId;
    print(assess.length);

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(35),
        child: AppBar(
          leading: const BackButton(color: Colors.black),
          shape:
              const Border(bottom: BorderSide(color: Colors.black, width: 1)),
          //title: Text('Salam'),
          backgroundColor: const Color(0xFFD2721A),
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
                          height: _filteredAssessments.length < 2 ? 400 : 585,
                          color: Color(0xFFF4F4F4)),
                      Positioned(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(20, h / 32, 20, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
            top: h * 0.32,
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
                                        "ACTIVE"
                                    ? active
                                    : _filteredAssessments[index].status ==
                                            "INACTIVE"
                                        ? inactive
                                        : _filteredAssessments[index].status ==
                                                "GRADED"
                                            ? graded
                                            : _filteredAssessments[index]
                                                        .status ==
                                                    "UNGRADED"
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
                            onTap: (){
                              if (_filteredAssessments[index].status ==
                                  "ACTIVE"){
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => TakeAssessment(
                                          authToken: authToken,
                                          classId: _class,
                                          assessID: _filteredAssessments[index].sId ?? '',
                                          duration: _filteredAssessments[index].duration ?? 120
                                      )),
                                );
                              }else if (_filteredAssessments[index].status ==
                                  "GRADED"){
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => ViewOneGraded(
                                        authToken: authToken,
                                        classId: _class,
                                        assessID: _filteredAssessments[index].sId ?? '',
                                        duration: assess[index].duration ?? 120,
                                      )),
                                );
                              }
                            },
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
                                                  .assessmentName ??
                                              '',
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
                                      SizedBox(width: 30),
                                      Text(
                                        _class.courseCode.substring(4, 7),
                                        style: TextStyle(
                                          color: Color(0xFF6096B4),
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 45),
                                      Icon(Icons.timer_outlined,
                                          color: Colors.white),
                                      Text(
                                        (_filteredAssessments[index]
                                                        .duration! ~/
                                                    60)
                                                .toString() +
                                            ' min',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 45),
                                      _filteredAssessments[index].status ==
                                              "GRADED"
                                          ? Text(
                                              _filteredAssessments[index]
                                                      .obtainedMarks
                                                      .toString() +
                                                  "/" +
                                                  _filteredAssessments[index]
                                                      .totalMarks
                                                      .toString(),
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 19.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          : Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 18.0),
                                              child: Text(
                                                "/" +
                                                    _filteredAssessments[index]
                                                        .totalMarks
                                                        .toString(),
                                                style: TextStyle(
                                                  color: Colors.white,
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

  Material Dropdown(
    double w,
  ) {
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
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: DropdownButton<String>(
          value: dropdownValue,
          icon: Padding(
              padding: EdgeInsets.only(right: w / 20),
              child: Icon(Icons.arrow_downward_rounded)),
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
            'Graded',
            'Ungraded',
            'Expired',
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Padding(
                padding: const EdgeInsets.only(left: 30),
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
      child: Text(
        text,
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

  List<Assessments> get _filteredAssessments {
    return assess
        .where((item) => item.status == dropdownValue.toUpperCase())
        .toList();
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
