import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('userProfiles');

  Future updateUser(String name, int age, int phone) async {
    print(name);
    return await userCollection
        .doc(uid)
        .set({'name': name, 'age': age, 'phone': phone});
  }
}
