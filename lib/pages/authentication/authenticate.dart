import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mrcci_ec/pages/authentication/register.dart';
import 'package:mrcci_ec/pages/authentication/signIn.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  void initState() {
    super.initState();
  }

  bool showSignIn = true;
  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: showSignIn
          ? SignIn(toggleView: toggleView)
          : Register(toggleView: toggleView),
    );
  }
}
