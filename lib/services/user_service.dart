import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:etarot/model/user.dart';

class UserService {
  static Future<void> createUser(User user) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc();
    final json = user.toJson();
    await docUser.set(json);
  }
}
