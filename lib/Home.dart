import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'Chapter1.dart';
import 'Chapter2.dart';
import 'Chapter3.dart';
import 'Chapter4.dart';
import 'Chapter5.dart';

class Home extends StatefulWidget {
  final String userId;

  const Home({Key? key, required this.userId}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final List<Map<String, dynamic>> _chapters;
  Map<String, bool> _chapterCompletion = {}; // Tracks chapter completion
  bool _isLoading = true; // For showing a loading indicator
  String? _errorMessage; // For displaying error messages

  @override
  void initState() {
    super.initState();

    // Define chapters with their names and constructors
    _chapters = [
      {
        'name': 'Chapter 1',
        'widgetBuilder': () => Chapter1(
          userId: widget.userId,
          onCompleted: () => _markChapterAsCompleted('Chapter 1'),
        ),
      },
      {
        'name': 'Chapter 2',
        'widgetBuilder': () => Chapter2(
          userId: widget.userId,
          onCompleted: () => _markChapterAsCompleted('Chapter 2'),
        ),
      },
      {
        'name': 'Chapter 3',
        'widgetBuilder': () => Chapter3(
          userId: widget.userId,
          onCompleted: () => _markChapterAsCompleted('Chapter 3'),
        ),
      },
      {
        'name': 'Chapter 4',
        'widgetBuilder': () => Chapter4(
          userId: widget.userId,
          onCompleted: () => _markChapterAsCompleted('Chapter 4'),
        ),
      },
      {
        'name': 'Chapter 5',
        'widgetBuilder': () => Chapter5(
          userId: widget.userId,
          onCompleted: () => _markChapterAsCompleted('Chapter 5'),
        ),
      },
    ];

    _fetchProgress(); // Fetch chapter completion data
  }

  /// Fetch user progress from the server
  Future<void> _fetchProgress() async {
    final url = Uri.parse('http://javaforkids.atwebpages.com/get_completed_chapters.php');

    try {
      final response = await http.get(url.replace(queryParameters: {
        'user_id': widget.userId,
      }));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['status'] == 'success') {
          setState(() {
            _chapterCompletion = {
              for (var chapter in data['data'])
                chapter['chapter_name']: chapter['status'] == 'completed',
            };
            _isLoading = false;
          });
        } else {
          setState(() {
            _errorMessage = data['message'] ?? 'Failed to fetch progress.';
            _isLoading = false;
          });
        }
      } else {
        setState(() {
          _errorMessage = 'Server error. Status code: ${response.statusCode}';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'An error occurred: $e';
        _isLoading = false;
      });
    }
  }

  /// Mark a chapter as completed
  Future<void> _markChapterAsCompleted(String chapterName) async {
    final url = Uri.parse('http://javaforkids.atwebpages.com/track_progress.php');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'user_id': widget.userId,
          'action': 'update',
          'chapter_name': chapterName,
          'status': 'completed',
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['status'] == 'success') {
          setState(() {
            _chapterCompletion[chapterName] = true;
          });
        } else {
          debugPrint('Error updating progress: ${data['message']}');
        }
      } else {
        debugPrint('Failed to update progress. Status code: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error marking chapter as completed: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Start Your Journey',
          style: TextStyle(fontSize: 23, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: _isLoading
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : _errorMessage != null
          ? Center(
        child: Text(
          _errorMessage!,
          style: const TextStyle(color: Colors.red, fontSize: 16),
          textAlign: TextAlign.center,
        ),
      )
          : ListView.builder(
        itemCount: _chapters.length,
        itemBuilder: (context, index) {
          final chapter = _chapters[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => chapter['widgetBuilder'](),
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              elevation: 4,
              child: ListTile(
                title: Text(
                  chapter['name'],
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                trailing: _chapterCompletion[chapter['name']] == true
                    ? const Icon(Icons.check_circle, color: Colors.green)
                    : const Icon(Icons.radio_button_unchecked, color: Colors.grey),
              ),
            ),
          );
        },
      ),
    );
  }
}
