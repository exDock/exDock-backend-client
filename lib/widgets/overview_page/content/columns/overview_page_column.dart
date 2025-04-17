class OverviewPageColumn {
  const OverviewPageColumn({
    required this.columnKey,
    required this.name,
    this.width = 100,
  });

  /// The key of the column
  final String columnKey;

  /// The name of the column
  final String name;

  /// The width of the column
  final double width;
}
