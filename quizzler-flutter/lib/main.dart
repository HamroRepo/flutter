import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'questionBank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:audioplayers/audio_cache.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          //Color(0xffF65150),
          leading: CircleAvatar(
            backgroundImage: AssetImage('images/1.png'),
            //maxRadius: 1,
            child: null,
          ),
          title: Text('deQuiz',
              style: TextStyle(
                color: Color(0xffF65150),
              )),
        ),
        backgroundColor: Colors.blueGrey.shade900,
        //Colors.grey.shade900,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: QuizPage(),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int next = 0;
  String answer;

  void correct(String answer) {
    setState(() {
      if (quizBrain.isFinished() == true) {
        Alert(
          context: context,
          title: 'Finished!',
          desc:
              "You scored ${quizBrain.returnScore()}/${quizBrain.returnTotalQuestion()}!",
        ).show();
        quizBrain.reset();

        scoreKeeper = [];
      } else {
        if (answer == quizBrain.getCorrectAnswer()) {
          final player = AudioCache();
          player.play('2.wav');
          scoreKeeper.add(
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
          quizBrain.increaseScore();
        } else {
          final player = AudioCache();
          player.play('3.wav');
          scoreKeeper.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
        quizBrain.changeQuestion();
      }
    });
  }

  List<Icon> scoreKeeper = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Spacer(),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Spacer(),
        Expanded(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: FlatButton(
                        color: Colors.indigo.shade600,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        onPressed: () {
                          correct(quizBrain.getOption1());
                        },
                        child: Text(
                          quizBrain.getOption1(),
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: quizBrain.shouldBeVisible(),
                    child: Expanded(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: FlatButton(
                          color: Colors.indigo.shade600,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          onPressed: () {
                            correct(quizBrain.getOption2());
                          },
                          child: Text(
                            quizBrain.getOption2(),
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Visibility(
                    visible: quizBrain.shouldBeVisible(),
                    child: Expanded(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: FlatButton(
                          color: Colors.indigo.shade600,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          onPressed: () {
                            correct(quizBrain.getOption3());
                          },
                          child: Text(
                            quizBrain.getOption3(),
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: quizBrain.shouldBeVisible(),
                    child: Expanded(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: FlatButton(
                          color: Colors.indigo.shade600,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          onPressed: () {
                            correct(quizBrain.getOption4());
                          },
                          child: Text(
                            quizBrain.getOption4(),
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Wrap(
          direction: Axis.horizontal,
          children: scoreKeeper,
        ),
      ],
    );
  }
}
