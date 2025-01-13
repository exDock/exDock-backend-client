import 'package:exdock_backend_client/pages/catalog/product/info/content/content.dart';
import 'package:exdock_backend_client/pages/catalog/product/info/images/images.dart';
import 'package:exdock_backend_client/pages/catalog/product/info/price/price.dart';
import 'package:flutter/material.dart';

import 'id_data/id_data.dart';

class ProductInfoSynchronous extends StatelessWidget {
  const ProductInfoSynchronous({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: 1500,
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
                    SizedBox(
                      height: 20,
                    ),
                    Flexible(
                      flex: 3,
                      child: Price(),
                    ),
                    Expanded(
                      flex: 8,
                      child: SizedBox(),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Content(),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Flexible(
                      child: Images(),
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
