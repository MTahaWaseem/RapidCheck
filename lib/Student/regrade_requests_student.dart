import 'package:flutter/material.dart';
import 'package:fyp/Teacher/post_assessment.dart';

import '../Data/Models/assessment_model.dart';

class RegradeRequestsStudent extends StatefulWidget {
  const RegradeRequestsStudent({Key? key}) : super(key: key);

  @override
  State<RegradeRequestsStudent> createState() => _RegradeRequestsStudentState();
}

// For DropDown Container
final Color background = Colors.white;
final Color fill = Color(0xFF6096B4);
final double fillPercent = 20;
final double fillStop = (100 - fillPercent) / 100;
final List<double> stops = [0.0, fillStop, fillStop, 1.0];
final List<Color> gradient = [
  background,
  background,
  fill,
  fill,
];

// For Quizzes Container
final Color background2 = Color(0xFF6EAACB);
final Color fill2 = Color(0XFF6096B4);
final double fillPercent2 = 70;
final double fillStop2 = (100 - fillPercent2) / 100;
final List<double> stops2 = [0.0, fillStop2, fillStop2, 1.0];

// for marks obtained container
final double fillPercent3 = 30;
final double fillStop3 = (100 - fillPercent3) / 100;
final List<double> stops3 = [0.0, fillStop3, fillStop3, 1.0];


final List<Color> marks = [
  Color(0xff6096B4),
  Color(0xff6096B4),
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
                  MainText(w, "Taha Waseem"),
                  SubText(w, h, "PHY-9055"),
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
                itemCount: assess.length,
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
                            onTap: () => print(
                                assess[index].totalMarks + index),
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
                                          assess[index]
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

                                      assess[index].status ==
                                          "Graded"
                                          ? Text(
                                        assess[index]
                                            .obtainedMarks.toInt()
                                            .toString() +
                                            "/" +
                                            assess[index]
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
                                              assess[index]
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
