import 'package:etarot/pages/menu_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _showSignInDialog();
              },
              child: Text('Sign In with Email'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _showSignUpDialog();
              },
              child: Text('Sign Up with Email'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _showGuestWarningDialog(context);
              },
              child: Text('Continue as Guest'),
            ),
          ],
        ),
      ),
    );
  }

  void _showSignInDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Sign In with Email'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
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
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                  print('User signed in successfully!');
                  Navigator.pop(context); // Close the dialog
                  _navigateToAccountPage();
                } catch (e) {
                  print('Error signing in: $e');
                }
              },
              child: Text('Sign In'),
            ),
          ],
        );
      },
    );
  }

  void _showSignUpDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Sign Up with Email'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
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
              TextField(
                controller: confirmPasswordController,
                decoration: InputDecoration(labelText: 'Confirm Password'),
                obscureText: true,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  if (passwordController.text == confirmPasswordController.text) {
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: emailController.text,
                      password: passwordController.text,
                    );
                    print('User signed up successfully!');
                    Navigator.pop(context); // Close the dialog
                    _navigateToAccountPage();
                  } else {
                    print('Passwords do not match');
                  }
                } catch (e) {
                  print('Error signing up: $e');
                }
              },
              child: Text('Sign Up'),
            ),
          ],
        );
      },
    );
  }

  void _showGuestWarningDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Warning'),
          content: Text('Some functionalities are disabled when logged in as a guest. For the best experience, log in with an account.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                // Add logic to continue as a guest
                print('User continued as a guest!');
                Navigator.pop(context); // Close the dialog
                _navigateToAccountPage();
              },
              child: Text('Continue'),
            ),
          ],
        );
      },
    );
  }

  void _navigateToAccountPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MenuPage()),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}
