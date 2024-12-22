class CategoryTree {
  final List<CategoryLeaf> leaves;

  CategoryTree(this.leaves);
}

class CategoryLeaf {
  final String name;
  final List<CategoryLeaf>? subLeaves;

  CategoryLeaf(this.name, {this.subLeaves});
}

class CategoryData {
  //
}
