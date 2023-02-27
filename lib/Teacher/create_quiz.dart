import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/Teacher/teacher_class.dart';
import 'package:fyp/utils.dart';

import 'add_students.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class CreateQuiz extends StatefulWidget {
  const CreateQuiz({Key? key}) : super(key: key);

  @override
  State<CreateQuiz> createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {

  final _formKey = GlobalKey<FormState>();
  late String _className;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Quiz'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Enter Question 01',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a question';
                        }
                        return null;
                      },
                      onSaved: (value) => _className = value!,
                    ),
                    SizedBox(height: 35),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Enter Model Answer 01',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter an answer';
                        }
                        return null;
                      },
                      onSaved: (value) => _className = value!,
                    ),
                  ],
                ),
              ),
              DropdownButtonExample(),
              //SizedBox(height: double.infinity),
              Expanded(
                child: SubmitButton(formKey: _formKey, text: 'Create Quiz', functionToComply: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TeacherClass()),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
