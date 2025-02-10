import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class SingleImageAttribute extends StatefulWidget {
  const SingleImageAttribute({super.key});

  @override
  State<SingleImageAttribute> createState() => _SingleImageAttributeState();
}

class _SingleImageAttributeState extends State<SingleImageAttribute> {
  bool hasImage = false;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleImageDeviceTypeSelector(name: "main"),
              SingleImageDeviceTypeSelector(name: "mobile"),
              SingleImageDeviceTypeSelector(name: "tablet"),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Container(
              width: 1,
              decoration: BoxDecoration(color: Theme.of(context).disabledColor),
            ),
          ),
          Expanded(
            child: hasImage ? Placeholder() : NoImagePresent(),
          ),
        ],
      ),
    );
  }
}

class NoImagePresent extends StatelessWidget {
  const NoImagePresent({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(5),
      dashPattern: [10, 10],
      strokeWidth: 2,
      color: Theme.of(context).disabledColor,
      child: SizedBox(
        height: 100,
        child: Center(
          child: Text("no image uploaded"),
        ),
      ),
    );
  }
}

class SingleImageDeviceTypeSelector extends StatelessWidget {
  const SingleImageDeviceTypeSelector({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: ButtonStyle(
        textStyle:
            WidgetStatePropertyAll(Theme.of(context).textTheme.bodyMedium),
        foregroundColor: WidgetStatePropertyAll(
            Theme.of(context).textTheme.bodyMedium?.color),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
      child: Text(name),
    );
  }
}
