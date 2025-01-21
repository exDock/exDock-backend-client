import 'package:flutter/material.dart';

import '../../../../../globals/styling.dart';

class Price extends StatefulWidget {
  const Price({super.key});

  @override
  State<Price> createState() => _PriceState();
}

class _PriceState extends State<Price> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: kBoxShadowList,
        color: Colors.white,
      ),
      child: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            Row(
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
            Padding(
              padding: const EdgeInsets.only(top: 24),
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
                          Text("€ 5,73 (cost_price)"),
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
                          Text("Standard VAT (tax_class)"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24),
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
                          Text("€ 18,95 (price)"),
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
                          Text("€ 15,95 (sale_price)"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24),
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
