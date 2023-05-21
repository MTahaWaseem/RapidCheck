import 'package:flutter/material.dart';
import 'package:fyp/Teacher/post_announcement.dart';
import '../Data/Models/class_model.dart';

class PostAnnouncement extends StatefulWidget {
  const PostAnnouncement({Key? key}) : super(key: key);

  @override
  State<PostAnnouncement> createState() => _PostAnnouncementState();
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

class _PostAnnouncementState extends State<PostAnnouncement> {
//Testing ListBuilder
  List<ClassModel> classes = [];
  String desc = "";
  String title = "";

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
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: h / 25,
                    ),
                    MainText(w, "Physics Evening"),
                    SizedBox(height: 10),
                    SubText(w, "PHY-012"),
                    SizedBox(height: 20),
                    Stack(
                      children: [
                        Container(
                            height: classes.length < 3 ? 400 : 585,
                            color: Color(0xFFF4F4F4)),
                        Positioned(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 30, left: 10, right: 10),
                                child: Material(
                                  elevation: 3,
                                  shadowColor: Colors.grey,
                                  borderRadius: BorderRadius.circular(20),
                                  child: Ink(
                                    decoration: BoxDecoration(
                                        //color: Color(0xFF6096B4),
                                        color: Color(0xFF6096B4),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: InkWell(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      splashColor:
                                          Colors.blueGrey, // Splash color
                                      onTap: () => ({
                                        showDialog(
                                          context: context,
                                          builder: (ctx) => AlertDialog(
                                            title: SingleChildScrollView(
                                              scrollDirection: Axis.vertical,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Post Announcement",
                                                    style: TextStyle(
                                                        color: Colors.blueGrey,
                                                        fontSize:
                                                            17 // Set the desired grey color
                                                        ),
                                                  ),
                                                  SizedBox(height: 15),
                                                  TextField(
                                                    decoration: InputDecoration(
                                                      labelText: 'Enter Title',
                                                    ),
                                                    onChanged: (value) {
                                                      title =
                                                          value; // update the class name as the user types
                                                    },
                                                    //decoration: InputDecoration(hintText: 'Enter Course Name'),
                                                  ),
                                                  TextField(
                                                      decoration: InputDecoration(
                                                        labelText:
                                                            'Enter Description',
                                                      ),
                                                      onChanged: (value) {
                                                        desc =
                                                            value; // update the class name as the user types
                                                      }),
                                                ],
                                              ),
                                            ),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () {
                                                  ClassModel result =
                                                      new ClassModel();
                                                  classes.add(result);
                                                  setState(() {});
                                                  // Method Call to add course name
                                                  Navigator.of(ctx).pop();
                                                },
                                                child: Container(
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFF6096B4),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(10)),
                                                  ),
                                                  //color: Color(0xFF6096B4),
                                                  padding:
                                                      const EdgeInsets.all(14),
                                                  child: Align(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "Post",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      }), // Some Dialog Box
                                      child: Container(
                                        width: 290,
                                        height: 55,
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            children: [
                                              SizedBox(width: 20),
                                              Icon(Icons.announcement_outlined,
                                                  color: Colors.white),
                                              SizedBox(width: 20),
                                              Text(
                                                "Post Announcement",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(32.0),
                                  child: Text(
                                    "Updates",
                                    style: TextStyle(
                                      color: Color(0xFF737373),
                                      fontSize: 20.0,
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
          ),
          Positioned(
            top: 290,
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
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20),
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
