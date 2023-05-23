import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp/Teacher/view_one_student.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Controllers/view_students_provider.dart';
import '../Data/Models/class_model.dart';
import '../Data/Models/get_students_model.dart';
class ViewStudents extends StatefulWidget {
  final Class classId; // Add the classId parameter
  const ViewStudents({Key? key, required this.classId}) : super(key: key);

  @override
  State<ViewStudents> createState() => _ViewStudentsState();
}

final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
GlobalKey<RefreshIndicatorState>();


class _ViewStudentsState extends State<ViewStudents> {
//Testing ListBuilder
  List<Students> students = [];
  String authToken = '';


  @override
  void initState() {
    super.initState();
    getAuthToken();
    Class _class = widget.classId;
    loadData(_class.id);
  }


  Future<void> _handleRefresh(String classID) async {
    await loadData(classID);
  }

  Future<void> loadData(String classID) async {
    final myProvider =
    Provider.of<ViewStudentsProvider>(context, listen: false);
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? authToken = prefs.getString('authToken');
      if (authToken != null) {
        String token = authToken;
        await Future.wait([
          myProvider.getStudentsData(classID, token, context),
        ] as Iterable<Future>);
      } else {
        print('Authentication token not found in shared preferences');
      }
      // Data as been fetched successfully
    } catch (error) {
      // Handle the error
    }
  }
  @override
  Widget build(BuildContext context) {

    Class _class = widget.classId;

    final myProvider = Provider.of<ViewStudentsProvider>(context);
    students = myProvider.students.students ?? [];


    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    // return myProvider.loading
    //     ? const Center(
    //   child: CircularProgressIndicator(),
    // )
    //     : RefreshIndicator(
    //     key: _refreshIndicatorKey,
    //     onRefresh: _handleRefresh,
    //     notificationPredicate: (ScrollNotification notification) {
    //       return notification.depth == 0;
    //     },
    return myProvider.loading
        ? const Center(
      child: CircularProgressIndicator(),
    )
        : RefreshIndicator(
          key: _refreshIndicatorKey,
          onRefresh: ()=> _handleRefresh(_class.id),
          notificationPredicate: (ScrollNotification notification) {
            return notification.depth == 0;
          },
      child: Scaffold(
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
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: h / 25,
                      ),
                      MainText(w, _class.className),
                      SizedBox(height: 10),
                      SubText(w, _class.courseCode),
                      SizedBox(height: 15),
                      Stack(
                        children: [
                          Container(
                              height: students.length < 3 ? 400 : 585,
                              color: Color(0xFFF4F4F4)),
                          Positioned(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(20, 22, 20, 0),
                              child: Row(
                                children: [
                                  SizedBox(width: 20),
                                  Text(
                                    "Students",
                                    style: TextStyle(
                                      color: Color(0xFF737373),
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 60),
                                  SizedBox(
                                    width: 135,
                                    child: ElevatedButton(

                                      child: Row(
                                        children: [
                                          Icon(Icons.add),
                                          SizedBox(width: 20),
                                          Text(
                                            'Student',
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
                                          builder: (ctx) => AddStudent(classID: _class.id, authToken: authToken),
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
              top: h * 0.25,
              left: w / 8,
              right: w / 8,
              bottom: 0,
              child: students.length == 0 ? Align(
                  alignment: Alignment.center,
                  child: Text("Add a Student to Begin :)"))
                    : ListView.builder(
                  itemCount: students.length,
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
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => ViewOneStudent(
                                      // Tell Class ID Here

                                    )),
                              ),
                              child: Container(
                                height: 80,
                                child: Row(
                                  children: [
                                    SizedBox(width: 15),
                                    Icon(
                                      Icons.person,
                                      color: Color(0xFF6096B4),
                                      size: 55,
                                    ),
                                    SizedBox(width: 15),
                                    SizedBox(
                                      width: w * 0.4,
                                      child: Text(
                                        students[index].firstName ?? '',
                                        style: TextStyle(
                                          color: Color(0xFF6096B4),
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    //SizedBox(width:30),
                                    InkWell(
                                      onTap: () {
                                        _showConfirmationPopup(index, students[index].firstName ?? '' , context);
                                      },
                                      child: Icon(
                                        Icons.remove_circle_outline,
                                        color: Colors.grey,
                                        size: 30,
                                      ),
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

  void _showConfirmationPopup(int index, String studentName, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation'),
          content: Text('Are you sure you want to remove ${studentName} from this class?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Perform delete operation
                  students.removeAt(index);
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('No'),
            ),
          ],
        );
      },
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

class AddStudent extends StatelessWidget {
  final String classID;
  final String authToken;

  const AddStudent({
    Key? key,
    required this.classID,
    required this.authToken,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final myProvider = Provider.of<ViewStudentsProvider>(context);
    String email = '';

    return AlertDialog(
      title: Text(
        "Enter Student Email",
        style: TextStyle(
          color: Color(0xFF6096B4),
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: TextField(
        onChanged: (value) {
          email = value; // update the class name as the user types
        },
        //decoration: InputDecoration(hintText: 'Enter Course Name'),
      ),
      actions: <Widget>[
        TextButton(
              onPressed: () async {
            myProvider.addStudentData(classID, email, authToken, context);
            myProvider.getStudentsData(classID, authToken, context);
            Navigator.of(context)
                .pop();
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
