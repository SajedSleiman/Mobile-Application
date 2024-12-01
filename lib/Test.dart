import 'package:flutter/material.dart';
import 'Favorite.dart';
import 'Settings.dart';
import 'main.dart';
import 'Home.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  // List of questions with multiple-choice options and the correct answer
  final List<Map<String, dynamic>> questions = [
    {
      'question': 'What is the output of System.out.println(5 + 3)?',
      'options': ['5', '8', '10', '53'],
      'answer': '8',
    },
    {
      'question': 'Which method is used to print in Java?',
      'options': ['print()', 'echo()', 'System.out.println()', 'printf()'],
      'answer': 'System.out.println()',
    },
    {
      'question': 'Which data type is used for decimal numbers in Java?',
      'options': ['int', 'float', 'double', 'char'],
      'answer': 'double',
    },
    {
      'question': 'How do you declare a variable in Java?',
      'options': ['var x;', 'int x;', 'declare x;', 'let x;'],
      'answer': 'int x;',
    },
    {
      'question': 'What does an "if" statement do in Java?',
      'options': [
        'Executes code repeatedly',
        'Checks a condition',
        'Stops code execution',
        'Defines a function'
      ],
      'answer': 'Checks a condition',
    },
    {
      'question': 'What is the purpose of a loop in Java?',
      'options': [
        'Stops code execution',
        'Checks a condition',
        'Repeats a block of code',
        'Defines a variable'
      ],
      'answer': 'Repeats a block of code',
    },
    {
      'question': 'How do you declare an array in Java?',
      'options': ['int[] arr;', 'List arr;', 'Array arr;', 'int arr();'],
      'answer': 'int[] arr;',
    },
    {
      'question': 'What is the index of the first element in an array in Java?',
      'options': ['1', '0', '-1', 'Depends on the array'],
      'answer': '0',
    },
    {
      'question': 'What does OOP stand for?',
      'options': [
        'Only Oriented Programming',
        'Object-Oriented Programming',
        'Optimal Output Processing',
        'Oriented Object Programming'
      ],
      'answer': 'Object-Oriented Programming',
    },
    {
      'question': 'What is a class in Java?',
      'options': [
        'A blueprint for objects',
        'A data type',
        'A function',
        'A library'
      ],
      'answer': 'A blueprint for objects',
    },
  ];

  final Map<int, String> userAnswers = {}; // To store selected answers
  bool showResult = false;
  bool passed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const Home()),
                  (route) => false,
            );
          },
        ),
        title: const Text(
          'Test Page',
          style: TextStyle(fontSize: 23, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${index + 1}. ${questions[index]['question']}',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Column(
                        children: List<Widget>.generate(
                          questions[index]['options'].length,
                              (optionIndex) {
                            String option = questions[index]['options'][optionIndex];
                            return RadioListTile(
                              title: Text(option),
                              value: option,
                              groupValue: userAnswers[index],
                              onChanged: (value) {
                                setState(() {
                                  userAnswers[index] = value as String;
                                });
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  );
                },
              ),
            ),
            if (showResult)
              Text(
                passed ? 'Congratulations! You Passed!' : 'You Failed. Try Again!',
                style: TextStyle(
                  fontSize: 20,
                  color: passed ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            if (showResult && passed)
              ElevatedButton(
                onPressed: () {
                  // Handle certificate claiming logic here
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Certificate Claimed!')),
                  );
                },
                child: const Text('Claim Certificate'),
              ),
            if (showResult && !passed)
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    showResult = false;
                    userAnswers.clear();
                  });
                },
                child: const Text('Retry'),
              ),
            if (!showResult)
              ElevatedButton(
                onPressed: () {
                  int score = 0;
                  for (int i = 0; i < questions.length; i++) {
                    if (userAnswers[i] == questions[i]['answer']) {
                      score++;
                    }
                  }
                  double percentage = (score / questions.length) * 100;
                  setState(() {
                    showResult = true;
                    passed = percentage >= 75;
                  });
                },
                child: const Text('Submit'),
              ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blueAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Home()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.favorite, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Favorite()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.settings, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Settings()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}