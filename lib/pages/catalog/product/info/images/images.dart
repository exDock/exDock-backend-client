import 'package:exdock_backend_client/pages/catalog/product/info/images/image_list.dart';
import 'package:flutter/material.dart';

import '../../../../../globals/styling.dart';

class Images extends StatelessWidget {
  const Images({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: kBoxShadowList,
        color: Colors.white,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 3, top: 8),
                  child: Text(
                    "Images",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Expanded(
                  child: SizedBox(),
                ),
                Icon(Icons.close),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            ImageList(
              images: ["test", "test", "test", "test"],
            ),
          ],
        ),
      ),
    );
  }
}
