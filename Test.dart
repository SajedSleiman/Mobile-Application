import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TestPage extends StatefulWidget {
  final String userId; // Pass the user ID as a String
  const TestPage({Key? key, required this.userId}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  bool isLoading = true;
  bool hasError = false;
  String errorMessage = '';
  List<Map<String, dynamic>> questions = [];
  Map<int, String?> selectedAnswers = {}; // Store selected answers by question ID, make value nullable

  @override
  void initState() {
    super.initState();

    // Ensure userId is valid, otherwise show an error
    if (widget.userId.isEmpty) {
      setState(() {
        errorMessage = 'Invalid User ID';
        isLoading = false;
        hasError = true;
      });
    } else {
      fetchTestQuestions();
    }
  }

  // Fetch 5 random questions from the backend
  Future<void> fetchTestQuestions() async {
    final url = Uri.parse(
        'http://javaforkids.atwebpages.com/test_manager.php?action=retrieve_test_questions&user_id=${widget.userId}');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final fetchedQuestions = json.decode(response.body);

        if (fetchedQuestions is List<dynamic>) {
          setState(() {
            questions = fetchedQuestions.map((q) {
              return {
                'id': q['id'],
                'question': q['question'],
                'options': [
                  q['option1'],
                  q['option2'],
                  q['option3'],
                  q['option4'],
                ],
              };
            }).toList();
            isLoading = false;
            hasError = false; // Reset error state
          });
        } else {
          setState(() {
            errorMessage = 'Unexpected response format';
            isLoading = false;
            hasError = true;
          });
        }
      } else {
        setState(() {
          errorMessage = 'Failed to load questions (status code: ${response.statusCode})';
          isLoading = false;
          hasError = true;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Error occurred: $e';
        isLoading = false;
        hasError = true;
      });
    }
  }

  // Submit answers to the backend
  Future<void> submitAnswers() async {
    final url = Uri.parse(
        'http://javaforkids.atwebpages.com/test_manager.php?action=submit_answers');

    try {
      final response = await http.post(
        url,
        body: {
          'user_id': widget.userId,  // Pass userId as String
          'answers': json.encode(selectedAnswers), // Encode answers as JSON
        },
      );

      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        final score = result['score'];
        final percentage = result['percentage'];

        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Test Completed'),
            content: Text(
              'Your score is $score.\nYour percentage is ${percentage.toStringAsFixed(2)}%.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      } else {
        setState(() {
          errorMessage = 'Failed to submit answers (status code: ${response.statusCode})';
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Error occurred: $e';
      });
    }
  }

  // Build UI
  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (hasError) {
      return Scaffold(
        appBar: AppBar(title: const Text('Test Page')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                errorMessage,
                style: const TextStyle(color: Colors.red, fontSize: 18),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: fetchTestQuestions,
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Test Page')),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          final question = questions[index];
          final questionId = question['id'];

          return Card(
            margin: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Q${index + 1}: ${question['question']}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ...List.generate(question['options'].length, (i) {
                    return RadioListTile<String>(
                      title: Text(question['options'][i]),
                      value: question['options'][i],
                      groupValue: selectedAnswers[questionId], // Ensures that the correct option is selected
                      onChanged: (value) {
                        setState(() {
                          selectedAnswers[questionId] = value;
                        });
                      },
                    );
                  }),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: ElevatedButton(
          onPressed: () {
            if (selectedAnswers.length < questions.length) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Please answer all questions before submitting.'),
                ),
              );
            } else {
              submitAnswers();
            }
          },
          child: const Text('Submit Test'),
        ),
      ),
    );
  }
}
