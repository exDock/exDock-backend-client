import 'package:exdock_backend_client/pages/catalog/category/category_data.dart';
import 'package:exdock_backend_client/pages/catalog/category/category_synchronous.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  Future<CategoryData> getCategoryData() async {
    return CategoryData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getCategoryData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            !snapshot.hasError) {
          return CategorySynchronous(categoryData: snapshot.data!);
        }
        if (snapshot.hasError) {
          //
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
