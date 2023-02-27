import 'package:flutter/material.dart';
import 'package:fyp/Teacher/class_name.dart';
import 'package:fyp/Teacher/teacher_class.dart';

import 'my_drawer.dart';

class TeacherHome extends StatefulWidget {
  const TeacherHome({Key? key}) : super(key: key);

  @override
  State<TeacherHome> createState() => _TeacherHomeState();
}

class _TeacherHomeState extends State<TeacherHome> {

  final List<String> classes = [    'Physics Nixor College', 'Maths City School',    'Class 3', 'Class 4'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("Your Classes"),

    ),
      drawer: MyDrawer(),
      body: ListView.builder(
        itemCount: classes.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              leading: Icon(Icons.class_outlined),
              title: Text(classes[index]),
              subtitle: Text('34 students'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TeacherClass()),
                );
                // Navigate to the corresponding class page
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ClassName()),
          );
          // Add your code here to handle the button press event
        },
        label: Text('Add Class'),
        icon: Icon(Icons.class_),
      ),

    );
  }
}
