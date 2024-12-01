import 'package:flutter/material.dart';
import 'Favorite.dart';
import 'Settings.dart';
import 'main.dart';

class Chapter3 extends StatefulWidget {
  const Chapter3({super.key});

  @override
  _Chapter3State createState() => _Chapter3State();
}

class _Chapter3State extends State<Chapter3> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  String _feedback1 = "";
  String _feedback2 = "";

  bool _isDownwards = false;
  bool _isUpwards = false;

  void _checkAnswer() {
    setState(() {
      _feedback1 = _controller1.text.trim() == 'The number is negative'
          ? "✅ Correct!"
          : "❌ Incorrect, Please try again.";
    });
  }

  void _checkAnswer2() {
    setState(() {
      // Check if Downwards is selected and provide feedback
      if (_isDownwards) {
        _feedback2 = "✅ Correct!";
      } else {
        _feedback2 = "❌ Incorrect, Please try again.";
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
    fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
    ),
    const SizedBox(height: 16),
    const Text(
    'In this chapter, we will learn how to control the flow of our program using if statements and loops. These concepts are essential in making decisions and repeating actions in your programs.',
    style: TextStyle(fontSize: 16),
    ),
    const SizedBox(height: 16),
    const Text(
    'What is Control Flow?',
    style: TextStyle(
    fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
    ),
    const SizedBox(height: 8),
    const Text(
    'Control flow allows us to decide what the program should do next. With control flow statements like if-else and loops, we can make decisions and repeat actions based on conditions.',
    style: TextStyle(fontSize: 16),
    ),
    const SizedBox(height: 16),
    const Text(
    'If Statements:',
    style: TextStyle(
    fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
    ),
    const SizedBox(height: 8),
    const Text(
    'An if statement checks whether a condition is true or false. If the condition is true, the program runs the code inside the if block.',
    style: TextStyle(fontSize: 16),
    ),
    const SizedBox(height: 16),
    const Text(
    'Example If Statement:',
    style: TextStyle(
    fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
    ),
    const SizedBox(height: 8),
    const Text(
    'public class IfExample {\n'
    '    public static void main(String[] args) {\n'
    '        int age = 18;\n'
    '        if (age >= 18) {\n'
    '            System.out.println("You are an adult.");\n'
    '        } else {\n'
    '            System.out.println("You are a minor.");\n'
    '        }\n'
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
    'In this example, the program checks if the variable "age" is 18 or older and prints a message accordingly.',
    style: TextStyle(fontSize: 16),
    ),
    const SizedBox(height: 16),
    const Text(
    'Loops:',
    style: TextStyle(
    fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
    ),
    const SizedBox(height: 8),
    const Text(
    'A loop is used to repeat a block of code multiple times. There are different types of loops in Java, but we will focus on the "for" loop.',
    style: TextStyle(fontSize: 16),
    ),
    const SizedBox(height: 16),
    const Text(
    'Example For Loop:',
    style: TextStyle(
    fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
    ),
    const SizedBox(height: 8),
    const Text(
    'public class LoopExample {\n'
    '    public static void main(String[] args) {\n'
    '        for (int i = 1; i <= 5; i++) {\n'
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
    const SizedBox(height: 16),
    const Text(
    'In this example, the program prints numbers from 1 to 5 using a "for" loop.',
    style: TextStyle(fontSize: 16),
    ),
    const SizedBox(height: 8),
    const Text('Lets test your Knowledge 😁'),
    const SizedBox(height: 10),
    const Text(
    'Exercise 1:\n'
    '  import java.util.Scanner;\n'
    'public class NumberCheck {\n'
    'public static void main(String[] args) {\n'
    'Scanner scanner = new Scanner(System.in);\n'
    ' System.out.print("Enter a number: ");\n'
    'int number = scanner.nextInt();\n'
    'if (number > 0) {\n'
    ' System.out.println("The number is positive.");\n'
    '} else if (number < 0) {\n'
    'System.out.println("The number is negative.");\n'
    '} else {\n'
    ' System.out.println("The number is zero.");\n'
    '    }\n'
    '  }\n'
    '}',
    style: TextStyle(
    fontSize: 16,
    fontFamily: 'Courier',
    backgroundColor: Color.fromARGB(20, 200, 200, 200),
    ),
    ),
    const SizedBox(height: 8),
    const Text(
    'As you can see here we used scanner so that the user can input anything.\n'
    'So lets say the user inputs -1 what will the output of the system be ?',
    ),
    const SizedBox(height: 7),
    TextField(
    controller: _controller1,
    decoration: const InputDecoration(hintText: 'Enter Answer'),
    ),
    Text(_feedback1, style: TextStyle(fontSize: 16, color: _feedback1.startsWith('✅') ? Colors.green : Colors.red)),
    const SizedBox(height: 8),
    ElevatedButton(
    onPressed: _checkAnswer,
    child: const Text('Check Answer'),
    ),
    const SizedBox(height: 8),
    const Text(
    'Exercise 2:\n'
    'In this exercise, there is a loop. You must know if its counting upwards or downwards? ',
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
      CheckboxListTile(
        title: const Text('Upwards'),
        value: _isUpwards,
        onChanged: (bool? value) {
          setState(() {
            _isUpwards = value ?? false;
            if (_isUpwards) {
              _isDownwards = false;
            }
          });
        },
      ),
      CheckboxListTile(
        title: const Text('Downwards'),
        value: _isDownwards,
        onChanged: (bool? value) {
          setState(() {
            _isDownwards = value ?? false;
            if (_isDownwards) {
              _isUpwards = false;
            }
          });
        },
      ),
      const SizedBox(height: 10),
      ElevatedButton(
        onPressed: _checkAnswer2,
        child: const Text('Check Answer'),
      ),
      Text(_feedback2, style: TextStyle(fontSize: 16, color: _feedback2.startsWith('✅') ? Colors.green : Colors.red)),
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