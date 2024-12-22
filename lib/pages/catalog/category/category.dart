import 'package:exdock_backend_client/pages/catalog/category/category_data.dart';
import 'package:exdock_backend_client/pages/catalog/category/category_synchronous.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  Future<CategoryTree> getCategoryTree() async {
    return CategoryTree([]);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getCategoryTree(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            !snapshot.hasError) {
          return CategorySynchronous(categoryTree: snapshot.data!);
        }
        if (snapshot.hasError) {
          //
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
