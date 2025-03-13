class BulkAction {
  const BulkAction({
    required this.name,
    required this.executeOnRow,
  });

  /// The name of the bulk action
  final String name;

  /// When the bulk action is executed on a row, this function is called<br>
  /// The String is the id of the row
  final Function(String) executeOnRow;
}
