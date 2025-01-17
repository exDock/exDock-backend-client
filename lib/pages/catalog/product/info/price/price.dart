import 'package:exdock_backend_client/pages/catalog/product/info/product_info_data.dart';
import 'package:flutter/material.dart';

import '../../../../../globals/styling.dart';

class Price extends StatefulWidget {
  const Price({
    super.key,
    required this.priceData,
  });

  final PriceData priceData;

  @override
  State<Price> createState() => _PriceState();
}

class _PriceState extends State<Price> {
  TextEditingController costPriceController = TextEditingController();
  TextEditingController taxClassController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController salePriceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    costPriceController.value = TextEditingValue(
      text: widget.priceData.costPrice.toString(),
    );
    taxClassController.value = TextEditingValue(
      text: widget.priceData.taxClass.toString(),
    );
    priceController.value = TextEditingValue(
      text: widget.priceData.price.toString(),
    );
    salePriceController.value = TextEditingValue(
      text: widget.priceData.salePrice.toString(),
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: kBoxShadowList,
        color: Colors.white,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 3, top: 8),
                    child: Text(
                      "Price",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: SizedBox(),
            ),
            Flexible(
              flex: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: lightKBoxShadowList,
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.request_page_outlined),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: TextField(
                              controller: costPriceController,
                              decoration: InputDecoration(
                                labelText: "Cost price",
                                border: InputBorder.none,
                                prefixText: "€ ",
                              ),
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
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: lightKBoxShadowList,
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.close),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: TextField(
                              controller: taxClassController,
                              decoration: InputDecoration(
                                labelText: "Tax class",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: SizedBox(),
            ),
            Flexible(
              flex: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: lightKBoxShadowList,
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.payments_outlined),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              child: TextField(
                            controller: priceController,
                            decoration: InputDecoration(
                              labelText: "Price",
                              border: InputBorder.none,
                              prefixText: "€ ",
                            ),
                          ))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: lightKBoxShadowList,
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.percent_outlined),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: TextField(
                              controller: salePriceController,
                              decoration: InputDecoration(
                                labelText: "Sale price",
                                border: InputBorder.none,
                                prefixText: "€ ",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: SizedBox(),
            ),
            Flexible(
              flex: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 2,
                    child: Text("Sale price date range"),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: lightKBoxShadowList,
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Text("15-12-2024"),
                          Expanded(
                            child: SizedBox(),
                          ),
                          Icon(Icons.event_available_outlined),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: lightKBoxShadowList,
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Text("15-12-2024"),
                          Expanded(
                            child: SizedBox(),
                          ),
                          Icon(Icons.event_note_outlined),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
