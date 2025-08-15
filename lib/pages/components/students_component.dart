import 'package:flutter/material.dart';
import 'package:fonovoo/domain/dtos/students_dto.dart';

class StudentsComponent extends StatefulWidget {
  StudentsDto studentsDto;
  VoidCallback goToEditPage;
  VoidCallback goToClassesPage;
  bool showCheckbox = false;

  StudentsComponent({
    super.key,
    required this.studentsDto,
    required this.goToEditPage,
    required this.goToClassesPage,
    required this.showCheckbox,
  });

  @override
  State<StatefulWidget> createState() {
    return _StudentsComponent();
  }
}

class _StudentsComponent extends State<StudentsComponent> {
  void _select() {
    // realoads only this component
    setState(() {
      widget.studentsDto.isSelected = !widget.studentsDto.isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: Colors.white,
      child: ListTile(
        leading: Icon(Icons.person),
        title: Text(widget.studentsDto.getName()),
        onTap: widget.showCheckbox ? _select : widget.goToClassesPage,
        trailing: IconButton(
          onPressed: widget.goToEditPage,
          icon: widget.showCheckbox && !widget.studentsDto.belongsToGroup
              ? Checkbox(
                  value: widget.studentsDto.isSelected,
                  onChanged: (value) {
                    if (widget.studentsDto.belongsToGroup) return;
                    _select();
                  },
                )
              : Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Icon(Icons.edit),
                ),
        ),
      ),
    );
  }
}
