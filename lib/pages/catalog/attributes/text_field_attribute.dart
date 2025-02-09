import 'package:flutter/material.dart';

class TextFieldAttribute extends StatefulWidget {
  const TextFieldAttribute({super.key});

  @override
  State<TextFieldAttribute> createState() => _TextFieldAttributeState();
}

class _TextFieldAttributeState extends State<TextFieldAttribute> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 100,
      child: const Placeholder(),
    );
  }
}
