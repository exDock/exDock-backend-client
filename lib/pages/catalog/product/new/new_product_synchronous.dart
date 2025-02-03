import 'package:exdock_backend_client/pages/catalog/product/info/id_data/category_list.dart';
import 'package:exdock_backend_client/pages/catalog/product/info/product_info_data.dart';
import 'package:exdock_backend_client/pages/catalog/product/info/top_bar/top_bar.dart';
import 'package:exdock_backend_client/pages/catalog/product/new/product_info_card/new_product_card_title.dart';
import 'package:flutter/material.dart';

import '../new/content/content.dart';
import '../new/id_data/id_data.dart';
import '../new/images/images.dart';
import '../new/price/price.dart';

class NewProductSynchronous extends StatelessWidget {
  const NewProductSynchronous({
    super.key,
    required this.productData,
  });

  final ProductInfoData productData;

  @override
  Widget build(BuildContext context) {
    ValueNotifier<IdDataErrorData> idDataListenable =
        ValueNotifier(IdDataErrorData(
      skuError: false,
      locationError: false,
      eanError: false,
      manufacturerError: false,
    ));
    ValueNotifier<PriceErrorData> priceDataListenable =
        ValueNotifier(PriceErrorData(
      costPriceError: false,
      taxClassError: false,
      priceError: false,
      salePriceError: false,
    ));
    ValueNotifier<bool> topBarNotifier = ValueNotifier(true);
    GlobalKey<IdDataWidgetState> idDataKey = GlobalKey();
    GlobalKey<PriceState> priceKey = GlobalKey();
    GlobalKey<ContentState> contentKey = GlobalKey();
    GlobalKey<ImagesState> imagesKey = GlobalKey();
    ProductInfoData mutableData = productData;

    checkValues() {
      bool isCorrect = true;

      // IdData validation
      IdData idData = IdData(
        sku: "",
        location: "",
        ean: "",
        manufacturer: "",
        categories: [],
      );
      PriceData priceData = PriceData(
        costPrice: 0,
        taxClass: "",
        price: 0,
        salePrice: 0,
        saleDateStart: priceKey.currentState!.saleStartDate,
        saleDateEnd: priceKey.currentState!.saleEndDate,
      );
      ContentData contentData = ContentData(
        description: contentKey.currentState!.fleatherDescriptionController!
            .plainTextEditingValue.text,
        shortDescription: contentKey.currentState!
            .fleatherShortDescriptionController!.plainTextEditingValue.text,
      );
      IdDataErrorData idDataErrorData = IdDataErrorData(
        skuError: false,
        locationError: false,
        eanError: false,
        manufacturerError: false,
      );
      if (idDataKey.currentState!.skuController.text == "") {
        idDataErrorData.skuError = true;
        isCorrect = false;
      } else {
        idData.sku = idDataKey.currentState!.skuController.text;
      }
      if (idDataKey.currentState!.locationController.text == "") {
        idDataErrorData.locationError = true;
        isCorrect = false;
      } else {
        idData.location = idDataKey.currentState!.locationController.text;
      }
      if (idDataKey.currentState!.eanController.text == "") {
        idDataErrorData.eanError = true;
        isCorrect = false;
      } else {
        idData.ean = idDataKey.currentState!.eanController.text;
      }
      if (idDataKey.currentState!.manufacturerController.text == "") {
        idDataErrorData.manufacturerError = true;
        isCorrect = false;
      } else {
        idData.manufacturer =
            idDataKey.currentState!.manufacturerController.text;
      }

      PriceErrorData priceErrorData = PriceErrorData(
        costPriceError: false,
        taxClassError: false,
        priceError: false,
        salePriceError: false,
      );
      if (priceKey.currentState!.costPriceController.text == "0") {
        priceErrorData.costPriceError = true;
        isCorrect = false;
      } else {
        priceData.costPrice =
            double.parse(priceKey.currentState!.costPriceController.text);
      }
      if (priceKey.currentState!.taxClassController.text == "") {
        priceErrorData.taxClassError = true;
        isCorrect = false;
      } else {
        priceData.taxClass = priceKey.currentState!.taxClassController.text;
      }
      if (priceKey.currentState!.priceController.text == "0") {
        priceErrorData.priceError = true;
        isCorrect = false;
      } else {
        priceData.price =
            double.parse(priceKey.currentState!.priceController.text);
      }
      if (priceKey.currentState!.salePriceController.text == "0") {
        priceErrorData.salePriceError = true;
        isCorrect = false;
      } else {
        priceData.salePrice =
            double.parse(priceKey.currentState!.salePriceController.text);
      }
      priceDataListenable.value = priceErrorData;
      idDataListenable.value = idDataErrorData;

      mutableData = ProductInfoData(
          idData: idData,
          priceData: priceData,
          contentData: contentData,
          imageData: ImageData(url: "", extensions: []));

      if (isCorrect) {
        //TODO: Implement correct saving to the server
      }
    }

    return Stack(
      children: [
        TopBar(
          name: "Product Name",
          saveNotifier: topBarNotifier,
          saveValues: checkValues,
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
                            ValueListenableBuilder(
                              valueListenable: idDataListenable,
                              builder: (context, value, child) {
                                return NewProductCardTitle(
                                  title: "ID data",
                                  child: IdDataWidget(
                                    key: idDataKey,
                                    idData: mutableData.idData,
                                    availableCategories: CategoryList(
                                      categories: ["test"],
                                    ),
                                    skuError: value.skuError,
                                    locationError: value.locationError,
                                    eanError: value.eanError,
                                    manufacturerError: value.manufacturerError,
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ValueListenableBuilder(
                              valueListenable: priceDataListenable,
                              builder: (context, value, child) {
                                return NewProductCardTitle(
                                  title: 'Price',
                                  child: Price(
                                    key: priceKey,
                                    priceData: mutableData.priceData,
                                    costPriceError: value.costPriceError,
                                    taxClassError: value.taxClassError,
                                    priceError: value.priceError,
                                    salePriceError: value.salePriceError,
                                  ),
                                );
                              },
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
                          NewProductCardTitle(
                            title: 'Content',
                            child: Content(
                              key: contentKey,
                              contentData: mutableData.contentData,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          NewProductCardTitle(
                            key: imagesKey,
                            title: 'Images',
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

class IdDataErrorData {
  bool skuError;
  bool locationError;
  bool eanError;
  bool manufacturerError;

  IdDataErrorData({
    required this.skuError,
    required this.locationError,
    required this.eanError,
    required this.manufacturerError,
  });
}

class PriceErrorData {
  bool costPriceError;
  bool taxClassError;
  bool priceError;
  bool salePriceError;

  PriceErrorData({
    required this.costPriceError,
    required this.taxClassError,
    required this.priceError,
    required this.salePriceError,
  });
}
