import 'package:exdock_backend_client/utils/MapNotifier.dart';
import 'package:exdock_backend_client/widgets/exdock_card.dart';
import 'package:fleather/fleather.dart';
import 'package:flutter/material.dart';
import 'package:parchment_to_html/parachment_to_html.dart';

class WysiwygAttribute extends StatefulWidget {
  const WysiwygAttribute({
    super.key,
    required this.attribute,
    required this.changeAttributeMap,
  });

  final Map<String, dynamic> attribute;
  final MapNotifier changeAttributeMap;

  @override
  State<WysiwygAttribute> createState() => _WysiwygAttributeState();
}

class _WysiwygAttributeState extends State<WysiwygAttribute> {
  // TODO: make the wysiwyg editor work properly
  final FleatherController controller = FleatherController();
  final ParchmentHtmlCodec converter = ParchmentHtmlCodec();

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      String value = converter
          .encode(controller.document.toDelta())
          .replaceAll("<br><br>", "<br>");
      value = value.substring(0, value.length - 4); // Remove last "<br>"
      if (value == widget.attribute['current_attribute_value']) {
        print("value is unchanged");
        widget.changeAttributeMap.removeEntry(widget.attribute['attribute_id']);
        return;
      }
      print("value is changed");
      print("value: $value");
      print(
          "widget.attribute['current_attribute_value']: ${widget.attribute['current_attribute_value']}");
      widget.changeAttributeMap.addEntry(
        widget.attribute['attribute_id'],
        value,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return ExdockCard(
      child: Column(
        children: [
          FleatherToolbar.basic(controller: controller),
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 12),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: 75),
              child: FleatherEditor(controller: controller),
            ),
          ),
        ],
      ),
    );
  }
}
