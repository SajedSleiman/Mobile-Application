import 'package:flutter/material.dart';
import 'Favorite.dart';
import 'main.dart';
import 'Home.dart';

class Settings extends StatelessWidget {
  final String userId; // Add the userId parameter
  const Settings({super.key, required this.userId});

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
          'Settings',
          style: TextStyle(fontSize: 23, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.account_circle, color: Colors.blue),
              title: const Text('Account Settings'),
              onTap: () {
                // Add functionality to navigate to account settings
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.notifications, color: Colors.blue),
              title: const Text('Notifications'),
              onTap: () {
                // Add functionality for notifications settings
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.color_lens, color: Colors.blue),
              title: const Text('Theme'),
              onTap: () {
                // Add functionality for theme selection
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.help, color: Colors.blue),
              title: const Text('Help & Support'),
              onTap: () {
                // Add functionality for help and support
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.blue),
              title: const Text('Log Out'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyApp()),
                );
              },
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
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Home(userId: userId)), // Pass userId here
                      (route) => false, // Clears previous routes
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.favorite, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Favorite(userId: userId)), // Pass userId here
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.settings, color: Colors.white),
              onPressed: () {
                // No need to navigate to Settings again
              },
            ),
          ],
        ),
      ),
    );
  }
}
