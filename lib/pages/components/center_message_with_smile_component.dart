import 'package:flutter/material.dart';

class CenterMessageWithSmileComponent extends StatelessWidget {
  String message;

  CenterMessageWithSmileComponent({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Icon(Icons.emoji_emotions, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
