import 'package:flutter/material.dart';
import './main.dart';

class Result extends StatelessWidget {
  final resultScore;
  final Function resetQuiz;

  Result({this.resultScore, this.resetQuiz});

  /*
    I like the way of adding a getter here. A getter here is a special type of property,
    it's basically a mixture of property and method
    You create a getter by first of all defining which type of value you want to get,
    you want to derive and that would be a string because I want to get some text,
    then you add the get keyword and then any name you want, like resultPhrase.
    Now unlike in a method, you now don't add parentheses because a getter is like a method that can never
    receive any arguments.
    You do add a body though and in that body, you now have to return a string,
    you always have to return something in a getter, you use it however like a normal property.
    So down there instead of you did it,
    I will use resultPhrase and I don't use it with parentheses to execute it like a function,
    I'm also not using it as the address of a function because this is no function,
    this is simply a Dart feature,
    it's a normal property but the value is calculated dynamically and here, the value I want to calculate
  */
  String get resultPharse {
    String resultText;
    if (resultScore <= 8) {
      resultText = "You are awesome and innocent!";
    } else if (resultScore <= 12) {
      resultText = "You are likeable!";
    } else if (resultScore <= 16) {
      resultText = "You are strange!";
    } else {
      resultText = "You are so bad!";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(resultPharse,
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
          FlatButton(
            child: Text(
              'Restart Quiz!',
              style: TextStyle(color: Colors.blue),
            ),
            onPressed: resetQuiz,
          ),
        ],
      ),
    );
  }
}
