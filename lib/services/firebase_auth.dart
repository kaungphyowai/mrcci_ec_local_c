import 'package:firebase_auth/firebase_auth.dart';
import 'package:mrcci_ec/models/user.dart';
import 'package:mrcci_ec/services/firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  GetFirebaseUser _userFromFirebase(User user) {
    return user != null ? GetFirebaseUser(uid: user.uid) : null;
  }

  Stream<GetFirebaseUser> get user {
    return _auth.authStateChanges().map((User user) => _userFromFirebase(user));
  }

  Future signInAuto() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFirebase(user);
    } catch (err) {
      print(err.toString());
      return null;
    }
  }

  //TODO: Sign In with email & Password
  Future signInWithEmailAndPassword(String email, String pass) async {
    try {
      UserCredential result =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);
      User user = result.user;
      print(user.uid);
      await DatabaseService(uid: user.uid).updateUser('testing user', 0, 100);
      return _userFromFirebase(user);
    } catch (err) {
      print(err.toString());
    }
  }

  //TODO: Register with Email & Password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //SignOut Function
  Future signUserOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
