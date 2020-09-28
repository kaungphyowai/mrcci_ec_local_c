import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mrcci_ec/models/user.dart';
import 'package:mrcci_ec/pages/authentication/register.dart';
import 'package:mrcci_ec/pages/contact_support.dart';
import 'package:mrcci_ec/services/firebase_auth.dart';
import 'package:mrcci_ec/shared/loading.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  void initState() {
    super.initState();
  }

  final AuthService _auth = AuthService();
  final GetFirebaseUser _newUser = GetFirebaseUser();
  String email = "";
  String password = "";
  String error = "";
  final _formkey = GlobalKey<FormState>();
  bool loading = false;

  @override
  void dispose() {
    super.dispose();
  }

  singInUser() async {
    if (_formkey.currentState.validate()) {
      setState(() {
        loading = true;
      });
      dynamic result = await _auth.signInWithEmailAndPassword(email, password);

      if (result == null) {
        setState(() {
          loading = false;
          error = "Enter a valid email address";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.blueAccent,
              elevation: 0.0,
              title: Text('Sign in to MRCCI EC'),
              actions: [
                FlatButton.icon(
                    onPressed: () {
                      widget.toggleView();
                    },
                    icon: Icon(
                      Icons.bookmark,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            ),
            body: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  margin: EdgeInsets.only(top: 10),
                  width: 150,
                  height: 150,
                  //padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  child: Image.asset('assets/images/mrcci_logo.jpg'),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: InputDecoration(hintText: 'Email'),
                          keyboardType: TextInputType.emailAddress,
                          validator: (val) =>
                              val.isEmpty ? 'Enter Email Address' : null,
                          onChanged: (val) {
                            setState(() {
                              email = val;
                            });
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Password',
                          ),
                          validator: (val) =>
                              val.isEmpty ? 'Enter Password' : null,
                          onChanged: (val) {
                            setState(() {
                              password = val;
                            });
                          },
                          obscureText: true,
                        ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        Container(
                          child: Text(
                            error,
                            style: TextStyle(color: Colors.red, fontSize: 14),
                          ),
                        ),
                        RaisedButton(
                          onPressed: singInUser,
                          color: Colors.blueAccent,
                          child: Text(
                            'Sign In',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ));
  }
}
