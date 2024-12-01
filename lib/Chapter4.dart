import 'package:flutter/material.dart';
import 'Favorite.dart';
import 'Settings.dart';
import 'main.dart';

class Chapter4 extends StatefulWidget {
  const Chapter4({super.key});

  @override
  _Chapter4State createState() => _Chapter4State();
}

class _Chapter4State extends State<Chapter4> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  String _feedback1 = "";
  String _feedback2 = "";

  bool _isCorrectAnswer1 = false;
  bool _isFixedSize = false;
  bool _isFour = false;
  bool _isSeven = false;

  void _checkAnswer() {
    setState(() {
      _feedback1 = _controller1.text.trim() == '30' ? "✅ Correct!" : "❌ Incorrect, Please try again.";
    });
  }

  void _checkAnswer2() {
    setState(() {
      if (_isFixedSize) {
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
    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
    ),
    const SizedBox(height: 16),
    const Text(
    'In this chapter, we will learn how to use arrays to store multiple values in a single variable.',
    style: TextStyle(fontSize: 16),
    ),
    const SizedBox(height: 16),
    const Text(
    'What is an Array?',
    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
    ),
    const SizedBox(height: 8),
    const Text(
    'An array is a container that holds a fixed number of values of a single type. Arrays are used to store data in an efficient manner.',
    style: TextStyle(fontSize: 16),
    ),
    const SizedBox(height: 16),
    const Text(
    'Declaring an Array:',
    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
    ),
    const SizedBox(height: 8),
    const Text(
    'To declare an array, you specify the type of elements, followed by square brackets, and then the variable name.',
    style: TextStyle(fontSize: 16),
    ),
    const SizedBox(height: 16),
    const Text(
    'Example of Declaring an Array:',
    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
    ),
    const SizedBox(height: 8),
    const Text(
    'int[] numbers = {1, 2, 3, 4, 5};\n'
    'In this example, we declared an array of integers containing five numbers.',
    style: TextStyle(fontSize: 16, fontFamily: 'Courier', backgroundColor: Color.fromARGB(20, 200, 200, 200)),
    ),
    const SizedBox(height: 16),
    const Text(
    'Accessing Array Elements:',
    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
    ),
    const SizedBox(height: 8),
    const Text(
    'To access an element in an array, you use the index of the element. The index starts from 0.',
    style: TextStyle(fontSize: 16),
    ),
    const SizedBox(height: 16),
    const Text(
    'Example of Accessing Array Elements:',
    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
    ),
    const SizedBox(height: 8),
    const Text(
    'System.out.println(numbers[0]);  // Prints 1\n'
    'In this example, the first element (index 0) of the array is printed.',
    style: TextStyle(fontSize: 16, fontFamily: 'Courier', backgroundColor: Color.fromARGB(20, 200, 200, 200)),
    ),
    const SizedBox(height: 16),
    const Text(
    'Array Length:',
    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
    ),
    const SizedBox(height: 8),
    const Text(
    'The length of an array can be found using the length property.',
    style: TextStyle(fontSize: 16),
    ),
    const SizedBox(height: 16),
    const Text(
    'Example of Array Length:',
    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
    ),
    const SizedBox(height: 8),
    const Text(
    'int length = numbers.length;\n'
    'In this example, we get the length of the numbers array.',
    style: TextStyle(fontSize: 16, fontFamily: 'Courier', backgroundColor: Color.fromARGB(20, 200, 200, 200)),
    ),
    const SizedBox(height: 16),
    const Text(
    'Iterating Through an Array:',
    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
    ),
    const SizedBox(height: 8),
    const Text(
    'To loop through an array, we use a loop like a for loop to access each element.',
    style: TextStyle(fontSize: 16),
    ),
    const SizedBox(height: 16),
    const Text(
    'Example of Iterating Through an Array:',
    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
    ),
    const SizedBox(height: 8),
    const Text(
    'for (int i = 0; i < numbers.length; i++) {\n'
    '    System.out.println(numbers[i]);\n'
    '}\n'
    'In this example, the loop prints all the elements in the numbers array.',
    style: TextStyle(fontSize: 16, fontFamily: 'Courier', backgroundColor: Color.fromARGB(20, 200, 200, 200)),
    ),
    const SizedBox(height: 8),
    const Text('Let’s test your knowledge 😁'),
    const SizedBox(height: 10),
    const Text(
    'Exercise 1:\n'
    'What is the output of the following code?\n'
    'public class ArrayExample {\n'
    '    public static void main(String[] args) {\n'
    '        int[] numbers = {10, 20, 30, 40, 50};\n'
    '        System.out.println(numbers[2]);\n'
    '    }\n'
    '}\n',
    style: TextStyle(fontSize: 16, fontFamily: 'Courier', backgroundColor: Color.fromARGB(20, 200, 200, 200)),
    ),
    const SizedBox(height: 8),
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
    'How many elements can an array store in Java?',
    ),
    const SizedBox(height: 8),
    CheckboxListTile(
    title: const Text('Array size is fixed'),
    value: _isFixedSize,
    onChanged: (bool? value) {
    setState(() {
    _isFixedSize = value ?? false;
    _isFour = false;
    _isSeven = false;
    });
    },
    ),
    const SizedBox(height: 8),
    CheckboxListTile(
         title: const Text('4'),
         value: _isFour,
         onChanged: (bool? value) {
         setState(() {
          _isFour = value ?? false;
          _isFixedSize = false;
          _isSeven = false;
         });
       },
     ),
    const SizedBox(height: 8),
     CheckboxListTile(
       title: const Text('7'),
       value: _isSeven,
       onChanged: (bool? value) {
       setState(() {
          _isSeven = value ?? false;
          _isFour = false;
          _isFixedSize = false;
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