import 'package:flutter/material.dart';
import 'package:fyp/Controllers/announcements_provider.dart';
import 'package:provider/provider.dart';
import '../Data/Models/class_model.dart';
import '../Data/Models/get_announcements.dart';

class ClassAnnouncements extends StatefulWidget {
  final Class classId; // Add the classId parameter
  final String authToken;
  const ClassAnnouncements(
      {Key? key, required this.classId, required this.authToken})
      : super(key: key);

  @override
  State<ClassAnnouncements> createState() => _ClassAnnouncementsState();
}

class _ClassAnnouncementsState extends State<ClassAnnouncements> {

  List<Announcements> announce = [];

  @override
  void initState() {
    super.initState();

    Class _class = widget.classId;
    String authToken = widget.authToken;
    loadData(_class.id, authToken);
  }

  Future<void> loadData(String classID, String authToken) async {
    final myProvider =
    Provider.of<AnnouncementsProvider>(context, listen: false);
    try {
      String token = authToken;
      await myProvider.getAnnouncementsData(classID, token, context);
    } catch (error) {
      print("Error in loading announcements");
    }
  }

  @override
  Widget build(BuildContext context) {

    Class _class = widget.classId;
    final myProvider = Provider.of<AnnouncementsProvider>(context);
    announce = myProvider.announcements.announcements ?? [];

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
                          height: announce.length < 3 ? 400 : 585,
                          color: Color(0xFFF4F4F4)),

                      Positioned(
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(32.0),
                            child: Text(
                              "Announcements",
                              style: TextStyle(
                                color: Color(0xFF737373),
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
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
                itemCount: announce.length,
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
                                  announce[index].title ?? '',
                                  style: TextStyle(
                                    color: Color(0xFF6096B4),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 7),
                                Text(
                                  announce[index].description ?? '',
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


