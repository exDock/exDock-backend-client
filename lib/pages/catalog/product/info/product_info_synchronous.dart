import 'package:exdock_backend_client/pages/catalog/product/info/content/content.dart';
import 'package:exdock_backend_client/pages/catalog/product/info/id_data/category_list.dart';
import 'package:exdock_backend_client/pages/catalog/product/info/images/images.dart';
import 'package:exdock_backend_client/pages/catalog/product/info/price/price.dart';
import 'package:exdock_backend_client/pages/catalog/product/info/product_info_data.dart';
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
                      child: IdDataWidget(
                        idData: IdData(
                          sku: "",
                          location: "",
                          ean: "",
                          manufacturer: "",
                          categories: [],
                        ),
                        availableCategories: CategoryList(
                          categories: ["test1", "test2", "test3"],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Flexible(
                      flex: 3,
                      child: Price(
                        priceData: PriceData(
                            costPrice: 5.73,
                            taxClass: "Standard VAT",
                            price: 18.95,
                            salePrice: 15.95,
                            saleDateStart: "05-12-2024",
                            saleDateEnd: "05-12-2024"),
                      ),
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
                      flex: 2,
                      child: Content(
                        contentData: ContentData(
                            description: "test description",
                            shortDescription: "test desc"),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Flexible(
                      flex: 2,
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
