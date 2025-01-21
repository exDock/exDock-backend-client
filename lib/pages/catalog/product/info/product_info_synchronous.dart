import 'package:exdock_backend_client/pages/catalog/product/info/content/content.dart';
import 'package:exdock_backend_client/pages/catalog/product/info/id_data/id_data.dart';
import 'package:exdock_backend_client/pages/catalog/product/info/images/images.dart';
import 'package:exdock_backend_client/pages/catalog/product/info/price/price.dart';
import 'package:exdock_backend_client/pages/catalog/product/info/product_info_card/product_info_card_title.dart';
import 'package:exdock_backend_client/pages/catalog/product/info/product_info_data.dart';
import 'package:exdock_backend_client/pages/catalog/product/info/top_bar/top_bar.dart';
import 'package:flutter/material.dart';

import 'id_data/category_list.dart';

class ProductInfoSynchronous extends StatelessWidget {
  const ProductInfoSynchronous({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> idDataNotifier = ValueNotifier(false);
    ValueNotifier<bool> priceNotifier = ValueNotifier(false);
    ValueNotifier<bool> contentNotifier = ValueNotifier(false);
    ValueNotifier<bool> imageNotifier = ValueNotifier(false);
    ValueNotifier<bool> topBarNotifier = ValueNotifier(false);

    changeNotifierState(bool value, String valueName) {
      switch (valueName) {
        case "idData":
          idDataNotifier.value = value;
          break;
        case "price":
          priceNotifier.value = value;
          break;
        case "content":
          contentNotifier.value = value;
          break;
        case "images":
          imageNotifier.value = value;
          break;
      }

      if (idDataNotifier.value ||
          priceNotifier.value ||
          contentNotifier.value ||
          imageNotifier.value) {
        topBarNotifier.value = true;
      } else {
        topBarNotifier.value = false;
      }
    }

    return Stack(
      children: [
        TopBar(
          name: "Product Name",
          saveNotifier: topBarNotifier,
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
                            ProductInfoCardTitle(
                              title: "ID data",
                              unsavedChangesNotifier: idDataNotifier,
                              child: IdDataWidget(
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
                                availableCategories: CategoryList(
                                  categories: ["test"],
                                ),
                                changeNotifierState: changeNotifierState,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ProductInfoCardTitle(
                              title: 'Price',
                              unsavedChangesNotifier: priceNotifier,
                              child: Price(
                                priceData: PriceData(
                                  costPrice: 18.99,
                                  taxClass: "standard VAT",
                                  price: 12.99,
                                  salePrice: 15.99,
                                  saleDateStart: "05-12-2024",
                                  saleDateEnd: "05-12-2024",
                                ),
                                changeNotifierState: changeNotifierState,
                              ),
                            ),
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
                          ProductInfoCardTitle(
                            title: 'Content',
                            unsavedChangesNotifier: contentNotifier,
                            child: Content(
                              contentData: ContentData(
                                description: "test description",
                                shortDescription: "short description",
                              ),
                              changeNotifierState: changeNotifierState,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ProductInfoCardTitle(
                            title: 'Images',
                            unsavedChangesNotifier: imageNotifier,
                            child: Images(),
                          ),
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
