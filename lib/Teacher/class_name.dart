import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/utils.dart';

import 'add_students.dart';

class ClassName extends StatefulWidget {
  const ClassName({Key? key}) : super(key: key);

  @override
  State<ClassName> createState() => _ClassNameState();
}

class _ClassNameState extends State<ClassName> {

  final _formKey = GlobalKey<FormState>();
  late String _className;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Class Name'),
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
                    labelText: 'Class Name',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a class name';
                    }
                    return null;
                  },
                  onSaved: (value) => _className = value!,
                ),
              ),
              //SizedBox(height: double.infinity),
              Expanded(
                child: SubmitButton(formKey: _formKey, text: 'Next', functionToComply: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddStudents()),
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
