import 'package:etarot/model/user.dart';
import 'package:etarot/services/user_service.dart';
import 'package:flutter/material.dart';

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
                UserService.createUser(user);
              }
            ),
          ],
        ),
      ), 
    );
  }
}