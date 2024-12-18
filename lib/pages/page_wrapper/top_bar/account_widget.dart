import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class AccountWidget extends StatefulWidget {
  const AccountWidget({super.key});

  @override
  State<AccountWidget> createState() => _AccountWidgetState();
}

class _AccountWidgetState extends State<AccountWidget> {
  bool attentionRequired = false;

  @override
  Widget build(BuildContext context) {
    if (attentionRequired) {
      return MaterialButton(
        onPressed: () {},
        child: Badge(
          child: Icon(Symbols.account_circle_rounded),
        ),
      );
    }
    return MaterialButton(
      onPressed: () {},
      child: Icon(Symbols.account_circle_rounded),
    );
  }
}
