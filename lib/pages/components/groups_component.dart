import 'package:flutter/material.dart';
import 'package:fonovoo/domain/dtos/group_dto.dart';
import 'package:fonovoo/domain/dtos/students_dto.dart';

class GroupsComponent extends StatefulWidget {
  GroupDto group;
  bool isSelecting = false;
  bool isExpanded = false;
  List<StudentsDto> students;
  Function removeStudentFromGroup;

  GroupsComponent({
    super.key,
    required this.group,
    required this.students,
    required this.isSelecting,
    required this.removeStudentFromGroup,
  });

  @override
  State<StatefulWidget> createState() {
    return _GroupsComponent();
  }
}

class _GroupsComponent extends State<GroupsComponent> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: Colors.white,
      child: ExpansionTile(
        enabled: !widget.isSelecting,
        shape: Border(),
        leading: Icon(Icons.group),
        trailing: widget.isSelecting
            ? Checkbox(
                value: widget.group.isSelected,
                onChanged: (value) {
                  setState(() {
                    widget.group.isSelected = value!;
                  });
                },
              )
            : (widget.isExpanded)
            ? Icon(Icons.keyboard_arrow_up)
            : Icon(Icons.keyboard_arrow_down),
        onExpansionChanged: (value) {
          setState(() {
            widget.isExpanded = value;
          });
        },
        title: Text(widget.group.getName()),
        children: [
          SizedBox(
            height: 200,
            child: ListView.builder(
              itemCount: widget.students.length,
              itemBuilder: (childrenContext, index) {
                return ListTile(
                  title: Text(widget.students[index].getName()),
                  trailing: IconButton(
                    onPressed: () {
                      widget.removeStudentFromGroup.call(
                        widget.group.getId(),
                        widget.students[index],
                      );
                    },
                    icon: Icon(Icons.delete, color: Colors.red),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
