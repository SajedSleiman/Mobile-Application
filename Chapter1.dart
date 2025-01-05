import 'package:flutter/material.dart';

class Chapter1 extends StatefulWidget {
  final String userId;
  final VoidCallback onCompleted;

  const Chapter1({Key? key, required this.userId, required this.onCompleted})
      : super(key: key);

  @override
  _Chapter1State createState() => _Chapter1State();
}

class _Chapter1State extends State<Chapter1> {
  int? _selectedAnswer; // Nullable variable for the selected answer
  String _feedback = "";

  final List<String> _options = [
    'System.out.print("Hello World");',
    'Console.WriteLine("Hello World");',
    'echo "Hello World";',
    'System.out.println("Hello World");', // Correct answer
  ];

  final int _correctAnswer = 3; // Correct index for the question

  void _checkAnswer() {
    setState(() {
      if (_selectedAnswer == _correctAnswer) {
        _feedback = "✅ Great job! You got it right!";
        widget.onCompleted(); // Notify parent widget of completion
      } else {
        _feedback = "❌ Oops! That's not correct. Try again.";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Java for Kids - Chapter 1',
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
              'Chapter 1: Introduction to Java',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Welcome to your first Java lesson! Let's start by learning how to make the computer say something.\n\n"
                  "**What is a 'Hello World' Program?**\n"
                  "It's the simplest program in any language. It shows how to display text on the screen.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'Here’s how it looks in Java:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                '''public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello World");
    }
}''',
                style: TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Explanation:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '''- Every Java program starts with a **class**. Here, our class is called `HelloWorld`.
- The `main` method is where the program begins.
- `System.out.println` tells the computer to print text on the screen.''',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 16),
            const Text(
              'Question:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Which of the following is the correct way to print 'Hello World' in Java?",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            // Options as radio buttons
            Column(
              children: List.generate(
                _options.length,
                    (index) => RadioListTile<int>(
                  title: Text(_options[index]),
                  value: index,
                  groupValue: _selectedAnswer,
                  onChanged: (value) {
                    setState(() {
                      _selectedAnswer = value;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkAnswer,
              child: const Text('Check Answer'),
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
}
