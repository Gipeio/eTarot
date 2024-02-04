import 'package:etarot/pages/authentification_page.dart';
import 'package:etarot/pages/draw_page.dart';
import 'package:etarot/pages/stat_page.dart';
import 'package:etarot/pages/tutorial_page.dart';
import 'package:etarot/widgets/button_widget.dart';
import 'package:etarot/styling/style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  
  String currentUser = FirebaseAuth.instance.currentUser?.email ?? 'Guest';

  MenuPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.backgroundColor,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.15),
            Text(
              'Current User: $currentUser',
              style: const TextStyle(
                fontSize: 40,
                color: Colors.white,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.20),
            CustomButtonObject(label: 'Tutorial', onPressed: () => _navigateToPage(context, 'Tutorial')),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            CustomButtonObject(label: 'Draw', onPressed: () => _navigateToPage(context, 'Draw')),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
SizedBox(
  child: currentUser != 'Guest'
      ? CustomButtonObject(
          label: 'Statistics',
          onPressed: () => _navigateToPage(context, 'Statistics'),
        )
      : CustomButtonObject(
          disabled: true,
          label: 'Statistics',
          onPressed: () => _navigateToPage(context, 'Statistics'),
        ),
),
            SizedBox(height: MediaQuery.of(context).size.height * 0.175),
            GestureDetector(
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => AuthPage()),
                );
              },
              child: const Text(
                'Logout',
                style: TextStyle(
                  color: Style.guestRedirectTextColor, // Text color
                  decoration: TextDecoration.underline, // Optional: Add underline
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    await FirebaseAuth.instance.signOut();
    return true; // Return true to allow the back button press
  }

void _navigateToPage(BuildContext context, String pageName) {
  switch (pageName) {
    case 'Draw':
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DrawPage()),
      );
    case 'Statistics':
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => StatPage()),
      );
    case 'Tutorial':
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TutorialPage()),
      );
    default:
      print('Unknown page: $pageName');
  }
}

}
