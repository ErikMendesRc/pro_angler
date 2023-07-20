import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pro_angler/Models/user.dart';

class UserService {
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> addUser(User user) async {
    await _usersCollection.doc(user.id).set(user.toJson());
  }

  Future<User> getUserById(String userId) async {
    final snapshot = await _usersCollection.doc(userId).get();
    final userData = snapshot.data() as Map<String, dynamic>?;
    return User.fromJson(userData!);
  }

  Future<void> updateUser(User user) async {
    await _usersCollection.doc(user.id).update(user.toJson());
  }

  Future<void> deleteUser(String userId) async {
    await _usersCollection.doc(userId).delete();
  }

  Future<List<User>> searchUsers(String query) async {
    QuerySnapshot snapshot =
        await _usersCollection.where('name', isEqualTo: query).get();

    QuerySnapshot emailSnapshot =
        await _usersCollection.where('email', isEqualTo: query).get();

    List<User> users = [];

    users.addAll(snapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return User.fromJson(data);
    }));

    users.addAll(emailSnapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return User.fromJson(data);
    }));

    return users;
  }

  Future<List<User>> getAllUsers() async {
    QuerySnapshot snapshot = await _usersCollection.get();
    
    List<User> users = snapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return User.fromJson(data);
    }).toList();
    
    return users;
  }
}
