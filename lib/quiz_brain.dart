import 'questions.dart';

class QuizBrain {
  int _questionNumber = 0;


  //15
  List<Question> _questionBank = [
    Question('CAT Reloaded was established in 1996', true),
    Question('The Leaning Tower is located in Germany', false), // Italy
    Question('The color of The Red Sea is blue', true),
    Question('the number of letters in English are 28', false), //26
    Question('The tallest Snake in the world is Anaconda', true),
    Question('the number of days in a week are 7 days', true),
    Question('Elephant is the largest animal', false), //Blue Whale
    Question('the tallest animal in the world is giraffe', true),
    Question('Iron is the heaviest metal', false),  //Iridium
    Question('The Alexandria Light House was the first building lit', true),
    Question('The capital city of Germany is München', false), //Berlin
    Question('The kinds of Elephants are African and Asian Elephants', true),
    Question('Egypt is famous for pasta', false), //Koushari
    Question('The bird penguin can\'t fly', true),
    Question('Basketball needs a tall player', true),


  ];

  String getQuestionText() => _questionBank[_questionNumber].questionText;

  bool getCorrectAnswer() => _questionBank[_questionNumber].questionAnswer;

  bool isFinished() => _questionNumber >= _questionBank.length - 1 ? true : false;

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) _questionNumber++;
  }

  void reset() => _questionNumber = 0;
}
