import 'package:flutter/material.dart';
import 'package:fyp/Teacher/grade_assess.dart';
import 'package:fyp/Teacher/post_announcement.dart';
import 'package:fyp/Teacher/regrade_requests.dart';
import 'package:fyp/Teacher/view_assess_teacher.dart';
import 'package:fyp/Teacher/view_students.dart';
import '../Data/Models/class_model.dart';

class ViewClassTeacher extends StatefulWidget {
  final Class classId; // Add the classId parameter

  const ViewClassTeacher({Key? key, required this.classId}) : super(key: key);

  @override
  State<ViewClassTeacher> createState() => _ViewClassTeacherState();
}


class _ViewClassTeacherState extends State<ViewClassTeacher> {


  List<ClassModel> classes = [];

  @override
  void initState() {

    Class _class = widget.classId;

    super.initState();
    ClassModel result = new ClassModel();
    print(classes.length);
    classes.add(result);
    classes.add(result);
    classes.add(result);
  }

  @override
  Widget build(BuildContext context) {
    Class _class = widget.classId;
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(35),
        child: AppBar(

          leading: BackButton(
              color: Colors.black
          ),
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
                  SizedBox(height: 10),
                  SubText(w, _class.courseCode),
                  SizedBox(height: 20),
                  Stack(
                    children: [
                      Container(
                          height: classes.length < 3 ? 400 : 585,
                          color: Color(0xFFF4F4F4)),

                      Positioned(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
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
                                              builder: (context) => RegradeRequests(

                                              )
                                          ),
                                        ),
                                        child: Container(
                                          width: 130,
                                          height: 90,
                                          child: Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Padding(
                                                padding: const EdgeInsets.all(10.0),
                                                child: Text("Regrade\nRequests",
                                                  style: TextStyle(color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 15
                                                  ),),
                                              )),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top:8.0),
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
                                              builder: (context) => ViewAssessmentsTeacher(classId: _class
                                              )),
                                        ),
                                        child: Container(
                                          width: 197,
                                          height: 90,
                                          child: Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Padding(
                                                padding: const EdgeInsets.all(10.0),
                                                child: Text("Assessments",
                                                  style: TextStyle(color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 15
                                                  ),),
                                              )),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 7),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
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
                                              builder: (context) => ViewStudents(classId: _class,
                                              )),
                                        ),
                                        child: Container(
                                          width: 130,
                                          height: 90,
                                          child: Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Padding(
                                                padding: const EdgeInsets.all(10.0),
                                                child: Text("Students",
                                                  style: TextStyle(color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 15
                                                  ),),
                                              )),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
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
                                              builder: (context) => PostAnnouncement(
                                                // Some parameter here?
                                              )),
                                        ),
                                        child: Container(
                                          width: 197,
                                          height: 90,
                                          child: Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Padding(
                                                padding: const EdgeInsets.all(10.0),
                                                child: Text("Announcements",
                                                  style: TextStyle(color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 15
                                                  ),),
                                              )),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
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
                                          builder: (context) => GradeAssess(

                                          )
                                      ),
                                    ),
                                    child: Container(
                                      width: w * 0.87,
                                      height: 90,
                                      child: Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text("Grade Unchecked Assessments",
                                              style: TextStyle(color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15
                                              ),),
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(left:32.0, top: 30),
                                child: Text(
                                      "Recent Announcements",
                                      style: TextStyle(
                                        color: Color(0xFF737373),
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
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
          Positioned(
            top: h * 0.575,
            left: w / 8,
            right: w / 8,
            bottom: 0,
            child: ListView.builder(
                itemCount: classes.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Material(
                        elevation: 5,
                        shadowColor: Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          height: 80,
                          width: 300,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0, right: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 13),
                                Text(
                                  'Update Title',
                                  style: TextStyle(
                                    color: Color(0xFF6096B4),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 7),
                                Text(
                                  'Update description will come here perhaps lots of text',
                                  style: TextStyle(
                                    color: Color(0xFF6096B4),
                                    fontSize: 12.0,
                                    //fontWeight: FontWeight.bold,
                                  ),
                                ),

                              ],
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

  Padding SubText(double w, String text) {
    return Padding(
      padding: EdgeInsets.fromLTRB(w / 16, 0, 0, 0),
      child: Text(
        text,
        style: TextStyle(
          color: Color(0xFF737373),
          fontSize: 18.0,
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
            height: MediaQuery.of(context).size.height * 0.33,
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
