import 'package:etarot/pages/menu_page.dart';
import 'package:etarot/styling/button_style.dart';
import 'package:etarot/styling/google_login_button_style.dart';
import 'package:etarot/styling/style.dart';
import 'package:etarot/test/front_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
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
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.15),
            const Center(
              child: Text(
                'Connect With Cards',
                style: TextStyle(
                  fontFamily: 'Rocher',
                  fontSize: 40,
                  color: Style.itemTextColor,
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.2),
            CustomButtonStyle(
              label: 'Sign In with Email',
              onPressed: () {
                _showSignInDialog();
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.025),
            CustomButtonStyle(
              onPressed: () {
                _showSignUpDialog();
              },
              label: 'Sign Up with Email',
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.025),
            GoogleLoginButton(
              onPressed: () async {
                try {
                  await _signInWithGoogle();
                  print('User signed in with Google!');
                  _navigateToAccountPage();
                } catch (e) {
                  print('Error signing in with Google: $e');
                }
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.025),
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
          backgroundColor: Style.backgroundColor,
          title: const Text(
            'Sign In with Email',
            style: TextStyle(
              color: Style.itemTextColor, // Change the title color
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Style.itemTextColor),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Style.itemTextColor),
                ),
                obscureText: true,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: Style.itemTextColor, // Change the title color
                ),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Style.itemColor), // Change the button color
              ),
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
              child: const Text(
                'Sign In',
                style: TextStyle(
                  color: Style.itemTextColor, // Change the title color
                ),
              ),
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
          title: const Text(
            'Sign Up with Email',
            style: TextStyle(
              color: Style.itemTextColor, // Change the title color
            ),
          ),
          backgroundColor: Style.backgroundColor,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Style.itemTextColor),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Style.itemTextColor),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: confirmPasswordController,
                decoration: const InputDecoration(
                  labelText: 'Confirm Password',
                  labelStyle: TextStyle(color: Style.itemTextColor),
                ),
                obscureText: true,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: Style.itemTextColor, // Change the title color
                ),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Style.itemColor), // Change the button color
              ),
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
              child: const Text(
                'Sign Up',
                style: TextStyle(
                  color: Style.itemTextColor, // Change the title color
                ),
              ),
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
          backgroundColor: Style.backgroundColor,
              title: const Text(
                'Warning',
                style: TextStyle(
                  color: Style.itemTextColor, // Change the title color
                ),
              ),
          
                        content: const Text(
                'Some functionalities are disabled when logged in as a guest. For the best experience, log in with an account.',
                style: TextStyle(
                  color: Style.itemTextColor, // Change the title color
                ),
              ),
            actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: Style.itemTextColor, // Change the title color
                ),
              ),
            ),
            ElevatedButton(
                style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Style.itemColor), // Change the button color
              ),
              onPressed: () async {
                Navigator.pop(context); // Close the dialog
                _navigateToAccountPage();
              },
              child: const Text(
                'Continue',
                style: TextStyle(
                  color: Style.itemTextColor, // Change the title color
                ),
              ),
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
    home: AuthPage(),
  ));
}
