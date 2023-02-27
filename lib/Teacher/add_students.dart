import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/Teacher/teacher_class.dart';
import 'package:fyp/Teacher/teacher_home.dart';
import 'package:fyp/utils.dart';

class AddStudents extends StatefulWidget {
  const AddStudents({Key? key}) : super(key: key);

  @override
  State<AddStudents> createState() => _AddStudentsState();
}

class _AddStudentsState extends State<AddStudents> {
  final _formKey = GlobalKey<FormState>();
  late String _className;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Students'),
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
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Enter Student Emails',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter at least one email';
                    }
                    return null;
                  },
                  onSaved: (value) => _className = value!,
                ),
              ),
              SizedBox(height: 50),
              Center(child: const Text('OR')),
              SizedBox(height: 50),
              Center(
                child: Container(
                  width: 300,
                  height: 50,
                  child: ElevatedButton.icon(
                    onPressed: () async {},
                    icon: Icon(Icons.cloud_upload),
                    label: Text("Upload Excel Sheet"),
                  ),
                ),
              ),

              Expanded(
                child: SubmitButton(
                    formKey: _formKey,
                    text: 'Create Class',
                    functionToComply: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TeacherHome()),
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
