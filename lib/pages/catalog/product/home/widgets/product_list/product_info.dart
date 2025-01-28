import 'package:flutter/material.dart';

class ProductInfoWidget extends StatefulWidget {
  const ProductInfoWidget({
    super.key,
    required this.selectInfoWidget,
    required this.isAllSelected,
    required this.sortType,
    required this.isAscending,
    required this.setSortType,
    required this.selectedColumns,
  });

  final Function selectInfoWidget;
  final Function setSortType;
  final bool isAllSelected;
  final String? sortType;
  final bool isAscending;
  final List<String> selectedColumns;

  @override
  State<ProductInfoWidget> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.only(bottom: 10, left: 15, right: 15),
      decoration: BoxDecoration(
        color: Color(0xFF264653),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(7.5),
          bottomRight: Radius.circular(7.5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            flex: 1,
            child: Container(
              height: 40,
              width: 70,
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(color: Colors.white),
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  widget.selectInfoWidget();
                },
                child: Icon(
                  widget.isAllSelected
                      ? Icons.check_box_outlined
                      : Icons.check_box_outline_blank,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          if (widget.selectedColumns.contains("ID"))
            Flexible(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  widget.setSortType("ID");
                },
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(color: Colors.white),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          "ID",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      if (widget.sortType == "ID")
                        Icon(
                          widget.isAscending
                              ? Icons.arrow_drop_up
                              : Icons.arrow_drop_down,
                          color: Colors.white,
                        ),
                    ],
                  ),
                ),
              ),
            ),
          if (widget.selectedColumns.contains("THUMBNAIL"))
            Flexible(
              flex: 3,
              child: GestureDetector(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(color: Colors.white),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          "THUMBNAIL",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          if (widget.selectedColumns.contains("NAME"))
            Flexible(
              flex: 8,
              child: GestureDetector(
                onTap: () {
                  widget.setSortType("NAME");
                },
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(color: Colors.white),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          "NAME",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      if (widget.sortType == "NAME")
                        Icon(
                          widget.isAscending
                              ? Icons.arrow_drop_up
                              : Icons.arrow_drop_down,
                          color: Colors.white,
                        ),
                    ],
                  ),
                ),
              ),
            ),
          if (widget.selectedColumns.contains("PRICE"))
            Flexible(
              flex: 3,
              child: GestureDetector(
                onTap: () {
                  widget.setSortType("PRICE");
                },
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(color: Colors.white),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          "PRICE",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      if (widget.sortType == "PRICE")
                        Icon(
                          widget.isAscending
                              ? Icons.arrow_drop_up
                              : Icons.arrow_drop_down,
                          color: Colors.white,
                        ),
                    ],
                  ),
                ),
              ),
            ),
          Expanded(
            flex: 15,
            child: Container(
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                  ),
                  Text(
                    "ETC...",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
