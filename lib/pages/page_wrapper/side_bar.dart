import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key, required this.width});

  final double width;

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(blurRadius: 15)],
      ),
      child: ClipRect(
        child: Column(
          verticalDirection: VerticalDirection.up,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: NavigationRail(
                destinations: const [
                  NavigationRailDestination(
                    icon: Icon(Icons.home_rounded),
                    label: Text("home"),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Symbols.request_quote_rounded),
                    label: Text("sales"),
                  ),
                ],
                selectedIndex: selectedIndex,
              ),
            ),
            Container(
              height: widget.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(blurRadius: 15)],
              ),
              child: const Center(
                child: Text("exDock"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
