import 'package:flutter/material.dart';

class IdSetNotifier extends ValueNotifier<Set<String>> {
  IdSetNotifier(this.allIds) : super({});

  /// Set of all ids that could be selected
  final Set<String> allIds;

  /// Check if id is in the set
  bool isPresent(String id) => value.contains(id);

  /// Returns true if the id was not in the set
  ///
  /// Throws if [!allIds.contains(id)] and [!force]
  bool addId(String id, {bool force = false}) {
    if (!force && !allIds.contains(id)) throw Exception("id not in allIds");
    bool notInSet = value.add(id);
    notifyListeners();
    return notInSet;
  }

  /// Returns true if the id was in the set
  bool removeId(String id) {
    bool wasInSet = value.remove(id);
    notifyListeners();
    return wasInSet;
  }

  /// Clears the set and add all the ids in [allIds] to the set
  void addAllId() {
    print("[BEFORE]");
    print("-- allIds: $allIds");
    print("-- selectedIds: $value");
    value = Set<String>.from(allIds);
    notifyListeners();
    print("[AFTER]");
    print("-- allIds: $allIds");
    print("-- selectedIds: $value");
  }

  /// Clears the set
  void reset() {
    value.clear();
    notifyListeners();
  }

  /// Returns true if all selected,
  /// false if non selected,
  /// null if some are selected
  ///
  /// Will return false if allIds and selectedIds is empty
  bool? get selectAllState {
    if (value.isEmpty) return false;
    if (allIds.difference(value).isEmpty) return true;
    return null;
  }

  /// Remove all ids from the set that are not in [allIds]
  /// or don't start with "_"
  ///
  /// Returns true if no ids were removed
  bool sanitise() {
    List<String> toRemove =
        value.difference(allIds).where((id) => !id.startsWith("_")).toList();

    if (toRemove.isEmpty) return true;

    for (var id in toRemove) {
      removeId(id);
    }

    return false;
  }
}
