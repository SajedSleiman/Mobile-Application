import 'package:flutter/material.dart';
import 'Favorite.dart';
import 'Settings.dart';

class Chapter5 extends StatefulWidget {
  final String userId;
  final VoidCallback onCompleted;

  const Chapter5({Key? key, required this.userId, required this.onCompleted}) : super(key: key);

  @override
  State<Chapter5> createState() => _Chapter5State();
}

class _Chapter5State extends State<Chapter5> {
  int? _selectedAnswer1; // For Exercise 1
  int? _selectedAnswer2; // For Exercise 2
  String _feedback1 = '';
  String _feedback2 = '';

  // Correct answers
  final int _correctAnswer1 = 1; // Index of the correct answer for Exercise 1
  final int _correctAnswer2 = 0; // Index of the correct answer for Exercise 2

  void _checkAnswer1() {
    setState(() {
      _feedback1 = _selectedAnswer1 == _correctAnswer1
          ? '✅ Great job! You got it right!'
          : '❌ Oops! The correct answer is: Object.';
    });
  }

  void _checkAnswer2() {
    setState(() {
      _feedback2 = _selectedAnswer2 == _correctAnswer2
          ? '✅ Great job! You got it right!'
          : '❌ Oops! The correct answer is: Car.';
    });
  }

  void _completeChapter() {
    widget.onCompleted(); // Notify Home about chapter completion
    Navigator.pop(context); // Navigate back to the Home page
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Java for Kids - Chapter 5',
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
              'Chapter 5: Object-Oriented Programming',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            const SizedBox(height: 16),
            const Text(
              "OOP helps us group code into objects. Think of an object as a real-world thing, like a car or a toy, that has features and actions.",
              style: TextStyle(fontSize: 16),
            ),
            const Divider(),
            const Text(
              'Exercise 1',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('What do we call an instance of a class?'),
            const SizedBox(height: 8),
            ..._buildRadioButtons(
              ['Class', 'Object', 'Method'],
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
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'If we create an object of the class `Car` and assign the brand "Toyota", what is the name of the class?',
            ),
            const SizedBox(height: 8),
            ..._buildRadioButtons(
              ['Car', 'Toyota', 'Brand'],
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
              onPressed: _completeChapter,
              child: const Text('Mark as Completed'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
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

  Widget _buildBottomNavBar() {
    return BottomAppBar(
      color: Colors.blueAccent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(Icons.home, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          IconButton(
            icon: const Icon(Icons.favorite, color: Colors.white),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Favorite(userId: widget.userId)),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Settings(userId: widget.userId)),
            ),
          ),
        ],
      ),
    );
  }
}
