import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: SideBar()));
}

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  void redirect(int index) {}

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    NavigationRailLabelType labelType = NavigationRailLabelType.all;
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Row(
        children: [
          NavigationRail(
              backgroundColor: const Color(0xFFFFFFFF),
              selectedIndex: selectedIndex,
              labelType: labelType,
              leading: Container(
                  margin: const EdgeInsets.only(left: 20.0),
                  child: const Image(
                    image: AssetImage("assets/ExDockLogo.png"),
                    height: 100,
                    width: 100,
                  )),
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
              ])
        ],
      ),
    );
  }
}

// children: [
//
// ],
