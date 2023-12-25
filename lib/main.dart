import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp( options: DefaultFirebaseOptions.currentPlatform,);
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        body: AppBar(
            title: TextField(
              controller: controller,
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    final name = controller.text;

                    createUser(name: name);
                  },
                  icon: Icon(Icons.add)
                )
            ],
          ),
      ),
    );
  }

  Future createUser({required String name}) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc('my-id');

    final json = {
      'name': name,
      'age' : 21,
      'birthday' : DateTime(2001,7,28),
    };

    await docUser.set(json);
  }
}
