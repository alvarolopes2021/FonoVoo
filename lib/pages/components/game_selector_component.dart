import 'package:flutter/material.dart';
import 'package:fonovoo/core/helpers/color_converter.dart';
import 'package:fonovoo/domain/dtos/category_dto.dart';

class GameSelectorComponent extends StatefulWidget {
  CategoryDto categoryDto;
  int index;
  Function(int) updateSelection;
  GameSelectorComponent({
    super.key,
    required this.categoryDto,
    required this.updateSelection,
    required this.index,
  });

  @override
  State<StatefulWidget> createState() {
    return _GameSelectorComponent();
  }
}

class _GameSelectorComponent extends State<GameSelectorComponent> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.updateSelection(widget.index);
      },
      child: Container(
        decoration: BoxDecoration(
          color: ColorConverter.stringToColor(widget.categoryDto.getColor()),
          border: Border.all(
            color: widget.categoryDto.isSelected
                ? Colors.greenAccent
                : Colors.transparent, // 👈 Border appears on click
            width: 10,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
