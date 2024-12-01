import 'package:flutter/material.dart';
import 'Favorite.dart';
import 'Settings.dart';
import 'main.dart';

class Chapter2 extends StatefulWidget {
  const Chapter2({super.key});

  @override
  _Chapter2State createState() => _Chapter2State();
}

class _Chapter2State extends State<Chapter2> {

  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();

  String _feedback1 = "";
  String _feedback2 = "";
  String _feedback3 = "";
  String _feedback4 = "";

  void _checkAnswers() {
    setState(() {
      _feedback1 = _controller1.text.trim() == 'favoriteColor' ? "✅ Correct!" : "❌ Incorrect, Please try again.";
      _feedback2 = _controller2.text.trim() == 'numberOfPets' ? "✅ Correct!" : "❌ Incorrect, Don't loose hope.";
      _feedback3 = _controller3.text.trim() == 'likesPizza' ? "✅ Correct!" : "❌ Incorrect, you can do it.";
      _feedback4 = _controller4.text.trim() == 'weight' ? "✅ Correct!" : "❌ Incorrect, I believe in you.";
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
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            const SizedBox(height: 16),
            const Text(
              'In this chapter, we will learn about variables and data types. Variables are used to store data, and data types define what kind of data we can store in them.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'What is a Variable?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 8),
            const Text(
              'A variable is a container for storing data values. In Java, you need to declare a variable before using it. When declaring a variable, you must specify its data type (e.g., int, String).',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'What are Data Types?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 8),
            const Text(
              'Data types specify the type of data a variable can store. There are two main categories of data types in Java: primitive data types and reference data types.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'Primitive Data Types:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 8),
            const Text(
              '1. int: Used to store integer numbers (e.g., 5, -3, 100).\n'
                  '2. double: Used to store decimal numbers (e.g., 3.14, -0.99).\n'
                  '3. boolean: Used to store true or false values.\n'
                  '4. char: Used to store a single character (e.g., "A", "b").\n'
                  '5. String: Used to store a sequence of characters (e.g., "Hello", "Java").',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'Example Program:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 8),
            const Text(
              'public class VariablesExample {\n'
                  '    public static void main(String[] args) {\n'
                  '        int age = 10;\n'
                  '        double height = 5.5;\n'
                  '        boolean isStudent = true;\n'
                  '        String name = "John";\n\n'
                  '        System.out.println("Name: " + name);\n'
                  '        System.out.println("Age: " + age);\n'
                  '        System.out.println("Height: " + height);\n'
                  '        System.out.println("Is Student: " + isStudent);\n'
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
              'Lets see if you learned something:\n',
            ),
            const SizedBox(height: 8),
            const Text(
              'public class PersonInfo {\n'
                  '    public static void main(String[] args) {\n'
                  '        String favoriteColor = "Blue";\n'
                  '        int numberOfPets = 2;\n'
                  '        boolean likesPizza = true;\n'
                  '        double weight = 55.5;\n\n'
                  '        System.out.println("Favorite Color: " + ??);\n'
                  '        System.out.println("Number of Pets: " + ??);\n'
                  '        System.out.println("Likes Pizza: " + ??);\n'
                  '        System.out.println("Weight: " + ??);\n'
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
              'Can you fill the question mark with the write answers?',
            ),
            const SizedBox(height: 8),
            // Text fields for each question
            TextField(
              controller: _controller1,
              decoration: const InputDecoration(hintText: 'Enter Answer for Favorite Color'),
            ),
            Text(_feedback1, style: TextStyle(fontSize: 16, color: _feedback1.startsWith('✅') ? Colors.green : Colors.red)),
            const SizedBox(height: 8),
            TextField(
              controller: _controller2,
              decoration: const InputDecoration(hintText: 'Enter Answer for Number of Pets'),
            ),
            Text(_feedback2, style: TextStyle(fontSize: 16, color: _feedback2.startsWith('✅') ? Colors.green : Colors.red)),
            const SizedBox(height: 8),
            TextField(
              controller: _controller3,
              decoration: const InputDecoration(hintText: 'Enter Answer for Likes Pizza'),
            ),
            Text(_feedback3, style: TextStyle(fontSize: 16, color: _feedback3.startsWith('✅') ? Colors.green : Colors.red)),
            const SizedBox(height: 8),
            TextField(
              controller: _controller4,
              decoration: const InputDecoration(hintText: 'Enter Answer for Weight'),
            ),
            Text(_feedback4, style: TextStyle(fontSize: 16, color: _feedback4.startsWith('✅') ? Colors.green : Colors.red)),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _checkAnswers,
              child: const Text('Check Answers'),
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
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const Settings()));
              },
            ),
          ],
        ),
      ),
    );
  }
}