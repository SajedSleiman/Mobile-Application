import 'package:flutter/material.dart';
import 'Favorite.dart';
import 'Settings.dart';
import 'main.dart';
import 'Chapter1.dart';
import 'Chapter2.dart';
import 'Chapter3.dart';
import 'Chapter4.dart';
import 'Chapter5.dart';
import 'Test.dart';
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const Home()),
                  (route) => false,
            );
          },
        ),
        title: const Text(
          'Start Your Journey',
          style: TextStyle(fontSize: 23, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          // Existing chapter containers
          _buildChapterRow(context, 'Chapter One', const Chapter1()),
          _buildChapterRow(context, 'Chapter Two', const Chapter2()),
          _buildChapterRow(context, 'Chapter Three', const Chapter3()),
          _buildChapterRow(context, 'Chapter Four', const Chapter4()),
          _buildChapterRow(context, 'Chapter Five', const Chapter5()),

          const Spacer(), // Push the button to the bottom

          // New button at the bottom center
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Action for the new button
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Test()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Take Test',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 20), // Space below the button
        ],
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Favorite()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.settings, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Settings()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChapterRow(BuildContext context, String chapterName, Widget chapterPage) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => chapterPage),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                chapterName,
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.favorite, color: Colors.blueAccent),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Favorite()),
              );
            },
          ),
        ],
      ),
    );
  }
}