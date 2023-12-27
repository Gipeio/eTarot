import 'package:etarot/test/auth_test.dart';
import 'package:etarot/test/card_face_service_test.dart';
import 'package:etarot/test/user_service_test.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserServiceTest()),
                );
              },
              child: Text('users'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CardFaceServiceTest()),
                );
              },
              child: Text('faces'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AuthenticationTestPage()),
                );
              },
              child: Text('Auth'),
            ),
          ],
        ),
      ),
    );
  }
}