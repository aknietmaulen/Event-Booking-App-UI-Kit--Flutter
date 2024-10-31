import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController(); // New controller for image URL

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _nameController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _emailController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              style: const TextStyle(color: Colors.white),
              obscureText: true,
            ),
            TextField(
              controller: _imageUrlController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(labelText: 'Profile Image URL'), // Field for image URL
            ),
            ElevatedButton(
              onPressed: () async {
                final name = _nameController.text;
                final email = _emailController.text;
                final password = _passwordController.text;
                final profileURL = _imageUrlController.text; // Get image URL
                String? message = await Provider.of<AuthProvider>(context, listen: false)
                    .register(name, email, password, profileURL);
                Navigator.pushReplacementNamed(context, '/login');
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message ?? "Unknown error")));
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
