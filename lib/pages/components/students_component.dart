import 'package:flutter/material.dart';

class StudentsComponent extends StatelessWidget {
  String schoolName = "";
  VoidCallback goToEditPage;
  VoidCallback goToClassesPage;
  bool isSelected = false;

  StudentsComponent({
    super.key,
    required this.schoolName,
    required this.goToEditPage,
    required this.goToClassesPage,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: Colors.white,
      child: ListTile(
        leading: Icon(Icons.person),
        title: Text(schoolName),
        onTap: goToClassesPage,
        trailing: IconButton(
          onPressed: goToEditPage,
          icon: isSelected
              ? Radio(
                  value: true,
                  groupValue: isSelected,
                  onChanged: (value) {},
                )
              : Icon(Icons.edit),
        ),
      ),
    );
  }
}
