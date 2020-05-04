import 'question.dart';
import 'package:audioplayers/audio_cache.dart';

class QuizBrain {
  int _questionNumber = 0;
  List<Question> _questionBank = [
    Question('Which is the tallest mountain in the world?', 'Mt.Everest'),
    Question('Who was the first man to fly around the earth with a spaceship?',
        'Gagarin'),
    Question('In which country were the first Olympic Games held?', 'Greece'),
    Question('What do the Japanese people call their own country?', 'Nippon'),
    Question('What island, which belonged to Denmark, was independent in 1944?',
        'Iceland'),
    Question(
        'Which Turkish city has the name of a cartoon character?', 'Batman'),
    Question('Who killed the Minotaur ?', 'Theseus'),
    Question(
        'What is the name of the winged horse in Greek mythology?', 'Pegasus'),
    Question('What is the national sport in Japan?', 'Sumo Wrestling'),
    Question('Which football club has the most UCL wins?', 'Real Madrid'),
    Question(
        'Which football club won three straight UEFA Champions League titles since the tournament\'s inception?',
        'Real Madrid'),
    Question('When did dinosaurs become extinct?', '65M yrs ago'),
    Question(
        'During which era did dinosaurs dominate the world?', 'Mesozoic era'),
    Question('Which is the largest land carnivorous animal?', 'Spinosaurus'),
    Question('What is the largest predator in the world?', 'Polar Bear'),
    Question(
        'Which actor appeared in famous films, such as \'Gone in 60 Seconds\'\', \'Face/Off\', \'Ghost Rider\'?',
        'Nicolas Cage'),
    Question('In what year was Google launched on the web?', '1998'),
    Question('Which vitamin is the only one that you will not find in an egg?',
        'Vitamin C'),
  ];

  void changeQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestion() {
//    final player = AudioCache();
//    player.play('1.wav');
    return _questionBank[_questionNumber].questionText;
  }

  String getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      print('Now returning true');
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
