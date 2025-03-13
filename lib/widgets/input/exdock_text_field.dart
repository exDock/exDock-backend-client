import 'package:exdock_backend_client/widgets/exdock_card.dart';
import 'package:flutter/material.dart';

class ExdockTextField extends StatelessWidget {
  const ExdockTextField({
    super.key,
    required this.controller,
    required this.onChanged,
    this.labelText,
  });

  final TextEditingController controller;
  final Function(String) onChanged;
  final String? labelText;

  @override
  Widget build(BuildContext context) {
    return ExdockCard(
      height: 56,
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: const TextStyle(fontSize: 14, height: 1.5),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: Theme.of(context).textTheme.bodyMedium,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          fillColor: Colors.blue,
        ),
      ),
    );
  }
}
