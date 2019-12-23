import 'package:flutter/material.dart';
import './main.dart';
import './answer.dart';
import './questions.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function answerQues;
  final int questionIndex;

  Quiz({@required this.questions, @required this.answerQues, @required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Questions(
          questions[questionIndex]['questionText'],
        ),

        //now to add multiple widgets dynamically we create a map
        //we map the questions list to a widgets list by calling map method on questions list and pass the answer key form the map of question anwers
        //map takes a fucntion as an argument
        //here we do not need to use the argument fucntion again so we call an anonymus function and send answers key to this function
        // map creates an object of type iterable
        // we convert this object of iterables to a list and then spread it using '...()' spread operator
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answers) {
          //here we transform every answer to a Answer widget
          return Answer(() => answerQues(answers['score']), answers['text']);
        }).toList(),
        /*() => _answerQues is an anonymus fucntion that is created on the fly and it
                    pases the address to _answerQues, now no need to store its address in a variable and we can just store in the memory
        /*here we call _answerQues instead of just passing the address as we are already passing it through the ananonymus function*/
        /*Why? Because this is now not executed when Dart parses this, there it will only create this anonymous function*/
                    and store it in memory but this is now executed when onPressed is triggered, right because it's an anonymous function where
                    I forward the address to answer, the address is then bound to the button here,
                    so when a button is pressed, this address is used to then execute this anonymous function. So this function
                    body here is only triggered when the button is pressed.
                    Therefore when it is pressed, I do want to call answerQuestion
                    and now since I call it here, I do have access to my answer map here, to my answer object and therefore
                    also to the score because every answer through which I'm looping here or through which I'm going here, every
                    answer is just a map with a text and a score and now I can access that score here. So I can now forward
                    answer score here to answerQuestion and I know that this will be an integer and therefore, answer
                    question here will receive my integer score,
                    here it is.*/
      ],
    );
  }
}
