import 'package:flutter/material.dart';
import 'package:sdg/Items/Qestion.dart';
import 'package:sdg/Items/QuizBrain.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Icon> ScoreMark = [];

  //List<Question> ListQuestion = QuizBrain().questionBank;

  CheckAns(bool ans) {
    setState(() {
      if (ans == myQuizBrain.getAnswer()) {
        print("Correct");
        ScoreMark.add(Icon(Icons.check, color: Colors.green));
        QuizScore += 10;
      } else {
        print("Wrong.");
        ScoreMark.add(Icon(Icons.close, color: Colors.red));
      }

      myQuizBrain.nextQuestion();
    });
  }

  QuizBrain myQuizBrain = QuizBrain();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: ScoreMark,
            ),
            ScoreMark.length == 5
                ? Center(
                    child: Column(
                      children: [
                        Text(
                          "Your point now is",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            padding: EdgeInsets.all(15),
                            child: Text((QuizScore).toString(),
                                style: TextStyle(fontSize: 200)),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              color: Colors.blue,
                            )),
                      ],
                    ),
                  )
                : Expanded(
                    flex: 5,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Center(
                        child: Text(
                          // IF THE LIST IS PUBLIC YOU CAN USE: QuizBrain().questionBank[QuestionNumber].QuestionStr
                          myQuizBrain.getQuestionStr(),
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.blue, fontSize: 25),
                        ),
                      ),
                    ),
                  ),
            ScoreMark.length == 5
                ? TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "Go back to home screen",
                        style: TextStyle(color: Colors.grey[800]),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.amberAccent,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                    ))
                : Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: FlatButton(
                        textColor: Colors.white,
                        color: Colors.green,
                        child: Text(
                          "True",
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          bool ans = true;
                          CheckAns(ans);
                        },
                      ),
                    ),
                  ),
            ScoreMark.length == 5
                ? Text("")
                : Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: FlatButton(
                        textColor: Colors.white,
                        color: Colors.red,
                        child: Text(
                          "False",
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          bool ans = false;
                          CheckAns(ans);
                        },
                      ),
                    ),
                  ),
          ], // children of column
        ),
      ),
    );
  }
}
