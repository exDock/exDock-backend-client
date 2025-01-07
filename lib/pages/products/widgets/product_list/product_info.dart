import 'package:flutter/material.dart';

class ProductInfoWidget extends StatefulWidget {
  const ProductInfoWidget({super.key});

  @override
  State<ProductInfoWidget> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfoWidget> {
  bool selectedIcon = false;

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
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            flex: 1,
            child: Container(
              height: 40,
              width: 70,
              decoration: BoxDecoration(
                  border: Border(right: BorderSide(color: Colors.white))),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIcon = !selectedIcon;
                  });
                },
                child: Icon(
                  selectedIcon
                      ? Icons.check_box_outlined
                      : Icons.check_box_outline_blank,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  border: Border(right: BorderSide(color: Colors.white))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "ID",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  border: Border(right: BorderSide(color: Colors.white))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "THUMBNAIL",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          Flexible(
            flex: 8,
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  border: Border(right: BorderSide(color: Colors.white))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "NAME",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  border: Border(right: BorderSide(color: Colors.white))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "PRICE",
                    style: TextStyle(color: Colors.white),
                  )
                ],
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
                  Padding(padding: EdgeInsets.only(left: 20)),
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
