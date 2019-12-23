import 'package:flutter/material.dart';

class Questions extends StatelessWidget {
  final String questions;

  Questions(this.questions);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Text(
            questions,
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}
