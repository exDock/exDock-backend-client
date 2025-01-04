import 'package:exdock_backend_client/globals/globals.dart';
import 'package:flutter/material.dart';

class ProductViewSize extends StatefulWidget {
  const ProductViewSize({super.key, required this.size});

  final int size;

  @override
  State<ProductViewSize> createState() => _ProductViewSizeState();
}

class _ProductViewSizeState extends State<ProductViewSize> {
  int listSize = 100;

  @override
  void initState() {
    super.initState();
    listSize = widget.size;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 42),
      padding: EdgeInsets.symmetric(horizontal: 27, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: kBoxShadowList),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          listSize > 50
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      listSize = listSize - 50;
                    });
                  },
                  child: Icon(Icons.arrow_back_ios),
                )
              : Padding(padding: EdgeInsets.only(right: 32)),
          Padding(padding: EdgeInsets.only(right: 10)),
          Text(listSize.toString()),
          Padding(padding: EdgeInsets.only(left: 10)),
          listSize < 301
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      listSize = listSize + 50;
                    });
                  },
                  child: Icon(Icons.arrow_forward_ios),
                )
              : Padding(padding: EdgeInsets.only(right: 24))
        ],
      ),
    );
  }
}
