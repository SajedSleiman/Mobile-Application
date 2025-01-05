import 'package:flutter/material.dart';

class Chapter3 extends StatefulWidget {
  final String userId;
  final VoidCallback onCompleted;

  const Chapter3({Key? key, required this.userId, required this.onCompleted})
      : super(key: key);

  @override
  _Chapter3State createState() => _Chapter3State();
}

class _Chapter3State extends State<Chapter3> {
  int? _selectedAnswer1; // For Exercise 1
  int? _selectedAnswer2; // For Exercise 2
  String _feedback = "";

  final List<String> _exercise1Options = [
    "The number is positive",
    "The number is negative",
    "The number is zero",
  ];

  final List<String> _exercise2Options = [
    "Counts Upwards",
    "Counts Downwards",
  ];

  final int _correctAnswer1 = 1; // Correct index for Exercise 1
  final int _correctAnswer2 = 1; // Correct index for Exercise 2

  void _checkAnswers() {
    setState(() {
      if (_selectedAnswer1 == _correctAnswer1 && _selectedAnswer2 == _correctAnswer2) {
        _feedback = "✅ Great job! You got all the answers correct!";
        widget.onCompleted();
      } else {
        _feedback = "❌ Oops! Some answers are incorrect. Try again!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Java for Kids - Chapter 3',
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
              'Chapter 3: Control Flow - If Statements and Loops',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Learn about controlling the flow of your program using "if" statements and loops. These tools allow you to make decisions and repeat tasks efficiently.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            _buildSectionHeader('Exercise 1: If Statement'),
            const SizedBox(height: 8),
            const Text(
              'Here is a Java program that takes a number as input and determines if it is positive, negative, or zero. What will the output be if the input is -1?',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            const Text(
              'Code Snippet:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'import java.util.Scanner;\n'
                  'public class NumberCheck {\n'
                  '    public static void main(String[] args) {\n'
                  '        Scanner scanner = new Scanner(System.in);\n'
                  '        System.out.print("Enter a number: ");\n'
                  '        int number = scanner.nextInt();\n'
                  '        if (number > 0) {\n'
                  '            System.out.println("The number is positive.");\n'
                  '        } else if (number < 0) {\n'
                  '            System.out.println("The number is negative.");\n'
                  '        } else {\n'
                  '            System.out.println("The number is zero.");\n'
                  '        }\n'
                  '    }\n'
                  '}',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Courier',
                backgroundColor: Color.fromARGB(20, 200, 200, 200),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'What will the program print if the input is -1?',
              style: TextStyle(fontSize: 16),
            ),
            ..._buildRadioButtons(
              _exercise1Options,
              _selectedAnswer1,
                  (value) => setState(() => _selectedAnswer1 = value),
            ),
            const SizedBox(height: 16),
            _buildSectionHeader('Exercise 2: For Loop Direction'),
            const SizedBox(height: 8),
            const Text(
              'Analyze the following "for" loop and determine if it counts upwards or downwards:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            const Text(
              'Code Snippet:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'public class ReverseCountExample {\n'
                  '    public static void main(String[] args) {\n'
                  '        for (int i = 5; i >= 1; i--) {\n'
                  '            System.out.println("Count: " + i);\n'
                  '        }\n'
                  '    }\n'
                  '}',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Courier',
                backgroundColor: Color.fromARGB(20, 200, 200, 200),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Does this loop count upwards or downwards?',
              style: TextStyle(fontSize: 16),
            ),
            ..._buildRadioButtons(
              _exercise2Options,
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

  Widget _buildSectionHeader(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
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
