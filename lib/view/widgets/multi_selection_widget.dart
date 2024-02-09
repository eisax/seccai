
import 'package:flutter/material.dart';

class MultiSelectWidget extends StatefulWidget {
  final List<String> selectionWidgetList;
  final List<String> selectedWidgetList;
  final ValueChanged<List<String>> onSelectionChanged;
  final int maximumSelectionSize;

  MultiSelectWidget({
    required this.selectionWidgetList,
    required this.selectedWidgetList,
    required this.onSelectionChanged,
    required this.maximumSelectionSize
  });

  @override
  _MultiSelectWidgetState createState() => _MultiSelectWidgetState();
}

class _MultiSelectWidgetState extends State<MultiSelectWidget> {
  int tappedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: widget.selectionWidgetList.asMap().entries.map(
            (entry) {
          int index = entry.key;
          String hobby = entry.value;
          bool isSelected = widget.selectedWidgetList.contains(hobby);

          return GestureDetector(
            onTap: () {
              setState(() {
                tappedIndex = index;
              });
              Future.delayed(Duration(milliseconds: 10), () {
                setState(() {
                  tappedIndex = -1;
                });
              });

              if (!widget.selectedWidgetList.contains(hobby)) {
                if (widget.selectedWidgetList.length < widget.maximumSelectionSize) {
                  widget.selectedWidgetList.add(hobby);
                }
              } else {
                widget.selectedWidgetList.removeWhere((element) => element == hobby);
              }
              widget.onSelectionChanged(widget.selectedWidgetList);
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: isSelected ? Theme.of(context).primaryColor : Theme.of(context).disabledColor,
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: tappedIndex == index ? Theme.of(context).shadowColor : Colors.transparent,
                    blurRadius: 5,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                child: Text(
                  hobby,
                  style: TextStyle(
                    color: isSelected ? Theme.of(context).primaryColor : Theme.of(context).disabledColor,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}
