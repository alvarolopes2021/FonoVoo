import 'package:flutter/material.dart';

class CenterMessageWithIconComponent extends StatelessWidget {
  String message;
  final Widget icon;

  CenterMessageWithIconComponent({
    super.key,
    required this.message,
    required this.icon,
  });

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
          Container(margin: EdgeInsets.all(10), child: icon),
        ],
      ),
    );
  }
}
