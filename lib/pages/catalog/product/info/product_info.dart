// Flutter imports:

// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:exdock_backend_client/pages/catalog/product/info/product_info_synchronous.dart';
import 'package:exdock_backend_client/utils/HTTP/HttpData.dart';
import 'package:exdock_backend_client/utils/HTTP/post_requests.dart';
import 'package:exdock_backend_client/utils/map_notifier.dart';

class ProductInfo extends StatefulWidget {
  const ProductInfo({
    super.key,
    this.productId,
  });

  final int? productId;

  @override
  State<ProductInfo> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  Future<Map<String, dynamic>> getJsonProductData(int productId) async {
    HttpData httpData = await standardPostRequest(
      "/api/v1/getBlockData",
      jsonEncode(
        {
          "product_id": productId,
          "page_name": "product_info",
        },
      ),
    );

    return jsonDecode(httpData.responseBody!) as Map<String, dynamic>;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getJsonProductData(widget.productId!),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Placeholder();
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return ProductInfoSynchronous(
            blocks: snapshot.data!,
            changeAttributeMap: MapNotifier(),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
