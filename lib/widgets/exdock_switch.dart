import 'package:flutter/material.dart';

class ExDockSwitch extends StatefulWidget {
  const ExDockSwitch({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final Function(bool) onChanged;

  @override
  State<ExDockSwitch> createState() => _ExDockSwitchState();
}

class _ExDockSwitchState extends State<ExDockSwitch> {
  late bool value = widget.value;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: value,
      onChanged: (newValue) {
        widget.onChanged(newValue);
        setState(() {
          value = newValue;
        });
      },
    );
  }
}
