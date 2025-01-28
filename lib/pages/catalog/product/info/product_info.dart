import 'package:exdock_backend_client/pages/catalog/product/info/product_info_data.dart';
import 'package:exdock_backend_client/pages/catalog/product/info/product_info_synchronous.dart';
import 'package:flutter/material.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({super.key});

  Future<ProductInfoData> getProductData() async {
    return ProductInfoData(
      idData: IdData(
        sku: "123232",
        location: "G23.15",
        ean: "1234567890123",
        manufacturer: "manufacturer",
        categories: [
          CategoryData(
            name: "test name",
          ),
        ],
      ),
      priceData: PriceData(
        costPrice: 18.99,
        taxClass: "standard VAT",
        price: 12.99,
        salePrice: 15.99,
        saleDateStart: DateTime(2024, 12, 05),
        saleDateEnd: DateTime(2024, 12, 20),
      ),
      contentData: ContentData(
        description: "test description",
        shortDescription: "short description",
      ),
      imageData: ImageData(
        url: "test",
        extensions: [],
      ),
    );
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
        return ProductInfoSynchronous(
          productData: snapshot.data!,
        );
      },
    );
  }
}
