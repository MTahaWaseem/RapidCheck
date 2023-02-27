
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {

  const SubmitButton({
    required this.functionToComply,
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.text,

  }) : _formKey = formKey, super(key: key);


  final void Function() functionToComply;
  final GlobalKey<FormState> _formKey;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: 45,
        child: ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                functionToComply();
              }
            },
            child: Text(text),
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    )
                )
            )
        ),
      ),
    );
  }
}


class NextButton extends StatelessWidget {

  const NextButton({
    required this.text,
    required this.functionToComply,
    Key? key,
  }) : super(key: key);

  final String text;
  final void Function() functionToComply;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: 45,
        child: ElevatedButton(
            onPressed: () {

            },
            child: Text(text),
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    )
                )
            )
        ),
      ),
    );
  }
}

