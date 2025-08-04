import 'package:flutter/material.dart';

class SchoolsComponent extends StatelessWidget {
  String schoolName = "";
  VoidCallback goToEditPage;

  SchoolsComponent({
    super.key,
    required this.schoolName,
    required this.goToEditPage,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: Colors.white,
      child: ListTile(
        leading: Icon(Icons.school),
        title: Text(schoolName),
        trailing: IconButton(onPressed: goToEditPage, icon: Icon(Icons.edit)),
      ),
    );
  }
}
