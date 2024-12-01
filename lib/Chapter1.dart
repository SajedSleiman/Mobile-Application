import 'package:flutter/material.dart';
import 'Favorite.dart';
import 'Settings.dart';
import 'main.dart';

class Chapter1 extends StatefulWidget {
  const Chapter1({super.key});

  @override
  _Chapter1State createState() => _Chapter1State();
}

class _Chapter1State extends State<Chapter1> {
  final TextEditingController _controller = TextEditingController();
  String _feedback = "";

  void _checkAnswer() {
    if (_controller.text.trim() == 'System.out.print("Hello World");') {
      setState(() {
        _feedback = "✅ Correct! Great job!";
      });
    } else {
      setState(() {
        _feedback = "❌ Incorrect. Try again!";
      });
    }
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
                  fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            const SizedBox(height: 16),
            const Text(
              'Welcome to the exciting world of programming! In this chapter, we will learn about Java, one of the most popular programming languages used by developers around the world. Java is a versatile, platform-independent language that powers many applications, from mobile apps to enterprise systems.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'What is Java?',
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 8),
            const Text(
              'Java is a programming language and a platform that was created in 1995 by Sun Microsystems (now owned by Oracle). It is known for its "write once, run anywhere" capability, meaning you can write a Java program on one computer and run it on any other computer without needing to modify the code.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'Why Learn Java?',
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 8),
            const Text(
              '1. It is easy to learn and use.\n'
                  '2. Java has a large community of developers.\n'
                  '3. It is used in a variety of applications, such as Android apps, web servers, and scientific computing.\n'
                  '4. Java has many libraries and tools that make programming easier.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'Fun Fact:',
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 8),
            const Text(
              'The name "Java" comes from a type of coffee! The developers were inspired by their love of coffee while working on the language.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'Let\'s Start Coding!',
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 8),
            const Text(
              'To begin coding in Java, you need to install the Java Development Kit (JDK) on your computer. Once it is installed, you can write your first program!',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'Example Program:',
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 8),
            const Text(
              'public class HelloWorld {\n'
                  '    public static void main(String[] args) {\n'
                  '        System.out.println("Hello, World!");\n'
                  '    }\n'
                  '}',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Courier',
                backgroundColor: Color.fromARGB(20, 200, 200, 200),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'This program prints "Hello, World!" to the screen. It is a tradition to start with this program when learning a new programming language.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'Now lets test your Skills of what you Learned can you continue this Code??',
                style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height:16),
            const Text(
              'public class HelloWorld {\n'
              'public static void main(String[] args) {\n',
              style: TextStyle(fontFamily: 'Courier',
                fontSize: 16,
              )
            ),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Enter Your Answer Here',
              ),
            ),
            const Text(
              '    }\n'
                  '}',
              style: TextStyle(fontFamily: 'Courier',
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _checkAnswer,
              child: const Text('Check Answer'),
            ),
            const SizedBox(height: 16),
            Text(
              _feedback,
              style: TextStyle(
                  fontSize: 18,
                  color: _feedback.startsWith('✅') ? Colors.green : Colors.red),
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