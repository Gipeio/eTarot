import 'package:etarot/pages/menu_page.dart';
import 'package:etarot/styling/style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Connect With Cards',
              style: TextStyle(
                color: Style.itemTextColor
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _showSignInDialog();
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Style.itemTextColor,
                backgroundColor: Style.itemColor, // Text color
              ),
              child: Text('Sign In with Email'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _showSignUpDialog();
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Style.itemTextColor,
                backgroundColor: Style.itemColor, // Text color
              ),
              child: Text('Sign Up with Email'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                try {
                  await _signInWithGoogle();
                  print('User signed in with Google!');
                  _navigateToAccountPage();
                } catch (e) {
                  print('Error signing in with Google: $e');
                }
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Style.itemTextColor,
                backgroundColor: Style.itemColor, // Text color
              ),
              child: Text('Sign In with Google'),
            ),
            SizedBox(height: 16.0),
            GestureDetector(
              onTap: () {
                _showGuestWarningDialog(context);
              },
              child: const Text(
                'Continue as Guest',
                style: TextStyle(
                  color: Style.guestRedirectTextColor, // Text color
                  decoration:
                      TextDecoration.underline, // Optional: Add underline
                ),
              ),
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
                  if (passwordController.text ==
                      confirmPasswordController.text) {
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
          title: const Text('Warning'),
          content: const Text(
              'Some functionalities are disabled when logged in as a guest. For the best experience, log in with an account.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
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

  Future<void> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      throw e;
    }
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
