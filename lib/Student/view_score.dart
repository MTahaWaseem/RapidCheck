import 'package:flutter/material.dart';
import 'package:fyp/Student/view_class_student.dart';
import 'package:fyp/Teacher/view_class_teacher.dart';
import '../Data/Models/class_model.dart';
import '../Teacher/view_classes_teacher.dart';

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


class ViewScore extends StatefulWidget {
  const ViewScore({Key? key}) : super(key: key);

  @override
  State<ViewScore> createState() => _ViewScoreState();
}

class _ViewScoreState extends State<ViewScore> {

  List<ClassModel> classes = [];

  @override
  void initState() {
    super.initState();
    // ClassModel result = new ClassModel();
    // print(classes.length);
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
        preferredSize: Size.fromHeight(35),
        child: AppBar(

          leading: BackButton(
            color: Colors.black,
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
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: h / 25,
                    ),
                    MainText(w, "Physics Evening"),
                    const SizedBox(height: 10),
                    SubText(w, "PHY-013"),
                    const SizedBox(height: 20),
                    SizedBox(height: 25),
                    Stack(
                      children: [
                        Container(
                            height: classes.length < 3 ? 400 : 585,
                            color: Color(0xFFF4F4F4)),
                        Positioned(
                          //left: 160,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(32.0),
                                      child: Text("My Scores", style: TextStyle(
                                        color: Color(0xFF737373),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),),
                                    ),
                                    SizedBox(width:30),
                                    SizedBox(
                                      width: 135,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          shadowColor: Colors.grey,
                                          elevation: 5,
                                          primary: Color(0xFF6CB460),
                                        ),
                                        onPressed: () {
                                          // Download Code Here
                                        },
                                        child: Row(
                                          children: const [
                                            Icon(Icons.file_download_outlined),
                                            SizedBox(width: 10),
                                            Text(
                                              'Download',
                                              style: TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Material(
                                  elevation: 5,
                                  shadowColor: Colors.grey,
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: active,
                                          stops: stops2,
                                          end: Alignment.centerRight,
                                          begin: Alignment.centerLeft,
                                        ),
                                        borderRadius: const BorderRadius.all(Radius.circular(20))),
                                    height: h * 0.15,
                                    width: w * 0.75,
                                    child: Column(
                                      children: [
                                        SizedBox(height: 13),
                                        Row(
                                          children: [
                                            SizedBox(width: 28),
                                            Text(
                                              'rggr',
                                              style: TextStyle(
                                                color: Color(0xFF6096B4),
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(left: 50.0),
                                              child: Text("Nothin",
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
          ),
          // Positioned(
          //   top: h * 0.45,
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
          //               child: Ink(
          //                 decoration: BoxDecoration(
          //                     gradient: LinearGradient(
          //                       colors: active,
          //                       stops: stops2,
          //                       end: Alignment.centerRight,
          //                       begin: Alignment.centerLeft,
          //                     ),
          //                     borderRadius: const BorderRadius.all(Radius.circular(20))),
          //
          //                 child: InkWell(
          //                   borderRadius: const BorderRadius.all(Radius.circular(20)),
          //                   splashColor: Colors.blueGrey, // Splash color
          //                   // onTap: () => Navigator.of(context).push(
          //                   //   MaterialPageRoute(
          //                   //       builder: (context) => const ViewClassStudent()),
          //                   // ),
          //                   child: Container(
          //                     height: 80,
          //                     child: Column(
          //                       children: [
          //                         SizedBox(height: 13),
          //                         Row(
          //                           children: [
          //                             SizedBox(width: 28),
          //                             Text(
          //                               'PHY',
          //                               style: TextStyle(
          //                                 color: Color(0xFF6096B4),
          //                                 fontSize: 16.0,
          //                                 fontWeight: FontWeight.bold,
          //                               ),
          //                             ),
          //                             Padding(
          //                               padding:
          //                               const EdgeInsets.only(left: 50.0),
          //                               child: Text("Salam",
          //                                 style: TextStyle(
          //                                   color: Color(0xFF6096B4),
          //                                   fontSize: 16.0,
          //                                   fontWeight: FontWeight.bold,
          //                                 ),
          //                               ),
          //                             ),
          //                           ],
          //                         ),
          //                         SizedBox(height: 16),
          //                         Row(
          //                           children: [
          //                             SizedBox(width: 25),
          //                             Text(
          //                               '9055',
          //                               style: TextStyle(
          //                                 color: Color(0xFF6096B4),
          //                                 fontSize: 16.0,
          //                                 fontWeight: FontWeight.bold,
          //                               ),
          //                             ),
          //                             SizedBox(width: 38),
          //                             Icon(
          //                               Icons.person,
          //                               color: Color(0xFF6096B4),
          //                             ),
          //                             Text(
          //                               'Teacher Name',
          //                               style: TextStyle(
          //                                 color: Color(0xFF6096B4),
          //                                 fontSize: 15.0,
          //                                 fontWeight: FontWeight.bold,
          //                               ),
          //                             ),
          //                             SizedBox(width: 45),
          //                           ],
          //                         ),
          //                       ],
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //             ),
          //             SizedBox(height: 20)
          //           ],
          //         );
          //       }),
          // )
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
