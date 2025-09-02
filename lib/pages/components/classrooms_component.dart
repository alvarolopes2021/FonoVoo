import 'package:flutter/material.dart';
import 'package:fonovoo/domain/entities/classroom_entity.dart';

class ClassroomsComponent extends StatelessWidget {
  final ClassroomEntity classroomEntity;
  VoidCallback goToEditPage;
  VoidCallback goToStudentsPage;

  ClassroomsComponent({
    super.key,
    required this.classroomEntity,
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
        title: Text(classroomEntity.getName()),
        subtitle: Text("${classroomEntity.getNumberOfStudents()} aluno(s)"),
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
