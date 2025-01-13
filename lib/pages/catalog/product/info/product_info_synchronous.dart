import 'package:flutter/material.dart';

import 'id_data/id_data.dart';

class ProductInfoSynchronous extends StatelessWidget {
  const ProductInfoSynchronous({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: 1300,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  children: [
                    Flexible(
                      flex: 5,
                      child: IdData(),
                    ),
                    Flexible(
                      flex: 3,
                      child: Placeholder(),
                    ),
                    Expanded(
                      flex: 8,
                      child: SizedBox(),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Placeholder(),
                    ),
                    Flexible(
                      child: Placeholder(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
