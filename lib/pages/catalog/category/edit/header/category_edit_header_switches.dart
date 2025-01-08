import 'package:exdock_backend_client/widgets/exdock_switch.dart';
import 'package:flutter/material.dart';

class CategoryEditHeaderSwitches extends StatefulWidget {
  const CategoryEditHeaderSwitches({super.key});

  // TODO: determine necessary input

  @override
  State<CategoryEditHeaderSwitches> createState() =>
      _CategoryEditHeaderSwitchesState();
}

class _CategoryEditHeaderSwitchesState
    extends State<CategoryEditHeaderSwitches> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CategoryEditHeaderSwitch(
            title: "enable category",
            value: true, // TODO: add changing functionality
            onChanged: (value) {},
          ),
          CategoryEditHeaderSwitch(
            title: "include in menu",
            value: false, // TODO: aad changing functionality
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}

class CategoryEditHeaderSwitch extends StatelessWidget {
  const CategoryEditHeaderSwitch({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  final String title;
  final bool value;
  final Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title),
        ExDockSwitch(
          value: value,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
