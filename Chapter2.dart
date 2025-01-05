import 'package:flutter/material.dart';

class Chapter2 extends StatefulWidget {
  final String userId;
  final VoidCallback onCompleted;

  const Chapter2({Key? key, required this.userId, required this.onCompleted})
      : super(key: key);

  @override
  _Chapter2State createState() => _Chapter2State();
}

class _Chapter2State extends State<Chapter2> {
  int? _selectedAnswer1; // Nullable variable for question 1
  int? _selectedAnswer2; // Nullable variable for question 2
  String _feedback = "";

  final List<String> _question1Options = [
    "Store data like age or name",
    "Draw pictures",
    "Make coffee",
  ];
  final List<String> _question2Options = [
    "int",
    "pizza",
    "superman",
  ];

  final int _correctAnswer1 = 0; // Correct index for question 1
  final int _correctAnswer2 = 0; // Correct index for question 2

  void _checkAnswers() {
    setState(() {
      if (_selectedAnswer1 == _correctAnswer1 && _selectedAnswer2 == _correctAnswer2) {
        _feedback = "✅ Great job! You got all the answers correct!";
        widget.onCompleted();
      } else {
        _feedback = "❌ Oops! Try again. Read the hints and give it another shot.";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Java for Kids - Chapter 2',
          style: TextStyle(fontSize: 23, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Chapter 2: Variables and Data Types',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Hi there! In programming, we use **variables** to store information like your age, "
                  "favorite color, or even if you like pizza! We also use **data types** to tell the computer "
                  "what kind of data we're storing. For example:\n\n"
                  "- **int**: Numbers like 5 or 10\n"
                  "- **String**: Words like 'Blue' or 'John'\n"
                  "- **boolean**: True or false (like 'I like pizza')\n",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'Question 1:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "What do we use variables for?",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            ..._buildRadioButtons(
              _question1Options,
              _selectedAnswer1,
                  (value) => setState(() => _selectedAnswer1 = value),
            ),
            const SizedBox(height: 16),
            const Text(
              'Question 2:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Which one is a data type?",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            ..._buildRadioButtons(
              _question2Options,
              _selectedAnswer2,
                  (value) => setState(() => _selectedAnswer2 = value),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _checkAnswers,
              child: const Text('Check Answers'),
            ),
            const SizedBox(height: 16),
            Text(
              _feedback,
              style: TextStyle(
                fontSize: 18,
                color: _feedback.startsWith('✅') ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildRadioButtons(
      List<String> options,
      int? selectedValue,
      ValueChanged<int?> onChanged,
      ) {
    return List.generate(
      options.length,
          (index) => RadioListTile<int>(
        title: Text(options[index]),
        value: index,
        groupValue: selectedValue,
        onChanged: onChanged,
      ),
    );
  }
}
