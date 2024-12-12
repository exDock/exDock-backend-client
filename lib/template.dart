import 'package:flutter/material.dart';

void main() {
  runApp(const Template());
}

class Template extends StatelessWidget {
  const Template({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: AppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 100,
              backgroundColor: const Color(0xFFFFFFFF),
              title: Container(
                width: 100,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.zero),
                    border: Border(
                        bottom: BorderSide(color: Color(0xBBBBBBFF)),
                        right: BorderSide(color: Color(0xBBBBBBFF)))),
                child: const Image(
                  image: AssetImage("assets/ExDockLogo.png"),
                  height: 90,
                  width: 90,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                  tooltip: 'search',
                ),
                const Padding(padding: EdgeInsets.only(left: 50)),
                SearchAnchor(builder:
                    (BuildContext context, SearchController controller) {
                  return SearchBar(
                      controller: controller,
                      padding: const WidgetStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 16.0)),
                      onTap: () {
                        controller.openView();
                      },
                      onChanged: (_) {
                        controller.openView();
                      },
                      leading: const Icon(Icons.notifications),
                      trailing: [
                        Tooltip(
                          message: 'Show more',
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_downward)),
                        )
                      ]);
                }, suggestionsBuilder:
                    (BuildContext context, SearchController controller) {
                  return List<ListTile>.generate(5, (int index) {
                    final String item = 'item $index';
                    return ListTile(
                      title: Text(item),
                      onTap: () {},
                    );
                  });
                }),
                const Padding(padding: EdgeInsets.only(right: 50)),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.account_circle_outlined),
                  tooltip: 'Account info',
                ),
                const Padding(padding: EdgeInsets.only(right: 50)),
              ],
            )),
        backgroundColor: const Color(0xFFFFFFFF),
        body: const SideBar(),
      ),
    );
  }
}

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  void redirect(int index) {}

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    NavigationRailLabelType labelType = NavigationRailLabelType.all;
    return Row(
      children: [
        const Padding(padding: EdgeInsets.only(left: 20)),
        NavigationRail(
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
            ])
      ],
    );
  }
}

class TopTabBar extends StatelessWidget {
  const TopTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar();
  }
}
