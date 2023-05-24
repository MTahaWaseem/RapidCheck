import 'package:flutter/material.dart';
import 'package:fyp/Teacher/view_class_teacher.dart';
import '../Data/Models/class_model.dart';



class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}


class _NotificationsState extends State<Notifications> {
//Testing ListBuilder
  List<ClassModel> announce = [];

  @override
  void initState() {
    super.initState();
    ClassModel result = new ClassModel();
    announce.add(result);
    announce.add(result);
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
            bottom: -10,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              ),
              //elevation: 5.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: h / 25,
                  ),
                  MainText(w, "Announcements"),
                  SizedBox(height: 45),
                  Stack(
                    children: [
                      Container(
                          height: announce.length == 0
                              ? 100
                              : announce.length < 3
                              ? 400
                              : 600,
                          color: Color(0xFFF4F4F4)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 160,
            left: w / 8,
            right: w / 8,
            bottom: 0,
            child: announce.length > 0
                ? ListView.builder(
                itemCount: announce.length,
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
                              borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                          child: InkWell(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            splashColor: Colors.blueGrey, // Splash color
                            onTap: () => {},
                            child: Container(
                              width: w * 0.8,
                              height: h * 0.12,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 18.0, right: 18),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 13),
                                    Text(
                                      'Quiz Posted!',
                                      style: TextStyle(
                                        color: Color(0xFF6096B4),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 13),
                                    Text(
                                      'A new quiz has been posted, please go and attempt it',
                                      style: TextStyle(
                                        color: Color(0xFF6096B4),
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10)
                    ],
                  );
                })
                : Align(
                alignment: Alignment.center,
                child: Text("No Announcements to Show")),
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
