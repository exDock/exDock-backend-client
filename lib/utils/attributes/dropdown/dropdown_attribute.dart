import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:exdock_backend_client/utils/MapNotifier.dart';
import 'package:exdock_backend_client/utils/attributes/dropdown/case_sensitive_icon_button.dart';
import 'package:flutter/material.dart';

class DropdownAttribute extends StatefulWidget {
  const DropdownAttribute({
    super.key,
    required this.attribute,
    required this.changeAttributeMap,
  });

  final Map<String, dynamic> attribute;
  final MapNotifier changeAttributeMap;

  @override
  State<DropdownAttribute> createState() => _DropdownAttributeState();
}

class _DropdownAttributeState extends State<DropdownAttribute> {
  final TextEditingController searchTextEditingController =
      TextEditingController();
  late String? currentValue = widget.attribute['current_attribute_value'];
  bool caseSensitiveSearch = false;
  WidgetStateProperty<Color>? caseSensitiveButtonColour;

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuItem<String>> items = List.from(
      widget.attribute['possible_values'].map(
        (Map<String, String> value) {
          return DropdownMenuItem<String>(
            value: value['value'],
            child: Text(value['label'] ?? value['value'] ?? '-'),
          );
        },
      ),
    );

    return Row(
      children: [
        Text(widget.attribute['attribute_name']),
        SizedBox(width: 24),
        DropdownButton2<String>(
          onChanged: (value) {
            widget.changeAttributeMap
                .updateAttributeEntry(widget.attribute, value);
            setState(() {
              currentValue = value;
            });
          },
          value: currentValue,
          items: items,
          dropdownSearchData: DropdownSearchData(
            searchController: searchTextEditingController,
            searchInnerWidgetHeight: 50,
            searchInnerWidget: Container(
              height: 50,
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: searchTextEditingController,
                    ),
                  ),
                  SizedBox(width: 12),
                  CaseSensitiveIconButton(onChanged: (newValue) {
                    setState(() {
                      caseSensitiveSearch = newValue;

                      // The text needs to be changed in order to trigger the search functionality
                      // Add a space, because you cannot see the space
                      searchTextEditingController.text =
                          "${searchTextEditingController.text} ";

                      searchTextEditingController.text =
                          searchTextEditingController.text.substring(
                        0,
                        searchTextEditingController.text.length - 1,
                      );
                    });
                  }),
                ],
              ),
            ),
            searchMatchFn: (item, searchValue) {
              if (!caseSensitiveSearch) searchValue = searchValue.toLowerCase();

              // Compares against the value
              if (item.value.toString().contains(searchValue)) return true;

              // Compares against the label
              String? labelText = (item.child as Text).data;
              if (!caseSensitiveSearch) labelText = labelText?.toLowerCase();
              if (labelText?.contains(searchValue) ?? false) return true;

              return false;
            },
          ),
          //This to clear the search value when you close the menu
          onMenuStateChange: (isOpen) {
            if (!isOpen) {
              searchTextEditingController.clear();
            }
          },
        ),
      ],
    );
  }
}
