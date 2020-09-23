import 'package:flutter/material.dart';
import 'package:mrcci_ec/services/firebase_auth.dart';
import 'package:mrcci_ec/shared/loading.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isAuth = false;
  bool loading = false;
  final AuthService _auth = AuthService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  signOutUser() async {
    setState(() {
      loading = true;
    });
    _auth.signUserOut();
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.tealAccent[50],
            appBar: AppBar(
              backgroundColor: Colors.tealAccent[800],
              title: Text('MRCCI EC'),
              elevation: 0.0,
              actions: [
                FlatButton.icon(
                    onPressed: signOutUser,
                    icon: Icon(Icons.verified_user),
                    label: Text('Logout'))
              ],
            ),
          );
  }
}
