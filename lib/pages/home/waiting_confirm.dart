import 'package:flutter/material.dart';

class WaitingConfirmation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Expanded(
            child: Text(
          'Waiting for Confirmation...',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
