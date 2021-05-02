import 'package:flutter/material.dart';
import 'package:quiz_app_task_5_CAT/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'questions.dart';
import 'package:audioplayers/audio_cache.dart';

QuizBrain quizBrain = QuizBrain();

class QuizBody extends StatefulWidget {
  @override
  _QuizBodyState createState() => _QuizBodyState();
}

class _QuizBodyState extends State<QuizBody> {
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool usersAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer();
    setState(() {
      if (quizBrain.isFinished() == true) {
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz, Thanks for your answers.',
        ).show();

        //for restarting the quiz again
        quizBrain.reset();
        scoreKeeper = [];
      }
      else {
        if (usersAnswer == correctAnswer) {
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        }
        else {
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        //  print(quizBrain.getCorrectAnswer());
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFDD2C00),
        centerTitle: true,
        title: Text(
          'Quiz App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/Cat Reloaded Logo.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              //Question Text
              Expanded(
                  //flex: 2,
                  child: Center(
                      child: Text(
                quizBrain.getQuestionText(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 30,
                ),
              ))),


              //True button
              CustomizedButton(buttonColor: Colors.green, text: 'True', answer: true),

              //False button
              CustomizedButton(buttonColor: Colors.red, text: 'False', answer: false),

              Row(
                children: scoreKeeper,
              )
            ],
          ),
        ),
      ),
    );
  }


  //Customized button for True & False buttons
  Widget CustomizedButton({String text, Color buttonColor, bool answer}) {
    //as a margin
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: buttonColor,
        // as a padding :)
        padding: EdgeInsets.all(20),
        onPressed: () {
          if (quizBrain.isFinished() == true) {
            final player = AudioCache();
            player.play('note1.wav');
          }
          //The user picked false.
          checkAnswer(answer);
        },
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
