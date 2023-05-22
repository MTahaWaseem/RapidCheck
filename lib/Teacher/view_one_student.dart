import 'package:flutter/material.dart';
import 'package:fyp/Teacher/post_announcement.dart';
import 'package:fyp/Teacher/regrade_requests_one_student.dart';
import 'package:fyp/Teacher/view_assess_teacher.dart';
import 'package:fyp/Teacher/view_student_assessments.dart';
import 'package:fyp/Teacher/view_students.dart';
import '../Data/Models/class_model.dart';

class ViewOneStudent extends StatefulWidget {
  const ViewOneStudent({Key? key}) : super(key: key);

  @override
  State<ViewOneStudent> createState() => _ViewOneStudentState();
}

String className = ''; //

class _ViewOneStudentState extends State<ViewOneStudent> {
//Testing ListBuilder
  List<ClassModel> classes = [];

  @override
  void initState() {
    super.initState();
    // ClassModel result = ClassModel();
    // classes.add(result);
    // classes.add(result);
    // classes.add(result);
  }

  @override
  Widget build(BuildContext context) {
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
          const BackgroundScreen(),
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
                  mainText(w, "Taha Waseem"),
                  const SizedBox(height: 10),
                  SubText(w, "PHY-012"),
                  const SizedBox(height: 20),
                  Stack(
                    children: [
                      Container(
                          height: classes.length < 3 ? 400 : 585,
                          color: const Color(0xFFF4F4F4)),
                      Positioned(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8, left: 8, right: 8),
                                  child: Material(
                                    color: Color(0xFF6CB460),
                                    elevation: 3,
                                    shadowColor: Colors.grey,
                                    borderRadius: BorderRadius.circular(20),
                                    child: SizedBox(
                                      width: w * 0.5,
                                      height: 100,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 27),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 60),
                                            child: Text(
                                              "87%",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight:
                                                  FontWeight.bold,
                                                  fontSize: 40),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10.0),
                                            child: Text(
                                              "Score",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight:
                                                  FontWeight.bold,
                                                  fontSize: 15),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Material(
                                    color: Color(0xFFEEAE09),
                                    elevation: 3,
                                    shadowColor: Colors.grey,
                                    borderRadius: BorderRadius.circular(20),
                                    child: SizedBox(
                                      width: w * 0.35,
                                      height: 100,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height:27),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 70),
                                            child: Text(
                                              "A",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight:
                                                  FontWeight.bold,
                                                  fontSize: 40),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 10.0),
                                            child: Text(
                                              "Grade",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight:
                                                  FontWeight.bold,
                                                  fontSize: 15),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 7),
                            Material(
                              elevation: 3,
                              shadowColor: Colors.grey,
                              borderRadius: BorderRadius.circular(20),
                              child: Ink(
                                decoration: const BoxDecoration(
                                    color: Color(0xFF6096B4),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20))),
                                child: InkWell(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  splashColor:
                                  Colors.blueGrey, // Splash color
                                  onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        const RegradeRequestsOneStudent(
                                          // Some parameter here?
                                        )),
                                  ),
                                  child: SizedBox(
                                    width: w * 0.87,
                                    height: 90,
                                    child: Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Text(
                                            "Regrade Requests",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight:
                                                FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                        )),
                                  ),
                                ),
                              ),
                            ),const SizedBox(height: 7),
                            Material(
                              elevation: 3,
                              shadowColor: Colors.grey,
                              borderRadius: BorderRadius.circular(20),
                              child: Ink(
                                decoration: const BoxDecoration(
                                    color: Color(0xFF6096B4),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20))),
                                child: InkWell(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  splashColor:
                                  Colors.blueGrey, // Splash color
                                  onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        const ViewStudentAssessments(
                                          // Some parameter here?
                                        )),
                                  ),
                                  child: SizedBox(
                                    width: w * 0.87,
                                    height: h * 0.15,
                                    child: Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Text(
                                            "Student Assessments",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight:
                                                FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                        )
                                    ),
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Positioned(
          //   top: h * 0.58,
          //   left: w / 8,
          //   right: w / 8,
          //   bottom: 0,
          //   child: ListView.builder(
          //       itemCount: classes.length,
          //       itemBuilder: (context, index) {
          //         return Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             Material(
          //               elevation: 5,
          //               shadowColor: Colors.grey,
          //               borderRadius: BorderRadius.circular(20),
          //               child: SizedBox(
          //                 height: 80,
          //                 width: 300,
          //                 child: Padding(
          //                   padding:
          //                   const EdgeInsets.only(left: 20.0, right: 20),
          //                   child: Column(
          //                     mainAxisAlignment: MainAxisAlignment.start,
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: const [
          //                       SizedBox(height: 13),
          //                       Text(
          //                         'Update Title',
          //                         style: TextStyle(
          //                           color: Color(0xFF6096B4),
          //                           fontSize: 16.0,
          //                           fontWeight: FontWeight.bold,
          //                         ),
          //                       ),
          //                       SizedBox(height: 7),
          //                       Text(
          //                         'Update description will come here perhaps lots of text',
          //                         style: TextStyle(
          //                           color: Color(0xFF6096B4),
          //                           fontSize: 12.0,
          //                           //fontWeight: FontWeight.bold,
          //                         ),
          //                       ),
          //                     ],
          //                   ),
          //                 ),
          //               ),
          //             ),
          //             const SizedBox(height: 20)
          //           ],
          //         );
          //       }),
          // )
        ],
      ),
    );
  }

  Padding subText(double w, String text) {
    return Padding(
      padding: EdgeInsets.fromLTRB(w / 16, 0, 0, 0),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF737373),
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Padding mainText(double w, String text) {
    return Padding(
      padding: EdgeInsets.fromLTRB(w / 16, 0, 0, 0),
      child: Text(
        text,
        style: const TextStyle(
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
            color: const Color(0xFFD2721A)),
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
