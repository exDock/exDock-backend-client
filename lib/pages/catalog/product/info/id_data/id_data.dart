import 'package:exdock_backend_client/globals/styling.dart';
import 'package:exdock_backend_client/pages/catalog/product/info/id_data/category_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IdData extends StatelessWidget {
  const IdData({super.key});

  @override
  Widget build(BuildContext context) {
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
                          Text("00/073 (SKU)"),
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
                          Text("G4.32 (location)"),
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
                    Text("1234567890123 (GTIN/EAN)"),
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
                    Text("manufacturer"),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: CategoryList(
                categories: [
                  "test1",
                  "test2",
                  "test3",
                  "test1",
                  "test2",
                  "test3",
                  "test1",
                  "test2",
                  "test3"
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
