import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  String text;

  MyTextFormField({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.white), //
      decoration: InputDecoration(
        hint: Text("Nome da escola", style: TextStyle(color: Colors.grey)),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white), // Your desired color
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white), // Your desired color
        ),
        icon: Icon(Icons.school),
        iconColor: Colors.white,
      ),
      cursorColor: Colors.grey,
      initialValue: text,
    );
  }
}
