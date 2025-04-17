// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:exdock_backend_client/globals/globals.dart';
import 'package:exdock_backend_client/utils/map_notifier.dart';
import 'package:exdock_backend_client/widgets/buttons/exdock_save_button.dart';
import 'package:exdock_backend_client/widgets/exdock_switch.dart';

class TopBar extends StatefulWidget {
  const TopBar({
    super.key,
    required this.name,
    required this.saveNotifier,
    required this.saveValues,
  });

  final String name;
  final MapNotifier saveNotifier;
  final Function saveValues;

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        color: darkColour,
        boxShadow: kBoxShadowList,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            width: 35,
          ),
          const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              "Product Name",
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),
          const Expanded(
            child: SizedBox(),
          ),
          ExDockSaveButton(
            somethingToSaveNotifier: widget.saveNotifier,
            onPressed: () {
              widget.saveValues();
            },
          ),
          Container(
            padding: const EdgeInsets.only(left: 64, right: 12, top: 12),
            child: Row(
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "enable product",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "searchable",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 24,
                ),
                Column(
                  children: [
                    ExDockSwitch(
                      value: true,
                      onChanged: (e) {
                        return !e;
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    ExDockSwitch(
                      value: false,
                      onChanged: (e) {
                        return !e;
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  width: 12,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
