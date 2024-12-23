class CategoryTree {
  final List<CategoryLeaf> leaves;

  CategoryTree(this.leaves);
}

class CategoryLeaf {
  final int id;
  final String name;
  final List<CategoryLeaf>? subLeaves;

  CategoryLeaf(this.id, this.name, {this.subLeaves});
}

class CategoryData {
  //
}
