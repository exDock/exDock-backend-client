import 'package:exdock_backend_client/globals/globals.dart';
import 'package:flutter/material.dart';

class ProductViewSize extends StatelessWidget {
  const ProductViewSize(
      {super.key,
      required this.size,
      required this.pageNumCallback,
      required this.maxSize});

  final int size;
  final Function pageNumCallback;
  final int maxSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin: EdgeInsets.only(left: 42),
      padding: EdgeInsets.symmetric(horizontal: 27, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: kBoxShadowList),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          size > 1
              ? GestureDetector(
                  onTap: () {
                    pageNumCallback(size - 1);
                  },
                  child: Icon(Icons.arrow_back_ios),
                )
              : Padding(padding: EdgeInsets.only(right: 24)),
          size > 9
              ? Padding(padding: EdgeInsets.only(right: 2))
              : Padding(padding: EdgeInsets.only(right: 10)),
          Text(size.toString()),
          Padding(padding: EdgeInsets.only(left: 10)),
          size < 20
              ? GestureDetector(
                  onTap: () {
                    pageNumCallback(size + 1);
                  },
                  child: Icon(Icons.arrow_forward_ios),
                )
              : Padding(padding: EdgeInsets.only(right: 17)),
        ],
      ),
    );
  }
}
