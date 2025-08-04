import 'package:flutter/material.dart';

class SchoolsComponent extends StatelessWidget {
  String schoolName = "";

  SchoolsComponent({super.key, required this.schoolName});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: Colors.white,
      child: ListTile(
        leading: Icon(Icons.school),
        title: Text(schoolName),
        trailing: IconButton(onPressed: () => {}, icon: Icon(Icons.edit)),
      ),
    );
  }
}
