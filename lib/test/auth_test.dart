import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
              onPressed: () async {
                try {
                  await FirebaseAuth.instance.signInAnonymously();
                  print('User signed in anonymously!');
                } catch (e) {
                  print('Error signing in anonymously: $e');
                }
              },
              child: Text('Sign In Anonymously'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                try {
                  await _signInWithGoogle();
                  print('User signed in with Google!');
                } catch (e) {
                  print('Error signing in with Google: $e');
                }
              },
              child: Text('Sign In with Google'),
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

  Future<void> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      throw e;
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: AuthenticationTestPage(),
  ));
}
