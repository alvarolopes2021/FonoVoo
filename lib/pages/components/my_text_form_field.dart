import 'package:flutter/material.dart';

class MyTextFormField extends StatefulWidget {
  String initialValue;
  String hint;
  Function updateValueFunction;

  MyTextFormField({
    super.key,
    required this.initialValue,
    required this.hint,
    required this.updateValueFunction,
  });

  @override
  State<MyTextFormField> createState() => _MyTextFormField();
}

class _MyTextFormField extends State<MyTextFormField> {
  late TextEditingController myController;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    myController = TextEditingController(text: widget.initialValue);
    return TextFormField(
      controller: myController,
      onChanged: (text) {
        widget.updateValueFunction.call(text);
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Este campo é obrigatório';
        }
        return null;
      },
      style: TextStyle(color: Colors.white), //
      decoration: InputDecoration(
        hint: Text(widget.hint, style: TextStyle(color: Colors.grey)),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white), // Your desired color
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white), // Your desired color
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent), // Your desired color
        ),
        errorStyle: TextStyle(color: Colors.redAccent),
        icon: Icon(Icons.school),
        iconColor: Colors.white,
      ),
      cursorColor: Colors.grey,
    );
  }
}
