//This package includes all the pre-made widgets.
import 'package:flutter/material.dart';
//This imports the questions.dart file
//use ./ to reffer to the directory where the main program is
import './questions.dart';
//This imports the answer.dart file
import './answer.dart';
import './quiz.dart';
import './results.dart';

//This is the main method.
//Execution of the code starts here
//=> is used in dart for defining sinlge line methods.
void main() => runApp(MyApp());

//MyApp is the main Widget here or the root wiget of our app.
//StatefullWidget always have to define a State<MyAppState> createState(){}
class MyApp extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

//The state of this class is inherited in the MyAppState extends State<MyApp>{}
//This is the build method.
//The build method is called everytime at the start by the StatefulWidet.
//The build method rerenders the screen.
//The build method has to return a widget which  will in turn have mulitple widgets.
class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  int _totalScore = 0;
  final _questions = const [
    {
      'questionText': ' What is your favourite colour?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Blue', 'score': 6},
        {'text': 'Green', 'score': 5},
        {'text': 'White', 'score': 1}
      ],
    },
    {
      'questionText': 'What is your favourite animal?',
      'answers': [
        {'text': 'Panda', 'score': 1},
        {'text': 'Lion', 'score': 10},
        {'text': 'Lama', 'score': 3},
        {'text': 'Tiger', 'score': 10}
      ],
    },
    {
      'questionText': 'What is your name?',
      'answers': [
        {'text': 'Prabjot', 'score': 1},
        {'text': 'Sahej', 'score': 1},
        {'text': 'Ishitva', 'score': 1},
        {'text': 'Prateek', 'score': 1}
      ],
    },
  ];

  void _resetQuiz() {
    setState(() {
    _totalScore = 0;
    _questionIndex = 0; 
    });
  }

  void _answerQues(int score) {
    print("Answer1");
    _totalScore += score;
    //this is the mtehod used to change state
    setState(() {
      //anonymus function is used as setState takes a function as an argument.
      _questionIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //The material app is a predefined widget that has a property home which takes a widget
      home: Scaffold(
        //Scafold is another predefined widget that has a few properties to define the home screen such as appBar and  body which inturn takes another widget
        appBar: AppBar(
          title: Text(
            "My First App",
            style: TextStyle(fontSize: 20.0),
          ),
        ),
        body: Container(
          //we will add a ternary expression ' condition ? true body: false body' to check if the questionindex is in questions bound
          child: _questionIndex < _questions.length
              ? Quiz( answerQues: _answerQues, questions: _questions, questionIndex: _questionIndex)
              : Result(resultScore: _totalScore,resetQuiz: _resetQuiz,),
        ),
      ),
    );
  }
}
