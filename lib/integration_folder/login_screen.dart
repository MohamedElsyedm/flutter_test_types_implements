import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_test_types_implements/integration_folder/home_screen.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

//  "email": "eve.holt@reqres.in",
// "password": "cityslicka"

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final url = Uri.parse('https://reqres.in/api/login');

    try {
      final response = await http.post(
        url,
        headers: {"x-api-key": "reqres-free-v1"},
        body: {
          "email": _emailController.text,
          "password": _passController.text,
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        log('success');

        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (_) => HomeScreen()));
      } else {
        final errorData = jsonDecode(response.body);
        setState(() {
          _errorMessage = errorData['error'];
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Something went wrong, Please try again.';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                key: const ValueKey('emailField'),
                controller: _emailController,
                decoration: InputDecoration(hintText: 'Email'),
              ),
              TextField(
                key: const ValueKey('passwordField'),
                controller: _passController,
                decoration: InputDecoration(hintText: 'Password'),
                obscureText: true,
              ),
              SizedBox(height: 10),
              if (_isLoading)
                const CircularProgressIndicator()
              else
                ElevatedButton(
                  key: const ValueKey('loginButton'),
                  onPressed: _login,
                  child: Text('Login'),
                ),
              if (_errorMessage != null) ...[
                const SizedBox(height: 8),
                Text(
                  _errorMessage!,
                  key: ValueKey('errorText'),
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
