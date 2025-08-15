import 'package:flutter/material.dart';

class SchoolsComponent extends StatelessWidget {
  String schoolName = "";
  VoidCallback goToEditPage;
  VoidCallback goToClassesPage;

  SchoolsComponent({
    super.key,
    required this.schoolName,
    required this.goToEditPage,
    required this.goToClassesPage,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: Colors.white,
      child: ListTile(
        leading: Icon(Icons.school),
        title: Text(schoolName),
        onTap: goToClassesPage,
        trailing: IconButton(
          onPressed: goToEditPage,
          icon: Container(
            margin: EdgeInsets.only(right: 20),
            child: Icon(Icons.edit),
          ),
        ),
      ),
    );
  }
}
