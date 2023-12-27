import 'package:etarot/model/user.dart';
import 'package:etarot/services/user_service.dart';
import 'package:flutter/material.dart';

class UserServiceTest extends StatefulWidget {
  UserServiceTest({Key? key}) : super(key: key);

  @override
  _UserServiceTestState createState() => _UserServiceTestState();
}

class _UserServiceTestState extends State<UserServiceTest> {
  final TextEditingController controllerUsername = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  String getAllText = 'Get All Text';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('User Services Tests'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(6),
          children: <Widget>[
            TextField(
              controller: controllerUsername,
              decoration: const InputDecoration(hintText: 'Username'),
            ),
            const SizedBox(height: 9),
            TextField(
              controller: controllerEmail,
              decoration: const InputDecoration(hintText: 'Email'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              child: const Text('Create'),
              onPressed: () {
                final user = User(
                  username: controllerUsername.text,
                  email: controllerEmail.text,
                  registrationDate: DateTime.now(), id: '',
                );
                UserService.createUser(user);
                controllerUsername.clear();
                controllerEmail.clear();
              },
            ),
            const SizedBox(height: 15),
            Text(
              getAllText,
              style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 18),
            ElevatedButton(
              child: const Text('Get All'),
              onPressed: () {
                setState(() {
                  getAllText = UserService.getUser(controllerUsername.text).toString();
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
