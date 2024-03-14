import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newjob/Update.dart';
import 'package:newjob/main.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _questionIndex = 0;
  int _score = 0;

  final List<Map<String, dynamic>> _questions = [
    // Your list of questions here
    {
      "question": "Wann wurde CHECK24 gegründet?",
      "answers": {
        "A": "1997",
        "B": "1999",
        "C": "2001",
        "D": "2004"
      },
      "questionImageUrl": null,
      "correctAnswer": "B",
      "score":200
    },
    {
      "question": "Wo befindet sich der CHECK24 Hauptsitz?",
      "answers": {
        "A": "Berlin",
        "B": "Hamburg",
        "C": "München",
        "D": "Frankfurt"
      },
      "questionImageUrl": "https://app.check24.de/vg2-quiz/images/vg2_building_001.jpg",
      "correctAnswer": "C",
      "score":100
    },
    {
      "question": "Was ist <u>keine</u> Leitlinie von CHECK24?",
      "answers": {
        "A": "Der Kunde ist König.",
        "B": "Der Kunde isst Könige."
      },
      "questionImageUrl": "null",
      "correctAnswer": "B",
      "score":50
    },
    {
      "question": "Wie heissen die beiden Familien aus den beliebten CHECK24 Werbespots?",
      "answers": {
        "A": "Bundy & Jefferson",
        "B": "Pritchett & Dunphy",
        "C": "Heffernan & Spooner",
        "D": "Kruger & Bergmann"
      },
      "questionImageUrl": "https://app.check24.de/vg2-quiz/images/vg2_family_001.jpg",
      "correctAnswer": "D",
      "score":200
    },
    {
      "question": "Wie ist das aktuelle Rating der CHECK24 App?",
      "answers": {
        "A": "Weniger als 1 Stern",
        "B": "2 bis 3 Sterne",
        "C": "3 bis 4 Sterne",
        "D": "über 4 Sterne (fast 5)"
      },
      "correctAnswer": "D",
      "score":100
    },
    {
      "question": "Wo checkt man Alles?",
      "answers": {
        "A": "CHECK23",
        "B": "CHECK24",
        "C": "CHECK1337",
        "D": "CHECK42"
      },
      "correctAnswer": "B",
      "score":50
    },
    {
      "question": "Welche App hat mehr Downloads?",
      "answers": {
        "A": "CHECK24",
        "B": "Verivox"
      },
      "correctAnswer": "A",
      "score":50
    },
    {
      "question": "Wie heißt Mary Bergmann aus den belieben CHECK24 Werbespots auf Instagram?",
      "answers": {
        "A": "ferrerorielle",
        "B": "rocherielle",
        "C": "moncherielle",
        "D": "buenorielle"
      },
      "questionImageUrl": "https://app.check24.de/vg2-quiz/images/vg2_mary_001.jpg",
      "correctAnswer": "C",
      "score":200
    }
  ];

  void _answerQuestion(String selectedAnswer) {
    if (_questions[_questionIndex]['correctAnswer'] == selectedAnswer) {
      _score += _questions[_questionIndex]['score'] as int;
    }
    setState(() {
      _questionIndex++;
    });
  }

  void _resetQuiz() {
    setState(() {
      _score = 0;
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        title: const Text('Quiz'),
        backgroundColor: Colors.blueGrey,
      ),
      body: _questionIndex < _questions.length
          ? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _questions[_questionIndex]['questionImageUrl'] != null
              ? Image.network(
            _questions[_questionIndex]['questionImageUrl'],
            width: 200, // Adjust width as needed
            height: 200, // Adjust height as needed
          )
              : const SizedBox(), // Placeholder if no image
          Text(
            _questions[_questionIndex]['question'],
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 20),
          ...(_questions[_questionIndex]['answers'] as Map<String, dynamic>)
              .entries
              .map((answer) {
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  _answerQuestion(answer.key);
                },
                child: Text(answer.value),
              ),
            );
          }).toList(),
        ],
      )
          : Result(_score, _resetQuiz),
    );
  }
}