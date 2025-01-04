import 'package:flutter/material.dart';
import 'Settings.dart';
import 'Home.dart';

class Favorite extends StatelessWidget {
  final String userId; // Add the userId parameter
  const Favorite({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Home(userId: userId)), // Pass userId here
                  (route) => false,
            );
          },
        ),
        title: const Text(
          'Favorite',
          style: TextStyle(fontSize: 23, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: const Center(
        child: Text('Favorite'),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blueAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home, color: Colors.white),
              onPressed: () {
                // Make sure userId is available to pass to Home
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Home(userId: userId)),
                      (route) => false, // Clears previous routes
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.favorite, color: Colors.white),
              onPressed: () {
                // No need to navigate to Favorite screen again
              },
            ),
            IconButton(
              icon: const Icon(Icons.settings, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Settings(userId: userId)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
