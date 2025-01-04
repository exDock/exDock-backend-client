import 'dart:math';

import 'package:exdock_backend_client/pages/products/product_data.dart';
import 'package:exdock_backend_client/pages/products/product_home_synchronous.dart';
import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  const Product({super.key});

  Future<ProductData> getProductData() async {
    List<ProductInfo> products = [];
    for (var i = 0; i < 100; i++) {
      products.add(ProductInfo(
          id: i, thumbnail: getRandomString(10), name: getRandomString(30)));
    }
    return ProductData(products: products);
  }

  String getRandomString(int length) {
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random _rnd = Random();

    return String.fromCharCodes(Iterable.generate(
        length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getProductData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            // TODO: handle error
          }
          return ProductHomeSynchronous(
            productData: snapshot.data!,
          );
        });
  }
}
