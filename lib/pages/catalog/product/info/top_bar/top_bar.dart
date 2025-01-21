import 'package:exdock_backend_client/globals/globals.dart';
import 'package:exdock_backend_client/widgets/exdock_save_button.dart';
import 'package:exdock_backend_client/widgets/exdock_switch.dart';
import 'package:flutter/material.dart';

class TopBar extends StatefulWidget {
  const TopBar({
    super.key,
    required this.name,
    required this.saveNotifier,
  });

  final String name;
  final ValueNotifier<bool> saveNotifier;

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: darkColour,
        boxShadow: kBoxShadowList,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 35,
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              "Product Name",
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: SizedBox(),
          ),
          ExDockSaveButton(
            somethingToSaveNotifier: widget.saveNotifier,
            onPressed: () {},
            // TODO: Give onPressed functionality
          ),
          Container(
            padding: EdgeInsets.only(left: 64, right: 12, top: 12),
            child: Row(
              children: [
                Column(
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
                SizedBox(
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
                    SizedBox(
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
                SizedBox(
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
