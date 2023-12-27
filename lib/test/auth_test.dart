import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationTestPage extends StatefulWidget {
  @override
  _AuthenticationTestPageState createState() => _AuthenticationTestPageState();
}

class _AuthenticationTestPageState extends State<AuthenticationTestPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Authentication Test Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                try {
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                  print('User signed up successfully!');
                } catch (e) {
                  print('Error signing up: $e');
                }
              },
              child: Text('Sign Up'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                try {
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                  print('User signed in successfully!');
                } catch (e) {
                  print('Error signing in: $e');
                }
              },
              child: Text('Sign In'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                try {
                  await FirebaseAuth.instance.signOut();
                  print('User signed out successfully!');
                } catch (e) {
                  print('Error signing out: $e');
                }
              },
              child: Text('Sign Out'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                User? user = FirebaseAuth.instance.currentUser;
                if (user != null) {
                  print('Current user: ${user.email}');
                } else {
                  print('No user signed in.');
                }
              },
              child: Text('Check Auth State'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AuthenticationTestPage(),
  ));
}
