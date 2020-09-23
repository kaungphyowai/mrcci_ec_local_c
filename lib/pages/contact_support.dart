import 'package:flutter/material.dart';

class CustomerCare extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Customer Care',
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        //padding: EdgeInsets.symmetric(horizontal: 30, vertical: 00),
        margin: EdgeInsets.only(left: 50, right: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // /crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Text('MRCCI Customer Care'),
            ),
            Container(
              child: Text('092545879'),
            )
          ],
        ),
      ),
    );
  }
}
