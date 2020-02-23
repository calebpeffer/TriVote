import 'dart:math';

import 'package:flutter/material.dart';

import 'dart:ui';

import 'package:votesmarter/model/question.dart';
import 'package:votesmarter/screen/question_screen.dart';
import 'package:votesmarter/widgets/wheel.dart';



class MainGame extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainGameState();
  }
}

class _MainGameState extends State<MainGame>
    with SingleTickerProviderStateMixin {
  

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient: RadialGradient(
    radius: 0.9,
    colors: [
       Theme.of(context).accentColor, // yellow sun
       Theme.of(context).primaryColor, // blue sky
    ],
   ),),
            child: Wheel(),
          ),
          RawMaterialButton(
            child: Text("Answer"),
            onPressed: () {
              Navigator.of(context).push(new MaterialPageRoute<Null>(
                  builder: (BuildContext context) {
                    return new QuizPage(
                      questions: [
                        Question(
                            question: "What is the name of America?",
                            incorrectAnswers: ["Pegasus", "Coconut", "Trump"],
                            correctAnswer: "Arlinda",
                            sourceURL: "idjadawdada",
                            explanation: "awdadwa",
                            type: "awdawdadawawd"),
                        Question(
                            question: "What is the name of America?",
                            answers: ["yes", "no"],
                            correctAnswer: "yes",
                            incorrectAnswers: ["no"],
                            sourceURL: "idjadawdada",
                            explanation: "awdadwa",
                            type: "awdawdadawawd"),
                        Question(
                            question: "What is the name of America?",
                            answers: ["yes", "no"],
                            correctAnswer: "yes",
                            incorrectAnswers: ["no"],
                            sourceURL: "idjadawdada",
                            explanation: "awdadwa",
                            type: "awdawdadawawd"),
                      ],
                    );
                  },
                  fullscreenDialog: true));
            },
          )
        ],
      ),
    );
  }
}