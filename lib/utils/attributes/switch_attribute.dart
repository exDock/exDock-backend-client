import 'package:exdock_backend_client/utils/MapNotifier.dart';
import 'package:exdock_backend_client/widgets/exdock_switch.dart';
import 'package:flutter/material.dart';

class SwitchAttribute extends StatefulWidget {
  const SwitchAttribute({
    super.key,
    required this.attribute,
    required this.changeAttributeMap,
  });

  final Map<String, dynamic> attribute;
  final MapNotifier changeAttributeMap;

  @override
  State<SwitchAttribute> createState() => _SwitchAttributeState();
}

class _SwitchAttributeState extends State<SwitchAttribute> {
  late bool switchValue = widget.attribute['current_attribute_value'] ?? false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.attribute['attribute_name']),
        SizedBox(width: 24),
        ExDockSwitch(
          value: switchValue,
          onChanged: (value) {
            switchValue = value;

            if (value == widget.attribute['current_attribute_value']) {
              widget.changeAttributeMap
                  .removeEntry(widget.attribute['attribute_id']);
              return;
            }

            widget.changeAttributeMap
                .addEntry(widget.attribute['attribute_id'], value);
          },
        ),
      ],
    );
  }
}
