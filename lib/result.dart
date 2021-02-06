import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final Function reset;
  final int score;

  Result(this.reset, this.score);

  String get totalScore {
    String message;
    if (score >= 0 && score < 5) {
      message = "Not Bad! But try more";
    } else if (score >= 5 && score < 10) {
      message = "Going good! Keep going";
    } else {
      message = "Wow! This is Amazing! Keep it Up";
    }
    return message;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: Text(
            totalScore + " $score",
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        FlatButton(
          child: Text("Restart Quiz"),
          onPressed: reset,
          textColor: Colors.deepOrange[400],         
        )
      ],
    );
  }
}
