import 'package:flutter/material.dart';

import 'getAPI.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {

  @override
  void initState() {
    super.initState();
    getAPI().myFunction();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Testing connection'),
      ),
      body:
      Center(child: Text('SALAM')),

    );
  }
}
