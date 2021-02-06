import "package:flutter/material.dart";
import "./quiz.dart";
import "./result.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State {
  int _questionIndex = 0;
  int _scores = 0;

  final _questions = const [
    {
      "question": "What's your Name?",
      "answers": [
        {"text": "A", "score": 5},
        {"text": "B", "score": 3},
        {"text": "C", "score": 1}
      ]
    },
    {
      "question": "What's ur Fav Colour?",
      "answers": [
        {"text": "Blue", "score": 5},
        {"text": "Black", "score": 3},
        {"text": "Grey", "score": 1},
      ]
    },
    {
      "question": "What's ur Fav Lang?",
      "answers": [
        {"text": "JS", "score": 5},
        {"text": "Python", "score": 3},
        {"text": "Dart", "score": 1},
      ]
    },
  ];

  void _answered(int score) {
    setState(() {
      _questionIndex++;
      _scores += score;
    });
  }

  void reset() {
    setState(() {
      _questionIndex = 0;
      _scores = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text("Quiz App")),
          body: _questionIndex < _questions.length
              ? Quiz(
                  questions: _questions,
                  questionIndex: _questionIndex,
                  answered: _answered)
              : Result(reset,_scores)),
    );
  }
}
