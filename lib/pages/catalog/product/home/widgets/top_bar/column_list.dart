// Flutter imports:
import 'package:flutter/material.dart';

class ColumnList extends StatefulWidget {
  const ColumnList({
    super.key,
    required this.columnList,
    required this.selectedColumns,
    required this.deselectColumn,
  });

  final List<String> columnList;
  final List<String> selectedColumns;
  final Function deselectColumn;

  @override
  State<ColumnList> createState() => ColumnListState();
}

class ColumnListState extends State<ColumnList> {
  List<Widget> widgets = [];
  List<String> selectedColumns = [];

  @override
  void initState() {
    selectedColumns = widget.selectedColumns;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widgets = [];

    for (String columnName in widget.columnList) {
      bool isSelected = selectedColumns.contains(columnName);
      widgets.add(
        Flexible(
          flex: 1,
          child: GestureDetector(
            onTap: () {
              widget.deselectColumn(columnName);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (!isSelected) {
                        selectedColumns.add(columnName);
                      } else {
                        selectedColumns.remove(columnName);
                      }
                      setState(() {
                        widgets = [];
                      });
                    },
                    child: Icon(
                      isSelected
                          ? Icons.check_box_outlined
                          : Icons.check_box_outline_blank,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    columnName,
                    style: const TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Column(
        children: widgets,
      ),
    );
  }
}
