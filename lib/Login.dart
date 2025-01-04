import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _statusMessage = "";
  bool _isLoading = false;

  /// Function to handle user login
  Future<void> _loginUser() async {
    const String url = "http://javaforkids.atwebpages.com/signin.php";

    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      _showStatusMessage("Please enter both email and password.", Colors.red);
      return;
    }

    setState(() {
      _isLoading = true;
      _statusMessage = ""; // Clear previous status
    });

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": _emailController.text.trim(),
          "password": _passwordController.text.trim(),
        }),
      );

      final result = jsonDecode(response.body);
      if (response.statusCode == 200 && result["status"] == "success") {
        _showStatusMessage("Login successful!", Colors.green);

        // Navigate to Home with user ID only
        String userId = result["user_id"].toString();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Home(
              userId: userId,
            ),
          ),
        );
      } else {
        setState(() {
          _statusMessage = result["message"] ?? "Login failed.";
        });
      }
    } catch (e) {
      _showStatusMessage("An error occurred: $e", Colors.red);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  /// Helper function to display a status message
  void _showStatusMessage(String message, Color color) {
    setState(() {
      _statusMessage = message;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Email Input Field
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),

              // Password Input Field
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  prefixIcon: const Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),

              // Login Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _loginUser,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: _isLoading
                      ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                      : const Text(
                    "Login",
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),

              // Status Message
              if (_statusMessage.isNotEmpty)
                Text(
                  _statusMessage,
                  style: TextStyle(
                    fontSize: 14,
                    color: _statusMessage.contains("error") || _statusMessage.contains("failed")
                        ? Colors.red
                        : Colors.green,
                  ),
                  textAlign: TextAlign.center,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
