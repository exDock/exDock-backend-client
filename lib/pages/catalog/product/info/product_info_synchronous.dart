import 'package:exdock_backend_client/globals/globals.dart';
import 'package:exdock_backend_client/pages/catalog/product/info/content/content.dart';
import 'package:exdock_backend_client/pages/catalog/product/info/id_data/category_list.dart';
import 'package:exdock_backend_client/pages/catalog/product/info/images/images.dart';
import 'package:exdock_backend_client/pages/catalog/product/info/price/price.dart';
import 'package:exdock_backend_client/pages/catalog/product/info/product_info_data.dart';
import 'package:flutter/material.dart';

class ProductInfoSynchronous extends StatelessWidget {
  const ProductInfoSynchronous({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.amber,
            boxShadow: kBoxShadowList,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 50),
          child: SingleChildScrollView(
            child: SizedBox(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: SizedBox(
                        child: Column(
                          children: [
                            IdData(),
                            SizedBox(
                              height: 20,
                            ),
                            Price(),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Content(),
                          SizedBox(
                            height: 20,
                          ),
                          Images(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ].reversed.toList(),
    );
  }
}
