import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newjob/Questions.dart';
import 'package:newjob/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  int _highScore = 0; // Variable to store the high score

  @override
  void initState() {
    super.initState();
    _loadHighScore(); // Load the high score when the app starts
  }

  // Function to load the high score from SharedPreferences
  void _loadHighScore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _highScore = prefs.getInt('highScore') ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        title: const Text('CHECK24 Quiz'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'CHECK24 Quiz',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to question/answer page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  const QuizPage()),
                ).then((score) {
                  // Update high score if applicable
                  if (score != null && score > _highScore) {
                    setState(() {
                      _highScore = score;
                    });
                  }
                });
              },
              child: Text('Start New Game'),

            ),
            const SizedBox(height: 20),
            Text(
              'High Score: $_highScore', // Display high score
              style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
