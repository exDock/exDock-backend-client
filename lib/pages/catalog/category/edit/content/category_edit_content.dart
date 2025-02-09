import 'package:exdock_backend_client/pages/catalog/category/category_data.dart';
import 'package:exdock_backend_client/pages/catalog/category/edit/content/category_edit_content_synchronous.dart';
import 'package:flutter/material.dart';

class CategoryEditContent extends StatefulWidget {
  const CategoryEditContent({super.key, required this.selectedCategoryLeaf});

  final CategoryLeaf selectedCategoryLeaf;

  @override
  State<CategoryEditContent> createState() => _CategoryEditContentState();
}

class _CategoryEditContentState extends State<CategoryEditContent> {
  Future<Map<String, dynamic>> getCategoryAttributes(int categoryId) async {
    return {
      "Content": {
        "block_type": "standard",
        "attributes": [
          {
            "attribute_id": "main_image",
            "attribute_type": "image",
            "current_attribute_value": {
              "main": "https://www.example.com/path", // nullable
              "mobile": null,
              "tablet": null,
            },
          },
          {
            "attribute_id": "short_description",
            "attribute_type": "wysiwyg",
            "current_attribute_value": "test short description value",
          },
          {
            "attribute_id": "description",
            "attribute_type": "wysiwyg",
            "current_attribute_value": "test description value",
          },
        ],
      },
      "Search Engine Optimisation": {
        "block_type": "standard",
        "attributes": [
          {
            "attribute_id": "url_key",
            "attribute_type": "text",
            "current_attribute_value": "",
          },
        ],
      },
    };
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getCategoryAttributes(widget.selectedCategoryLeaf.id),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Placeholder();
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return CategoryEditContentSynchronous(
            blocks: snapshot.data!,
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
