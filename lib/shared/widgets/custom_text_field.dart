import 'package:flutter/material.dart';

class KTextCustomField extends StatefulWidget {
  final String hinttext;
  final String validText;
  dynamic onChangeValue;
  KTextCustomField({this.hinttext, this.validText, this.onChangeValue});
  @override
  _KTextCustomFieldState createState() => _KTextCustomFieldState();
}

class _KTextCustomFieldState extends State<KTextCustomField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(hintText: widget.hinttext),
      validator: (val) => val.isEmpty ? widget.validText : null,
      onChanged: (value) {
        setState(() {
          widget.onChangeValue = value;
        });
      },
      obscureText: widget.hinttext == "Password" ? true : false,
      maxLines:
          widget.hinttext == "Bio" || widget.hinttext == "Address" ? 4 : 1,
    );
  }
}
