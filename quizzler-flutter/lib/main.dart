import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'option.dart';
import 'questionBank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:audioplayers/audio_cache.dart';

QuizBrain quizBrain = QuizBrain();
Option1 opt1 = Option1();
Option2 opt2 = Option2();
Option3 opt3 = Option3();
Option4 opt4 = Option4();

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
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
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
          desc: 'You\'ve reached the end of the quiz.',
        ).show();

        quizBrain.reset();
        opt1.reset();
        opt2.reset();
        opt3.reset();
        opt4.reset();

        scoreKeeper = [];
      } else {
        if (answer == quizBrain.getCorrectAnswer()) {
          final player = AudioCache();
          player.play('2.wav');
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          final player = AudioCache();
          player.play('3.wav');
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        quizBrain.changeQuestion();
        opt2.changeOpt2();
        opt3.changeOpt3();
        opt1.changeOpt1();
        opt4.changeOpt4();
      }
    });
//    if (answer == quizBrain.getCorrectAnswer()) {
//      scoreKeeper.add(Icon(
//        Icons.check,
//        color: Colors.green,
//      ));
//    } else {
//      scoreKeeper.add(Icon(
//        Icons.close,
//        color: Colors.red,
//      ));
//    }
//    setState(() {
//      quizBrain.changeQuestion();
//      opt2.changeOpt2();
//      opt3.changeOpt3();
//      opt1.changeOpt1();
//      opt4.changeOpt4();
//    });
  }

  List<Icon> scoreKeeper = [];

  @override
  Widget build(BuildContext context) {
    return Column(

      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(

          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                //'',
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
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                  flex: 5,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    child: FlatButton(
                      color: Colors.black,
                      onPressed: () {
                        correct(opt1.getOption1());
                      },
                      child: Text(opt1.getOption1(),
                        style:TextStyle(
                            color: Colors.white,
                          fontSize: 18
                        ),),
                    ),
                  )),
              Expanded(
                  flex: 5,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    //padding: const EdgeInsets.all(8.0),
                    child: FlatButton(
                      color: Colors.black,
                      onPressed: () {
                        correct(opt2.getOption2());
                      },
                      child: Text(opt2.getOption2(),
                        style:TextStyle(
                            color: Colors.white,
                            fontSize: 18
                        ),),
                    ),
                  ))
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                  flex: 5,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    child: FlatButton(
                      color: Colors.black,
                      onPressed: () {
                        correct(opt3.getOption3());
                      },
                      child: Text(opt3.getOption3(),
                        style:TextStyle(
                            color: Colors.white,
                            fontSize: 18
                        ),),
                    ),
                  )),
              Expanded(
                  flex: 5,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    //padding: const EdgeInsets.all(8.0),
                    child: FlatButton(
                      color: Colors.black,
                      onPressed: () {
                        correct(opt4.getOption4());
                      },
                      child: Text(opt4.getOption4(),
                      style:TextStyle(
                        color: Colors.white,
                          fontSize: 18
                      ),),
                    ),
                  ))
            ],
          ),
        ),
        Wrap(
          direction: Axis.horizontal,
          children: scoreKeeper,
        )
      ],
    );
  }
}
