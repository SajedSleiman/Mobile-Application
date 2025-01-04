import 'package:flutter/material.dart';
import 'Login.dart';
import 'signup.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<dynamic> topStudents = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchTopStudents();
  }

  Future<void> fetchTopStudents() async {
    final url = Uri.parse('http://your-backend.com/getTopStudents.php'); // Replace with your backend URL
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data is List) {
          setState(() {
            topStudents = data;
            isLoading = false;
          });
        } else {
          setState(() {
            isLoading = false;
          });
          print('Unexpected data format: $data');
        }
      } else {
        setState(() {
          isLoading = false;
        });
        print('Failed to load students: ${response.statusCode}');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error fetching students: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Java For Kids 😁',
          style: TextStyle(fontSize: 23, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/java.jpeg"), // Path to the image
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                // Sign Up Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Signup()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Log In Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Log In",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                // Stats Section
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const Text(
                        "🏆 Top 5 Students",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      isLoading
                          ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                          : topStudents.isNotEmpty
                          ? ListView.builder(
                        shrinkWrap: true,
                        physics:
                        const NeverScrollableScrollPhysics(),
                        itemCount: topStudents.length,
                        itemBuilder: (context, index) {
                          final student = topStudents[index];
                          return Card(
                            color: Colors.white.withOpacity(0.9),
                            margin: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              leading: CircleAvatar(
                                child: Text(
                                  "${index + 1}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                backgroundColor: Colors.blueAccent,
                              ),
                              title: Text(
                                student['name'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              subtitle: Text(
                                "Score: ${student['score']}",
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          );
                        },
                      )
                          : const Text(
                        "No data available.",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
