import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class AccountWidget extends StatefulWidget {
  const AccountWidget({super.key});

  @override
  State<AccountWidget> createState() => _AccountWidgetState();
}

class _AccountWidgetState extends State<AccountWidget> {
  bool attentionRequired = true;
  Widget accountIcon = Icon(
    size: 48,
    Symbols.account_circle_rounded,
  );
  double badgeSize = 11;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        iconColor: WidgetStatePropertyAll(
            Theme.of(context).textTheme.bodyMedium?.color),
        textStyle:
            WidgetStatePropertyAll(Theme.of(context).textTheme.bodyMedium),
        padding: WidgetStatePropertyAll(EdgeInsets.zero),
      ),
      onPressed: () {},
      child: AspectRatio(
        aspectRatio: 1,
        child: !attentionRequired
            ? accountIcon
            : Stack(
                children: [
                  accountIcon,
                  Positioned(
                    top: 5,
                    right: 6,
                    child: Container(
                      height: badgeSize,
                      width: badgeSize,
                      decoration: BoxDecoration(
                          color: Colors.red.shade800,
                          borderRadius: BorderRadius.circular(badgeSize / 2)),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
