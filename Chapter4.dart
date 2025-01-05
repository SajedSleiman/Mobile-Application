import 'package:flutter/material.dart';

class Chapter4 extends StatefulWidget {
  final String userId;
  final VoidCallback onCompleted;

  const Chapter4({
    Key? key,
    required this.userId,
    required this.onCompleted,
  }) : super(key: key);

  @override
  _Chapter4State createState() => _Chapter4State();
}

class _Chapter4State extends State<Chapter4> {
  int? _selectedAnswer1; // For Exercise 1
  int? _selectedAnswer2; // For Exercise 2
  String _feedback1 = '';
  String _feedback2 = '';

  // Correct answers
  final int _correctAnswer1 = 2; // Index of the correct answer for Exercise 1
  final int _correctAnswer2 = 1; // Index of the correct answer for Exercise 2

  void _checkAnswer1() {
    setState(() {
      _feedback1 = _selectedAnswer1 == _correctAnswer1
          ? '✅ Great job! You got it right!'
          : '❌ Oops! The correct answer is: 30.';
    });
  }

  void _checkAnswer2() {
    setState(() {
      _feedback2 = _selectedAnswer2 == _correctAnswer2
          ? '✅ Great job! You got it right!'
          : '❌ Oops! The correct answer is: An array size is fixed.';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Java for Kids - Chapter 4',
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
              'Chapter 4: Arrays',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "An array is like a box with many small compartments. Each compartment can hold one value, and you can use numbers (called indices) to pick which compartment to look at.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'Here’s an example:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'int[] numbers = {10, 20, 30, 40, 50};\n'
                    'System.out.println(numbers[0]); // Output: 10\n'
                    'System.out.println(numbers[2]); // Output: 30',
                style: TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Divider(),
            const Text(
              'Exercise 1',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "What is the output of this code?\n\n"
                  'int[] numbers = {10, 20, 30, 40, 50};\n'
                  'System.out.println(numbers[2]);',
              style: TextStyle(fontSize: 16),
            ),
            ..._buildRadioButtons(
              ['10', '20', '30', '40'],
              _selectedAnswer1,
                  (value) => setState(() => _selectedAnswer1 = value),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _checkAnswer1,
              child: const Text('Check Answer'),
            ),
            const SizedBox(height: 8),
            Text(
              _feedback1,
              style: TextStyle(
                fontSize: 16,
                color: _feedback1.startsWith('✅') ? Colors.green : Colors.red,
              ),
            ),
            const Divider(),
            const Text(
              'Exercise 2',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Which of the following is true about arrays in Java?',
              style: TextStyle(fontSize: 16),
            ),
            ..._buildRadioButtons(
              [
                'An array can grow dynamically.',
                'An array size is fixed.',
                'An array can hold elements of different types.',
              ],
              _selectedAnswer2,
                  (value) => setState(() => _selectedAnswer2 = value),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _checkAnswer2,
              child: const Text('Check Answer'),
            ),
            const SizedBox(height: 8),
            Text(
              _feedback2,
              style: TextStyle(
                fontSize: 16,
                color: _feedback2.startsWith('✅') ? Colors.green : Colors.red,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: widget.onCompleted,
              child: const Text('Mark as Completed'),
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
