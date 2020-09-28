import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<DocumentSnapshot>(context);
    print(userData);
    return Container(
      child: Center(
        child: Text('Home for Signned In & Active Users'),
      ),
    );
  }
}
