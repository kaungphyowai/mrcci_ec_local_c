import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mrcci_ec/models/user.dart';
import 'package:mrcci_ec/services/firebase_auth.dart';
import 'package:mrcci_ec/wrapper.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<GetFirebaseUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'MRCCI Executives',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.teal,
        ),
        home: Wrapper(),
      ),
    );
  }
}
