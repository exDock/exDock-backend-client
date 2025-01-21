import 'package:exdock_backend_client/globals/styling.dart';
import 'package:exdock_backend_client/pages/catalog/product/info/id_data/category_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../product_info_data.dart';

class IdDataWidget extends StatefulWidget {
  const IdDataWidget({
    super.key,
    required this.idData,
    required this.availableCategories,
  });

  final IdData idData;
  final CategoryList availableCategories;

  @override
  State<IdDataWidget> createState() => IdDataWidgetState();
}

class IdDataWidgetState extends State<IdDataWidget> {
  TextEditingController skuController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController eanController = TextEditingController();
  TextEditingController manufacturerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    skuController.value = TextEditingValue(
      text: widget.idData.sku,
    );
    locationController.value = TextEditingValue(
      text: widget.idData.location,
    );
    eanController.value = TextEditingValue(
      text: widget.idData.ean,
    );
    manufacturerController.value = TextEditingValue(
      text: widget.idData.manufacturer,
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: kBoxShadowList,
        color: Colors.white,
      ),
      child: Container(
        margin: EdgeInsets.all(24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 3),
                  child: Text(
                    "ID data",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
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
                          Icon(Icons.badge_outlined),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: TextField(
                              controller: skuController,
                              decoration: InputDecoration(
                                labelText: "SKU",
                                border: InputBorder.none,
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
                          Icon(Icons.pin_drop_outlined),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: TextField(
                              controller: locationController,
                              decoration: InputDecoration(
                                labelText: "Location",
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
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: lightKBoxShadowList,
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Icon(FontAwesomeIcons.barcode),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: TextField(
                        controller: eanController,
                        decoration: InputDecoration(
                          labelText: "GTIN/EAN",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: lightKBoxShadowList,
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Icon(Icons.factory_outlined),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: TextField(
                        controller: manufacturerController,
                        decoration: InputDecoration(
                          labelText: "Manufacturer",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: CategoryList(
                categories: widget.idData.categories.map((e) {
                  return e.name;
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
