import 'package:flutter/material.dart';
import 'package:fyp/Student/view_class_student.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Controllers/view_classes_provider.dart';
import '../Data/Models/class_model.dart';
import '../Data/Models/user_model.dart';

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

class ViewClassesStudent extends StatefulWidget {
  const ViewClassesStudent({Key? key}) : super(key: key);

  @override
  State<ViewClassesStudent> createState() => _ViewClassesStudentState();
}

class _ViewClassesStudentState extends State<ViewClassesStudent> {
  // Add a GlobalKey to control the refresh indicator
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  String className = "";
  String classDesc = "";

  List<Class> classes = [];
  User user = User();
  String authToken = '';

  @override
  void initState() {
    super.initState();
    getAuthToken();
    loadData();
  }

  Future<void> _handleRefresh() async {
    await loadClasses();
  }

  Future<void> loadData() async {
    final myProvider = Provider.of<ViewClassesProvider>(context, listen: false);
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? authToken = prefs.getString('authToken');
      if (authToken != null) {
        String token = authToken;
        await Future.wait([
          myProvider.getClassesData(token, context),
          myProvider.getUserData(token, context),
        ] as Iterable<Future>);
      } else {
        print('Authentication token not found in shared preferences');
      }
      // Data as been fetched successfully
    } catch (error) {
      // Handle the error
    }
  }

  Future<void> loadClasses() async {
    final myProvider = Provider.of<ViewClassesProvider>(context, listen: false);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? authToken = prefs.getString('authToken');

    if (authToken != null) {
      String token = authToken;
      await myProvider.getClassesData(token, context);
    } else {
      print('Authentication token not found in shared preferences');
    }
  }

  @override
  Widget build(BuildContext context) {
    final myProvider = Provider.of<ViewClassesProvider>(context);
    user = myProvider.user.user;
    classes = myProvider.classes.classes;

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return myProvider.loading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : RefreshIndicator(
            key: _refreshIndicatorKey,
            onRefresh: _handleRefresh,
            notificationPredicate: (ScrollNotification notification) {
              return notification.depth == 0;
            },
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(35),
                child: AppBar(
                  leading: BackButton(
                    color: Color(0xFFD2721A),
                  ),
                  shape:
                      Border(bottom: BorderSide(color: Colors.black, width: 1)),
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
                            MainText(w, "My Classes"),
                            SizedBox(height: 25),
                            Container(
                                height: classes.length < 3 ? 400 : 585,
                                color: Color(0xFFF4F4F4)),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: h * 0.175,
                    left: w / 8,
                    right: w / 8,
                    bottom: 0,
                    child: classes.length == 0
                        ? Align(alignment: Alignment.center, child: Text(""))
                        : ListView.builder(
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
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(20))),
                                      child: InkWell(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20)),
                                        splashColor:
                                            Colors.blueGrey, // Splash color
                                        onTap: () =>
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ViewClassStudent(authToken: authToken, classId: classes[index])),
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
                                                    classes[index]
                                                        .courseCode
                                                        .substring(0, 3),
                                                    style: TextStyle(
                                                      color: Color(0xFF6096B4),
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 50.0),
                                                    child: Text(
                                                      classes[index].className,
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFF6096B4),
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                                    classes[index]
                                                        .courseCode
                                                        .substring(
                                                            classes[index]
                                                                    .courseCode
                                                                    .length -
                                                                3,
                                                            classes[index]
                                                                .courseCode
                                                                .length),
                                                    style: TextStyle(
                                                      color: Color(0xFF6096B4),
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(width: 45),
                                                  Icon(
                                                    Icons.person,
                                                    color: Color(0xFF6096B4),
                                                  ),
                                                  Text(
                                                    classes[index]
                                                        .teacher
                                                        .firstName,
                                                    style: TextStyle(
                                                      color: Color(0xFF6096B4),
                                                      fontSize: 15.0,
                                                      fontWeight:
                                                          FontWeight.bold,
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

  Future<void> getAuthToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? _authToken = prefs.getString('authToken');
    if (_authToken != null) {
      authToken = _authToken;
    } else {
      print('Authentication token not found in shared preferences');
    }
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
