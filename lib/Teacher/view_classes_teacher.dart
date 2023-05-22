import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fyp/Teacher/view_class_teacher.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Controllers/view_classes_teacher_provider.dart';
import '../Data/Models/class_model.dart';
import '../Data/Models/user_model.dart';

class ViewClassesTeacher extends StatefulWidget {
  const ViewClassesTeacher({Key? key}) : super(key: key);

  @override
  State<ViewClassesTeacher> createState() => _ViewClassesTeacherState();
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
  // Add a GlobalKey to control the refresh indicator
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  String className = "";
  String dropdownValue = 'PHY-064';

  List<Class> classes = [];
  User user = User();

  @override
  void initState() {
    super.initState();
    loadClasses();
    loadUser();
  }

  Future<void> _handleRefresh() async {
    await loadClasses();
  }

  Future<void> loadUser() async {
    final myProvider =
        Provider.of<ViewClassesTeacherProvider>(context, listen: false);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? authToken = prefs.getString('authToken');

    if (authToken != null) {
      String token = authToken;
      await myProvider.getUserData(token, context);
    } else {
      print('Authentication token not found in shared preferences');
    }
    // setState(() {
    //   user = myProvider.user.user;
    // });
  }

  Future<void> loadClasses() async {
    final myProvider =
    Provider.of<ViewClassesTeacherProvider>(context, listen: false);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? authToken = prefs.getString('authToken');

    if (authToken != null) {
      String token = authToken;
      await myProvider.getClassesData(token, context);
    } else {
      print('Authentication token not found in shared preferences');
    }

    // Store the values from the provider in the list
    // setState(() {
    //   classes = List<Class>.from(myProvider.classes.classes);
    //   user = myProvider.user.user;
    // });
  }

  @override
  Widget build(BuildContext context) {
    final myProvider = Provider.of<ViewClassesTeacherProvider>(context);
    user = myProvider.user.user;
    classes = myProvider.classes.classes;

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return myProvider.loading ?  const Center(
      child: CircularProgressIndicator(),
    )
        :
    RefreshIndicator(
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
            automaticallyImplyLeading: false,
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
                      //elevation: 5.0,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: h / 25,
                            ),
                            MainText(w, "Welcome ${user.firstName}!"),
                            SizedBox(height: 10),
                            SizedBox(height: 15),
                            Stack(
                              children: [
                                Container(
                                    height: classes.isEmpty
                                        ? 100
                                        : classes.length < 3
                                            ? 400
                                            : 600,
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
                                            fontSize: 20,
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
                                                  title: SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Select Course Code",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .blueGrey,
                                                              fontSize:
                                                                  17 // Set the desired grey color
                                                              ),
                                                        ),
                                                        SizedBox(height: 15),
                                                        Material(
                                                          elevation: 3,
                                                          shadowColor:
                                                              Colors.grey,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                                    gradient:
                                                                        LinearGradient(
                                                                      colors:
                                                                          gradient,
                                                                      stops:
                                                                          stops,
                                                                      end: Alignment
                                                                          .centerRight,
                                                                      begin: Alignment
                                                                          .centerLeft,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(10))),
                                                            child: StatefulBuilder(
                                                                builder: (BuildContext
                                                                        context,
                                                                    StateSetter
                                                                        dropDownState) {
                                                              return DropdownButton<
                                                                      String>(
                                                                  value:
                                                                      dropdownValue,
                                                                  icon: Padding(
                                                                      padding: EdgeInsets.only(
                                                                          right: w *
                                                                              0.035),
                                                                      child: Icon(Icons
                                                                          .arrow_downward_rounded)),
                                                                  iconEnabledColor:
                                                                      Colors
                                                                          .white,
                                                                  isExpanded:
                                                                      true,
                                                                  iconSize: 24,
                                                                  elevation: 16,
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .deepPurple),
                                                                  underline:
                                                                      Container(),
                                                                  onChanged:
                                                                      (String?
                                                                          value) {
                                                                    dropDownState(
                                                                        () {
                                                                      dropdownValue =
                                                                          value!;
                                                                    });
                                                                  },
                                                                  items: <String>[
                                                                    'PHY-064',
                                                                    'Chem-023'
                                                                  ].map<DropdownMenuItem<String>>(
                                                                      (String
                                                                          value) {
                                                                    return DropdownMenuItem<
                                                                        String>(
                                                                      value:
                                                                          value,
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            const EdgeInsets.only(left: 30),
                                                                        child:
                                                                            Text(
                                                                          value,
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                Color(0xFF737373),
                                                                            fontSize:
                                                                                15.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }).toList());
                                                            }),
                                                          ),
                                                        ),
                                                        TextField(
                                                          decoration:
                                                              InputDecoration(
                                                            labelText:
                                                                'Enter Class Name',
                                                          ),
                                                          onChanged: (value) {
                                                            className =
                                                                value; // update the class name as the user types
                                                          },
                                                          //decoration: InputDecoration(hintText: 'Enter Course Name'),
                                                        ),
                                                        TextField(
                                                            decoration:
                                                                InputDecoration(
                                                              labelText:
                                                                  'Enter Class Description',
                                                            ),
                                                            onChanged: (value) {
                                                              className =
                                                                  value; // update the class name as the user types
                                                            }),
                                                      ],
                                                    ),
                                                  ),
                                                  actions: <Widget>[
                                                    TextButton(
                                                      onPressed: () {
                                                        // ClassModel result =
                                                        //     new ClassModel();
                                                        // classes.add(result);
                                                        // setState(() {});
                                                        // Method Call to add course name
                                                        Navigator.of(ctx).pop();
                                                      },
                                                      child: Container(
                                                        width: 100,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFF6096B4),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          10)),
                                                        ),
                                                        //color: Color(0xFF6096B4),
                                                        padding:
                                                            const EdgeInsets
                                                                .all(14),
                                                        child: Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text(
                                                            "Add",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 15.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
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
                  ),
                  Positioned(
                    top: 215,
                    left: w / 8,
                    right: w / 8,
                    bottom: 0,
                    child: classes.length > 0
                        ? ListView.builder(
                            physics: const AlwaysScrollableScrollPhysics(),
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
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      child: InkWell(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        splashColor:
                                            Colors.blueGrey, // Splash color
                                        onTap: () => Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ViewClassTeacher(
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
                                                  //str.substring(length - 3, length);
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
                            })
                        : Align(
                            alignment: Alignment.center,
                            child: Text("No Classes to Show :(")),
                  )
                ],
              )
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

  Material Dropdown(double w) {
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
            'Regrade Requested'
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
