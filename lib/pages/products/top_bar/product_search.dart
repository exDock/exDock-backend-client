import 'package:flutter/material.dart';

class ProductSearch extends StatefulWidget {
  const ProductSearch({super.key});

  @override
  State<ProductSearch> createState() => _ProductSearchState();
}

class _ProductSearchState extends State<ProductSearch> {
  SearchController searchController = SearchController();
  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: searchController,
      padding:
          const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 16.0)),
      onTap: () {
        searchController.openView();
      },
      onChanged: (_) {
        searchController.openView();
      },
      leading: const Icon(Icons.search),
    );
  }
}
