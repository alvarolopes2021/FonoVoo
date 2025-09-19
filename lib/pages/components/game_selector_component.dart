import 'package:flutter/material.dart';
import 'package:fonovoo/core/helpers/color_converter.dart';
import 'package:fonovoo/domain/dtos/category_dto.dart';

class GameSelectorComponent extends StatefulWidget {
  CategoryDto categoryDto;
  int index;
  Function(int) updateSelection;
  final Function displayExplanation;

  GameSelectorComponent({
    super.key,
    required this.categoryDto,
    required this.updateSelection,
    required this.index,
    required this.displayExplanation,
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
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            decoration: BoxDecoration(
              color: ColorConverter.stringToColor(
                widget.categoryDto.getColor(),
              ),
              border: Border.all(
                color: widget.categoryDto.isSelected
                    ? Colors.greenAccent
                    : Colors.transparent, // 👈 Border appears on click
                width: 10,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          IconButton(
            onPressed: () {
              widget.displayExplanation(widget.index);
            },
            icon: Icon(Icons.info, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
