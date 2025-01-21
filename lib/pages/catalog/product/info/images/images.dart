import 'package:exdock_backend_client/pages/catalog/product/info/images/image_list.dart';
import 'package:flutter/material.dart';

class Images extends StatelessWidget {
  const Images({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        ImageList(
          images: ["test", "test", "test", "test"],
        ),
      ],
    );
  }
}
