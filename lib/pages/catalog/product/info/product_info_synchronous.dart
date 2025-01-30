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
  const ProductInfoSynchronous({
    super.key,
    required this.productData,
  });

  final ProductInfoData productData;

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> idDataNotifier = ValueNotifier(false);
    ValueNotifier<bool> priceNotifier = ValueNotifier(false);
    ValueNotifier<bool> contentNotifier = ValueNotifier(false);
    ValueNotifier<bool> imageNotifier = ValueNotifier(false);
    ValueNotifier<bool> topBarNotifier = ValueNotifier(false);
    GlobalKey<IdDataWidgetState> idDataKey = GlobalKey();
    GlobalKey<PriceState> priceKey = GlobalKey();
    GlobalKey<ContentState> contentKey = GlobalKey();
    GlobalKey<ImagesState> imagesKey = GlobalKey();
    ProductInfoData mutableData = productData;

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

    saveValues() {
      IdData idData = IdData(
        sku: idDataKey.currentState!.manufacturerController.text,
        location: idDataKey.currentState!.locationController.text,
        ean: idDataKey.currentState!.eanController.text,
        manufacturer: idDataKey.currentState!.manufacturerController.text,
        categories: [],
      );

      PriceData priceData = PriceData(
        costPrice:
            double.parse(priceKey.currentState!.costPriceController.text),
        taxClass: priceKey.currentState!.taxClassController.text,
        price: double.parse(priceKey.currentState!.priceController.text),
        salePrice:
            double.parse(priceKey.currentState!.salePriceController.text),
        saleDateStart: priceKey.currentState!.saleStartDate,
        saleDateEnd: priceKey.currentState!.saleEndDate,
      );

      ContentData contentData = ContentData(
        shortDescription: contentKey.currentState!
            .fleatherShortDescriptionController!.plainTextEditingValue.text,
        description: contentKey.currentState!.fleatherDescriptionController!
            .plainTextEditingValue.text,
      );

      mutableData = ProductInfoData(
        idData: idData,
        priceData: priceData,
        contentData: contentData,
        imageData: ImageData(
          url: "",
          extensions: [],
        ),
      );

      idDataNotifier.value = false;
      priceNotifier.value = false;
      contentNotifier.value = false;
      imageNotifier.value = false;
      topBarNotifier.value = false;

      // TODO: Change data in the backend
    }

    return Stack(
      children: [
        TopBar(
          name: "Product Name",
          saveNotifier: topBarNotifier,
          saveValues: saveValues,
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
                                key: idDataKey,
                                idData: mutableData.idData,
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
                                key: priceKey,
                                priceData: mutableData.priceData,
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
                              key: contentKey,
                              contentData: mutableData.contentData,
                              changeNotifierState: changeNotifierState,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ProductInfoCardTitle(
                            key: imagesKey,
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
