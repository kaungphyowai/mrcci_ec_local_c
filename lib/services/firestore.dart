import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('userProfiles');

  Future newUser(String name, String dob, String phone, String bio,
      String email, String address, bool active) async {
    return await userCollection.doc(uid).set({
      'username': name,
      'dob': dob,
      'email': email,
      'bio': bio,
      'address': address,
      'phone': phone,
      'status': active
    });
  }

  // Future getUserStatusAndRole(String userid) async {
  //   dynamic userdata;
  //   await userCollection.doc(userid).get().then((val) {
  //     userdata = val.data();
  //   });
  //   return userdata;
  // }

  Stream<DocumentSnapshot> get userData {
    dynamic newuser;
    userCollection.doc(uid).get().then((value) {
      print(value.data());
      newuser = value.data();
    });
    return newuser;
  }
}
