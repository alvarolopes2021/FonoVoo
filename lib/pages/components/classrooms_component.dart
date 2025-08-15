import 'package:flutter/material.dart';

class ClassroomsComponent extends StatelessWidget {
  String classroomName = "";
  int numberOfStudents = 0;
  VoidCallback goToEditPage;
  VoidCallback goToStudentsPage;

  ClassroomsComponent({
    super.key,
    required this.classroomName,
    required this.goToEditPage,
    required this.goToStudentsPage,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: Colors.white,
      child: ListTile(
        leading: Icon(Icons.menu_book),
        title: Text(classroomName),
        subtitle: Text("$numberOfStudents alunos"),
        onTap: goToStudentsPage,
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
