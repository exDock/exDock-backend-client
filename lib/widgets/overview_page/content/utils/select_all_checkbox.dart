import 'package:exdock_backend_client/utils/id_set_notifier.dart';
import 'package:flutter/material.dart';

class SelectAllCheckbox extends StatefulWidget {
  const SelectAllCheckbox({super.key, required this.selectedIds});

  final IdSetNotifier selectedIds;

  @override
  State<SelectAllCheckbox> createState() => _SelectAllCheckboxState();
}

class _SelectAllCheckboxState extends State<SelectAllCheckbox> {
  bool? currentSelectAllState;

  @override
  void initState() {
    super.initState();

    currentSelectAllState = widget.selectedIds.selectAllState;
  }

  @override
  Widget build(BuildContext context) {
    widget.selectedIds.selectAllState;
    return ValueListenableBuilder(
      valueListenable: widget.selectedIds,
      builder: (context, set, child) {
        return Checkbox(
          value: widget.selectedIds.selectAllState,
          tristate: true,
          side: BorderSide(
            color: Theme.of(context).indicatorColor,
            width: 1.5,
          ),
          onChanged: (value) {
            bool newValue = value ?? false;
            if (newValue) {
              widget.selectedIds.addAllId();
            } else {
              widget.selectedIds.reset();
            }
            setState(() {
              // currentSelectAllState = value;
            });
          },
        );
      },
    );
  }
}
