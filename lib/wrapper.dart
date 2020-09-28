import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mrcci_ec/models/user.dart';
import 'package:mrcci_ec/pages/authentication/authenticate.dart';
import 'package:mrcci_ec/pages/home/home.dart';
import 'package:mrcci_ec/pages/home/waiting_confirm.dart';
import 'package:provider/provider.dart';
import 'package:mrcci_ec/services/firestore.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return either Home or Authenticate widget
    final user = Provider.of<GetFirebaseUser>(context);

    if (user != null) {
      return Home();
    } else {
      return Authenticate();
    }
  }
}
