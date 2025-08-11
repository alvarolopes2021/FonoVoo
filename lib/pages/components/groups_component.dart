import 'package:flutter/material.dart';

class GroupsComponent extends StatelessWidget {
  String groupName = "";
  VoidCallback goToEditPage;
  VoidCallback goToClassesPage;

  GroupsComponent({
    super.key,
    required this.groupName,
    required this.goToEditPage,
    required this.goToClassesPage,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: Colors.white,
      child: ExpansionTile(leading: Icon(Icons.group), title: Text(groupName)),
    );
  }
}
