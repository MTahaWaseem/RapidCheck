import 'package:flutter/material.dart';
import 'package:fyp/Teacher/view_class.dart';
import '../Data/Models/class_model.dart';

class ViewClassesTeacher extends StatefulWidget {
  const ViewClassesTeacher({Key? key}) : super(key: key);

  @override
  State<ViewClassesTeacher> createState() => _ViewClassesTeacherState();
}
String className = ''; //
// For Quizzes Container
final Color background2 = Color(0xFFBDCDD6);
final Color fill2 = Colors.white; // Active Quiz
final double fillPercent2 = 70; // fills 70%
final double fillStop2 = (100 - fillPercent2) / 100;
final List<double> stops2 = [0.0, fillStop2, fillStop2, 1.0];

final List<Color> active = [
  background2,
  background2,
  fill2,
  fill2,
];

class _ViewClassesTeacherState extends State<ViewClassesTeacher> {
//Testing ListBuilder
  List<ClassModel> classes = [];

  @override
  void initState() {
    super.initState();
    ClassModel result = new ClassModel();
    print(classes.length);
    classes.add(result);
    classes.add(result);
    classes.add(result);
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
            bottom: h / 16,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              elevation: 5.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: h / 25,
                  ),
                  MainText(w, "Physics Coaching"),
                  SizedBox(height: 10),
                  SubText(w, "PHY-019"),
                  SizedBox(height: 15),
                  Stack(
                    children: [
                      Container(
                          height: classes.length < 3 ? 400 : 585,
                          color: Color(0xFFF4F4F4)),
                      Positioned(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(20, 22, 20, 0),
                          child: Row(
                            children: [
                              SizedBox(width: 20),
                              Text(
                                "My Classes",
                                style: TextStyle(
                                  color: Color(0xFF737373),
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 32),
                              SizedBox(
                                width: 135,
                                child: ElevatedButton(

                                  child: Row(
                                    children: [
                                      Icon(Icons.add),
                                      SizedBox(width: 20),
                                      Text(
                                        'Class',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xFF6096B4),
                                  ),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (ctx) => AlertDialog(
                                        title: Text(
                                          "Enter Class Name",
                                          style: TextStyle(
                                            color: Color(0xFF6096B4),
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        content: TextField(
                                          onChanged: (value) {
                                            className = value; // update the class name as the user types
                                          },
                                          //decoration: InputDecoration(hintText: 'Enter Course Name'),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              ClassModel result = new ClassModel();
                                              classes.add(result);
                                              setState(() {
                                              });
                                              // Method Call to add course name
                                              Navigator.of(ctx).pop();
                                            },
                                            child: Container(
                                              width: 100,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF6096B4),
                                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                              ),
                                              //color: Color(0xFF6096B4),
                                              padding: const EdgeInsets.all(14),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "Add",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
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
            top: 215,
            left: w / 8,
            right: w / 8,
            bottom: h / 11,
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
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            splashColor: Colors.blueGrey, // Splash color
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => ViewClass(
                                    // Tell Class ID Here

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
                                          classes[index].className,
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
                                        Icons.person,
                                        color: Color(0xFF6096B4),
                                      ),
                                      Text(
                                        'Teacher Name',
                                        style: TextStyle(
                                          color: Color(0xFF6096B4),
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 45),
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
