import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pro_angler/Models/user.dart';

class UserService {
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> addUser(UserData user) async {
    await _usersCollection.doc(user.id).set(user.toJson());
  }

  Future<UserData> getUserById(String userId) async {
    final snapshot = await _usersCollection.doc(userId).get();
    final userData = snapshot.data() as Map<String, dynamic>?;
    return UserData.fromJson(userData!);
  }

  Future<List<UserData>> getUsersByIds(List<String> userIds) async {
    return await Future.wait(userIds.map((id) => getUserById(id)));
  }

  Future<void> updateUser(UserData user) async {
    await _usersCollection.doc(user.id).update(user.toJson());
  }

  Future<void> deleteUser(String userId) async {
    await _usersCollection.doc(userId).delete();
  }

  Future<List<UserData>> searchUsers(String query) async {
    QuerySnapshot snapshot =
        await _usersCollection.where('name', isEqualTo: query).get();

    QuerySnapshot emailSnapshot =
        await _usersCollection.where('email', isEqualTo: query).get();

    List<UserData> users = [];

    users.addAll(snapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return UserData.fromJson(data);
    }));

    users.addAll(emailSnapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return UserData.fromJson(data);
    }));

    return users;
  }

  Future<List<UserData>> getAllUsers() async {
    QuerySnapshot snapshot = await _usersCollection.get();
    
    List<UserData> users = snapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return UserData.fromJson(data);
    }).toList();
    
    return users;
  }
}