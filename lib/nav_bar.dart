import 'package:flutter/material.dart';
import 'package:fyp/Data/Models/user_model.dart';
import 'package:fyp/Student/view_classes_student.dart';
import 'package:fyp/Teacher/view_classes_teacher.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Student/notifications.dart';
import 'Student/take_assessment.dart';
import 'Teacher/profile.dart';

List<UserModel> user = [];

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {

  static final List<Widget> _widgetOptionsTeacher = <Widget>[
     const ViewClassesTeacher(),
    TakeAssessment(),
    const Notifications(),
    ProfileScreen(),
  ];

  static final List<Widget> _widgetOptionsStudent = <Widget>[
    //const ViewClassesStudent(),
    // Settings
    const Notifications(),
    ProfileScreen(),
  ];

  bool isTeacher = false;
  bool isLoading = true;

  void checkRole() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isTeacher = prefs.getBool('isTeacher') ?? true;
    });
    print("In check role: " + isTeacher.toString());
    isLoading = false;
  }

  @override
  void initState() {
    super.initState();
      checkRole();
  }

  @override
  Widget build(BuildContext context) {

    return isLoading ? CircularProgressIndicator() :
      CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          backgroundColor: const Color(0XFFD2721A),
          height: 60,

          items:  <BottomNavigationBarItem> [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.black.withOpacity(0.5)),
              //label: 'Home',
              backgroundColor: const Color(0xFFD2721A),
              activeIcon: const Icon(Icons.home_outlined, color: Colors.black, size: 37),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings, color: Colors.black.withOpacity(0.5)),
              //label: 'Settings',
              backgroundColor: const Color(0xFFD2721A),
              activeIcon: const Icon(Icons.settings_outlined, color: Colors.black,size: 37),
            ),
            BottomNavigationBarItem(
              icon:
              Icon(Icons.notifications, color: Colors.black.withOpacity(0.5)),
              //label: 'Notifications',
              backgroundColor:const Color(0xFFD2721A),
              activeIcon: const Icon(Icons.notifications_outlined, color: Colors.black,size: 37),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.black.withOpacity(0.5)),
              //label: 'Profile',
              backgroundColor: const Color(0xFFD2721A),
              activeIcon: const Icon(Icons.person_outlined, color: Colors.black, size: 37),
            ),


          ],

        ),
      tabBuilder: (context, index) {
          switch(index){
            case 0:
              return CupertinoTabView(builder: (context){
                return CupertinoPageScaffold(child: isTeacher ? _widgetOptionsTeacher[0] : _widgetOptionsStudent[0] );
              });
            case 1:
              return CupertinoTabView(builder: (context){
                return CupertinoPageScaffold(child: isTeacher ? _widgetOptionsTeacher[1] : _widgetOptionsStudent[1] );
              });
            case 2:
              return CupertinoTabView(builder: (context){
                return CupertinoPageScaffold(child: isTeacher ? _widgetOptionsTeacher[2] : _widgetOptionsStudent[2] );
              });
            case 3:
              return CupertinoTabView(builder: (context){
                return CupertinoPageScaffold(child: isTeacher ? _widgetOptionsTeacher[3] : _widgetOptionsStudent[3] );
              });
            default:
              return CupertinoTabView(builder: (context){
                return CupertinoPageScaffold(child: isTeacher ? _widgetOptionsTeacher[0] : _widgetOptionsStudent[0] );
              });
          }
        }
    );
  }
}


