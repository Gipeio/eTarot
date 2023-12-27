import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:etarot/model/user.dart';

class UserService {
  static Future<void> createUser(User user) async {
    try {
      final docUser = FirebaseFirestore.instance.collection('users').doc();
      final json = user.toJson();
      await docUser.set(json);
      print('User created successfully');
    } catch (e) {
      print('Error creating user: $e');
    }
  }

static Future<User?> getUser(String userId) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection('users').doc(userId).get();

      if (snapshot.exists) {
        return User.fromJson(snapshot.data());
      } else {
        print('Document does not exist');
        return null;
      }
    } catch (e) {
      print('Error getting user: $e');
      return null;
    }
  }

  static Future<void> updateUser(String userId, User updatedUser) async {
    try {
      final docUser = FirebaseFirestore.instance.collection('users').doc(userId);
      final json = updatedUser.toJson();
      await docUser.update(json);
      print('User updated successfully');
    } catch (e) {
      print('Error updating user: $e');
    }
  }

  static Future<void> deleteUser(String userId) async {
    try {
      final docUser = FirebaseFirestore.instance.collection('users').doc(userId);
      await docUser.delete();
      print('User deleted successfully');
    } catch (e) {
      print('Error deleting user: $e');
    }
  }
}
