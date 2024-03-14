import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Result extends StatelessWidget {
  final int score;
  final Function resetQuiz;

  const Result(this.score, this.resetQuiz, {super.key});

  @override
  Widget build(BuildContext context) {
    _updateHighScore(score); // Update the high score
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You scored: $score',
            style: const TextStyle(fontSize: 24),
          ),
          ElevatedButton(
            onPressed: () {
              resetQuiz();
              Navigator.pop(context, score); // Pass back the score to MainMenu
            },
            child: const Text('Restart Quiz'),
          ),
        ],
      ),
    );
  }

  // Function to update the high score in SharedPreferences
  void _updateHighScore(int score) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int currentHighScore = prefs.getInt('highScore') ?? 0;
    if (score > currentHighScore) {
      await prefs.setInt('highScore', score);
    }
  }
}