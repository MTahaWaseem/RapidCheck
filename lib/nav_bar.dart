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

  static final List<Widget> _widgetOptions = <Widget>[
    const ViewClassesTeacher(),
    TakeAssessment(),
    const Notifications(),
    ProfileScreen(),
  ];


  @override
  void initState() {
    super.initState();
    //context.read<MainScreenProvider>().getUserDetails(user.uid);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
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
                return CupertinoPageScaffold(child: _widgetOptions[0]);
              });
            case 1:
              return CupertinoTabView(builder: (context){
                return CupertinoPageScaffold(child: _widgetOptions[1]);
              });
            case 2:
              return CupertinoTabView(builder: (context){
                return CupertinoPageScaffold(child: _widgetOptions[2]);
              });
            case 3:
              return CupertinoTabView(builder: (context){
                return CupertinoPageScaffold(child: _widgetOptions[3]);
              });
            default:
              return CupertinoTabView(builder: (context){
                return CupertinoPageScaffold(child: _widgetOptions[0]);
              });
          }
        }
    );
  }
}


