// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:exdock_backend_client/globals/globals.dart';

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
      margin: const EdgeInsets.only(left: 42),
      padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 10),
      decoration: const BoxDecoration(
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
                  child: const Icon(Icons.arrow_back_ios),
                )
              : const Padding(
                  padding: EdgeInsets.only(right: 24),
                ),
          size > 9
              ? const Padding(
                  padding: EdgeInsets.only(right: 2),
                )
              : const Padding(
                  padding: EdgeInsets.only(right: 10),
                ),
          Text(
            size.toString(),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10),
          ),
          size < maxSize
              ? GestureDetector(
                  onTap: () {
                    pageNumCallback(size + 1);
                  },
                  child: const Icon(Icons.arrow_forward_ios),
                )
              : const Padding(
                  padding: EdgeInsets.only(right: 17),
                ),
        ],
      ),
    );
  }
}
