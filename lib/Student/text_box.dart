import 'package:flutter/material.dart';

class Textbox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      maxLines: null, // Allows unlimited lines
      minLines: 1, // Minimum of 1 line
      decoration: InputDecoration(
        hintText: 'Enter your response',
        //border: OutlineInputBorder(),
        filled: true, // Set to true to fill background
        fillColor: Colors.grey.shade300, // Set background color
      ),

    );
  }
}
