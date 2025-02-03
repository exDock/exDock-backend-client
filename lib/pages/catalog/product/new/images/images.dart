import 'package:exdock_backend_client/pages/catalog/product/info/images/image_list.dart';
import 'package:flutter/material.dart';

class Images extends StatefulWidget {
  const Images({super.key});

  @override
  State<Images> createState() => ImagesState();
}

class ImagesState extends State<Images> {
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
