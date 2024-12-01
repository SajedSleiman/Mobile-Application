import 'package:flutter/material.dart';
import 'Favorite.dart';
import 'Settings.dart';

class Chapter5 extends StatefulWidget {
  const Chapter5({super.key});

  @override
  _Chapter5State createState() => _Chapter5State();
}

class _Chapter5State extends State<Chapter5> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  String _feedback1 = "";
  String _feedback2 = "";

  void _checkAnswer1() {
    setState(() {
      _feedback1 = _controller1.text.trim().toLowerCase() == 'object'
          ? "✅ Correct!"
          : "❌ Incorrect, Please try again.";
    });
  }

  void _checkAnswer2() {
    setState(() {
      _feedback2 = _controller2.text.trim() == 'Car'
          ? "✅ Correct!"
          : "❌ Incorrect, Please try again.";
    });
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
              'In this chapter, we will learn about Object-Oriented Programming (OOP), a key concept in Java.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'What is OOP?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 8),
            const Text(
              'OOP stands for Object-Oriented Programming. It is a programming paradigm based on the concept of "objects", which contain data in the form of fields (attributes) and code in the form of methods.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'Example of a Class:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 8),
            const Text(
              'class Car {\n'
                  '    String brand;\n'
                  '    int speed;\n\n'
                  '    void display() {\n'
                  '        System.out.println("Brand: " + brand);\n'
                  '        System.out.println("Speed: " + speed);\n'
                  '    }\n'
                  '}\n'
                  'In this example, we define a class `Car` with attributes `brand` and `speed`, and a method `display` to print the car details.',
              style: TextStyle(fontSize: 16, fontFamily: 'Courier', backgroundColor: Color.fromARGB(20, 200, 200, 200)),
            ),
            const SizedBox(height: 16),
            const Text(
              'Exercise 1:\n'
                  'What do we call an instance of a class?',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _controller1,
              decoration: const InputDecoration(hintText: 'Enter Answer'),
            ),
            Text(
              _feedback1,
              style: TextStyle(
                  fontSize: 16, color: _feedback1.startsWith('✅') ? Colors.green : Colors.red),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _checkAnswer1,
              child: const Text('Check Answer'),
            ),
            const SizedBox(height: 16),
            const Text(
              'Exercise 2:\n'
                  'If we create an object of the class `Car` and assign the brand "Toyota", what is the name of the class?',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _controller2,
              decoration: const InputDecoration(hintText: 'Enter Answer'),
            ),
            Text(
              _feedback2,
              style: TextStyle(
                  fontSize: 16, color: _feedback2.startsWith('✅') ? Colors.green : Colors.red),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _checkAnswer2,
              child: const Text('Check Answer'),
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
                print("Home button pressed");
              },
            ),
            IconButton(
              icon: const Icon(Icons.favorite, color: Colors.white),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Favorite()));
              },
            ),
            IconButton(
              icon: const Icon(Icons.settings, color: Colors.white),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Settings()));
              },
            ),
          ],
        ),
      ),
    );
  }
}