import 'package:exdock_backend_client/pages/catalog/product/info/product_info_synchronous.dart';
import 'package:exdock_backend_client/utils/MapNotifier.dart';
import 'package:flutter/material.dart';

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
    return {
      "Id data": {
        "block_type": "id_information",
        "attributes": [
          {
            "attribute_id": "sku",
            "attribute_name": "SKU",
            "attribute_type": "text",
            "current_attribute_value": "123232",
          },
          {
            "attribute_id": "location",
            "attribute_name": "Location",
            "attribute_type": "text",
            "current_attribute_value": "G23.15",
          },
          {
            "attribute_id": "ean",
            "attribute_name": "EAN",
            "attribute_type": "text",
            "current_attribute_value": "1234567890123",
          },
          {
            "attribute_id": "manufacturer",
            "attribute_name": "Manufacturer",
            "attribute_type": "text",
            "current_attribute_value": "manufacturer",
          },
        ],
        "categories": [
          {
            "category_id": 1,
            "category_name": "test name",
          },
          {
            "category_id": 2,
            "category_name": "test name 2",
          },
          {
            "category_id": 3,
            "category_name": "test name 3",
          },
        ],
      },
      "Content": {
        "block_type": "standard",
        "attributes": [
          {
            "attribute_id": "description",
            "attribute_name": "Description",
            "attribute_type": "wysiwyg",
            "current_attribute_value": "test description",
          },
          {
            "attribute_id": "short_description",
            "attribute_name": "Short description",
            "attribute_type": "wysiwyg",
            "current_attribute_value": "short description",
          },
        ],
      },
      "Images": {
        "block_type": "images",
        "images": [
          {
            "image_url": "https://picsum.photos/200/1000",
            "image_name": "",
            "extensions": ["jpg", "png", "webp"],
          },
          {
            "image_url": "https://picsum.photos/1000/1000",
            "image_name": "",
            "extensions": ["jpg", "png", "webp"],
          },
        ],
      },
      "Price": {
        "block_type": "product_price",
        "attributes": [
          {
            "attribute_id": "cost_price",
            "attribute_name": "Cost price",
            "attribute_type": "price",
            "current_attribute_value": 18.99,
          },
          {
            "attribute_id": "tax_class",
            "attribute_name": "Tax class",
            "attribute_type": "text",
            "current_attribute_value": "standard VAT",
          },
          {
            "attribute_id": "price",
            "attribute_name": "Price",
            "attribute_type": "price",
            "current_attribute_value": 12.99,
          },
          {
            "attribute_id": "sale_price",
            "attribute_name": "Sale price",
            "attribute_type": "price",
            "current_attribute_value": 15.99,
          },
        ],
        "sale_dates": [
          {
            "attribute_id": "sale_date_start",
            "attribute_name": "Sale date start",
            "attribute_type": "date",
            "current_attribute_value": "2024-12-05",
          },
          {
            "attribute_id": "sale_date_end",
            "attribute_name": "Sale date end",
            "attribute_type": "date",
            "current_attribute_value": "2024-12-20",
          },
        ],
      },
    };
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
