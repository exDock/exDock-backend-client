import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key, required this.child, required this.viewType});

  final Widget child;
  final String viewType;

  void redirect(int index) {}

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    NavigationRailLabelType labelType = NavigationRailLabelType.all;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(padding: EdgeInsets.only(left: 20)),
        Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.zero),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 4.0,
                      offset: const Offset(0, 4),
                      color: Colors.grey.shade300),
                  const BoxShadow(offset: Offset(-4, 0), color: Colors.white)
                ]),
            child: NavigationRail(
                backgroundColor: const Color(0xFFFFFFFF),
                selectedIndex: selectedIndex,
                labelType: labelType,
                destinations: const [
                  NavigationRailDestination(
                    label: Text('HOME'),
                    icon: Icon(Icons.home),
                  ),
                  NavigationRailDestination(
                    label: Text('SALES'),
                    icon: Icon(Icons.attach_money),
                  ),
                  NavigationRailDestination(
                    label: Text('CATALOG'),
                    icon: Icon(Icons.inventory),
                  ),
                  NavigationRailDestination(
                    label: Text('CUSTOMERS'),
                    icon: Icon(Icons.person),
                  ),
                  NavigationRailDestination(
                    label: Text('MARKETING'),
                    icon: Icon(Icons.campaign),
                  ),
                  NavigationRailDestination(
                    label: Text('CONTENT'),
                    icon: Icon(Icons.source),
                  ),
                  NavigationRailDestination(
                    label: Text('REPORTS'),
                    icon: Icon(Icons.flag),
                  ),
                  NavigationRailDestination(
                    label: Text('STORES'),
                    icon: Icon(Icons.store),
                  ),
                  NavigationRailDestination(
                    label: Text('SYSTEM'),
                    icon: Icon(Icons.settings),
                  ),
                ])),
        Container(
          padding:
              const EdgeInsets.only(left: 20.0, right: 20, top: 4, bottom: 4),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.grey.shade200),
                  right: BorderSide(color: Colors.grey.shade200)),
              borderRadius:
                  const BorderRadius.only(bottomRight: Radius.circular(10.0)),
              boxShadow: [
                BoxShadow(
                    blurRadius: 4.0,
                    offset: const Offset(0, 4),
                    color: Colors.grey.shade300),
                const BoxShadow(offset: Offset(0, 0), color: Colors.white)
              ]),
          child: Text(viewType),
        ),
        child
      ],
    );
  }
}
