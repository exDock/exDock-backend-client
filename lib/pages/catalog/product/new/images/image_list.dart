import 'package:flutter/material.dart';

import '../../../../../globals/styling.dart';

class ImageList extends StatefulWidget {
  const ImageList({super.key, required this.images});

  final List<String> images;

  @override
  State<ImageList> createState() => _ImageListState();
}

class _ImageListState extends State<ImageList> {
  List<Widget> imageWidgets = [];
  @override
  Widget build(BuildContext context) {
    imageWidgets = [];

    for (String image in widget.images) {
      imageWidgets.add(
        SizedBox(
          width: 200,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(color: Colors.grey),
                margin: EdgeInsets.only(bottom: 10),
                child: Center(
                  child: Text(image),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  boxShadow: lightKBoxShadowList,
                  color: Colors.white,
                ),
                padding: EdgeInsets.symmetric(vertical: 5),
                margin: EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("png"),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  boxShadow: lightKBoxShadowList,
                  color: Colors.white,
                ),
                padding: EdgeInsets.symmetric(vertical: 5),
                margin: EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("jpg"),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  boxShadow: lightKBoxShadowList,
                  color: Colors.white,
                ),
                padding: EdgeInsets.symmetric(vertical: 5),
                margin: EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("webp"),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return SizedBox(
      child: Wrap(
        spacing: 10,
        runSpacing: 5,
        direction: Axis.horizontal,
        children: imageWidgets,
      ),
    );
  }
}
