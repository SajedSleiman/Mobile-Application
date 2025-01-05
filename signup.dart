import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'Login.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _gradeController = TextEditingController();
  String _gender = "Male"; // Default gender selection
  String statusMessage = "";

  Future<void> _registerUser() async {
    // Use the correct URL for your hosted PHP script
    String url = "http://javaforkids.atwebpages.com/signup.php";

    if (!_formKey.currentState!.validate()) {
      return; // Stop if the form is invalid
    }

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "name": _nameController.text.trim(),
          "email": _emailController.text.trim(),
          "password": _passwordController.text.trim(),
          "age": _ageController.text.trim(),
          "grade": _gradeController.text.trim(),
          "gender": _gender,
        }),
      );

      final result = jsonDecode(response.body);

      if (response.statusCode == 200 && result["status"] == "success") {
        setState(() {
          statusMessage = "Registration successful!";
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Registration successful! Redirecting to login...")),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Login()),
        );
      } else {
        setState(() {
          statusMessage = result["message"] ?? "Unknown error occurred";
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(result["message"] ?? "Unknown error occurred")),
        );
      }
    } catch (e) {
      setState(() {
        statusMessage = "An error occurred: $e";
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("An error occurred: $e")),
      );
    }
  }

  InputDecoration _inputDecoration(String hint, IconData icon) {
    return InputDecoration(
      filled: true,
      fillColor: Colors.white,
      hintText: hint,
      prefixIcon: Icon(icon, color: Colors.blueAccent),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  "Create an Account",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _nameController,
                  decoration: _inputDecoration("Enter Your Name", Icons.person),
                  validator: (value) =>
                  value!.isEmpty ? "Name is required" : null,
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: _emailController,
                  decoration: _inputDecoration("Enter Your Email", Icons.email),
                  validator: (value) =>
                  value!.isEmpty || !value.contains("@")
                      ? "Enter a valid email"
                      : null,
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: _inputDecoration("Create a Password", Icons.lock),
                  validator: (value) => value!.length < 6
                      ? "Password must be at least 6 characters"
                      : null,
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  decoration: _inputDecoration("Enter Your Age", Icons.cake),
                  validator: (value) => value!.isEmpty ||
                      int.tryParse(value) == null
                      ? "Enter a valid age"
                      : null,
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: _gradeController,
                  decoration: _inputDecoration("Enter Your Grade", Icons.school),
                  validator: (value) =>
                  value!.isEmpty ? "Grade is required" : null,
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Male"),
                    Radio<String>(
                      value: "Male",
                      groupValue: _gender,
                      onChanged: (value) {
                        setState(() {
                          _gender = value!;
                        });
                      },
                    ),
                    const Text("Female"),
                    Radio<String>(
                      value: "Female",
                      groupValue: _gender,
                      onChanged: (value) {
                        setState(() {
                          _gender = value!;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _registerUser,
                  child: const Text("Submit"),
                ),
                Text(
                  statusMessage,
                  style: TextStyle(
                      color: statusMessage.contains("error")
                          ? Colors.red
                          : Colors.green),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
