import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mrcci_ec/models/user.dart';
import 'package:mrcci_ec/pages/contact_support.dart';
import 'package:mrcci_ec/services/firebase_auth.dart';
import 'package:mrcci_ec/shared/widgets/custom_text_field.dart';
import 'package:mrcci_ec/shared/loading.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  void initState() {
    super.initState();
  }

  final AuthService _auth = AuthService();
  final GetFirebaseUser _newUser = GetFirebaseUser();
  String username = "";
  String contact = "";
  String address = "";
  String bio = "";
  String email = "";
  String password = "";
  String error = "";
  String dob = "20-2-2000";

  final _formkey = GlobalKey<FormState>();
  bool loading = false;

  @override
  void dispose() {
    super.dispose();
  }

  getBirthDate(DateTime userDate) {
    var date = userDate.toString();

    var dateParse = DateTime.parse(date);

    var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";
    setState(() {
      dob = formattedDate;
    });
  }

  registerUser() async {
    if (_formkey.currentState.validate()) {
      setState(() {
        loading = true;
      });
      dynamic result = await _auth.registerWithEmailAndPassword(
          email, password, username, dob, contact, address, bio);

      if (result == null || result == false) {
        setState(() {
          loading = false;
          error = "Registeration failed! Please Try Again.";
        });
      }
    }
  }

  Widget cardForm(Key key) {
    return Card(
      margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
      child: Form(
        key: key,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(hintText: 'Name'),
                validator: (val) => val.isEmpty ? 'Enter Fullname' : null,
                onChanged: (value) {
                  setState(() {
                    username = value;
                  });
                },
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'Email'),
                validator: (val) => val.isEmpty ? 'Enter Email' : null,
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'Password'),
                validator: (val) => val.length < 6
                    ? 'Password should be greater than 6 characters'
                    : null,
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                obscureText: true,
              ),
              SizedBox(
                height: 5,
              ),

              TextFormField(
                decoration: InputDecoration(hintText: 'Bio'),
                validator: (val) => val.isEmpty ? 'Fill your Biography' : null,
                onChanged: (value) {
                  setState(() {
                    bio = value;
                  });
                },
                maxLines: 3,
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'Address'),
                validator: (val) => val.isEmpty
                    ? 'Please fill your home or Office Address'
                    : null,
                onChanged: (value) {
                  setState(() {
                    address = value;
                  });
                },
                maxLines: 3,
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'Phone Number'),
                validator: (val) =>
                    val.isEmpty ? 'Enter your Phone Number' : null,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    contact = value;
                  });
                },
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  MaterialButton(
                    onPressed: () {
                      showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1920),
                              lastDate: DateTime(2050))
                          .then((date) {
                        getBirthDate(date);
                      });
                    },
                    color: Colors.blueGrey,
                    child: Text(
                      'Date of Birth',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(child: Text('Selected Date : $dob'))
                ],
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
                onPressed: registerUser,
                color: Colors.blueAccent,
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scrollbar(
            child: Align(
              alignment: Alignment.topCenter,
              child: Scaffold(
                  backgroundColor: Colors.white,
                  appBar: AppBar(
                    backgroundColor: Colors.blueAccent,
                    elevation: 0.0,
                    title: Text('Registeration for MRCCI'),
                    actions: [
                      FlatButton.icon(
                          onPressed: () {
                            widget.toggleView();
                          },
                          icon: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          label: Text(
                            'Sign in',
                            style: TextStyle(color: Colors.white),
                          )),
                    ],
                  ),
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          'Register for New user',
                          style: TextStyle(fontSize: 20),
                        ),
                        cardForm(_formkey),
                      ],
                    ),
                  )),
            ),
          );
  }
}
