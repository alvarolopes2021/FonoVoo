import 'package:flutter/material.dart';

class ClassroomsComponent extends StatelessWidget {
  String schoolName;
  ClassroomsComponent({super.key, required this.schoolName});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(15),
      elevation: 2,
      shadowColor: Colors.white,
      child: ListTile(
        leading: Icon(Icons.school),
        title: Text(schoolName, style: TextStyle(fontWeight: FontWeight.bold)),
        contentPadding: EdgeInsets.all(10),
        trailing: IconButton(icon: Icon(Icons.edit), onPressed: () => {}),
      ),
    );
  }
}
