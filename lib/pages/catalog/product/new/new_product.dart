import 'package:exdock_backend_client/pages/catalog/product/info/product_info_data.dart';
import 'package:exdock_backend_client/pages/catalog/product/new/new_product_synchronous.dart';
import 'package:flutter/material.dart';

class NewProduct extends StatelessWidget {
  const NewProduct({super.key});

  Future<ProductInfoData> getProductData() async {
    return ProductInfoData(
      idData: IdData(
        sku: "",
        location: "",
        ean: "",
        manufacturer: "",
        categories: [],
      ),
      priceData: PriceData(
        costPrice: 0.00,
        taxClass: "",
        price: 0.00,
        salePrice: 0.00,
        saleDateStart: null,
        saleDateEnd: null,
      ),
      contentData: ContentData(
        description: "",
        shortDescription: "",
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
        return NewProductSynchronous(
          productData: snapshot.data!,
        );
      },
    );
  }
}
