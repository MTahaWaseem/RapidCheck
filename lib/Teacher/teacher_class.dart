import 'package:flutter/material.dart';
import 'package:fyp/Teacher/class_name.dart';
import 'package:fyp/Teacher/create_quiz.dart';

import 'my_drawer.dart';

class TeacherClass extends StatefulWidget {
  const TeacherClass({Key? key}) : super(key: key);

  @override
  State<TeacherClass> createState() => _TeacherClassState();
}

class _TeacherClassState extends State<TeacherClass> {

  final List<String> quizzes = [    'Kinematics Quiz', 'Dynamics Test', 'Momentum Quiz'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Physics Nixor College"),

      ),
      body: ListView.builder(
        itemCount: quizzes.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              leading: Icon(Icons.bookmark),
              title: Text(quizzes[index]),
              subtitle: Text('12 submissions'),
              onTap: () {
                // Navigate to the corresponding class page
              },
              trailing:
              Column(
                children: [
                  Icon(Icons.access_time),
                  Text('4 mins')
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateQuiz()),
          );
          // Add your code here to handle the button press event
        },
        label: Text('Create Quiz'),
        icon: Icon(Icons.add_task),
      ),

    );
  }
}
