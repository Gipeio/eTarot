import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:etarot/model/user.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:date_field/date_field.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp( options: DefaultFirebaseOptions.currentPlatform,);
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  final controllerName = TextEditingController();
  final controllerAge = TextEditingController();
  final controllerBirthday = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Text('Add User'),
        ),
        body: ListView(
          padding: EdgeInsets.all(16),
          children: <Widget> [
            TextField(
              controller: controllerName,
              decoration: InputDecoration(
                hintText: 'Name'
              ),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: controllerAge,
              decoration: InputDecoration(
                hintText: 'Age'
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              child: Text('Create'),
              onPressed: () {
                final user = User(
                name: controllerName.text,
                age: int.parse(controllerAge.text),
                );
                createUser(user);
              },
            ),
          ],
        ),
      ), 
    );
  }

  Future createUser(User user) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc();

    final json = user.toJson();
    await docUser.set(json);
  }

}
