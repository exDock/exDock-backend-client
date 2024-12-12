import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb/flutter_breadcrumb.dart';

void main() {
  runApp(const Template(
    viewType: "global",
    child: SizedBox(),
  ));
}

class Template extends StatelessWidget {
  final Widget child;
  final String viewType;
  const Template({super.key, required this.child, required this.viewType});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.zero),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 4.0,
                          offset: const Offset(0, 4),
                          color: Colors.grey.shade300),
                      const BoxShadow(
                          offset: Offset(-4, 0), color: Colors.white)
                    ]),
                child: AppBar(
                  automaticallyImplyLeading: false,
                  toolbarHeight: 100,
                  backgroundColor: const Color(0xFFFFFFFF),
                  title: const LogoAndTitle(),
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.search),
                      tooltip: 'search',
                    ),
                    const Padding(padding: EdgeInsets.only(left: 50)),
                    const TemplateSearchBar(),
                    const Padding(padding: EdgeInsets.only(right: 50)),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.account_circle_outlined),
                      tooltip: 'Account info',
                    ),
                    const Padding(padding: EdgeInsets.only(right: 50)),
                  ],
                ))),
        backgroundColor: const Color(0xFFFFFFFF),
        body: SideBar(viewType: viewType, child: child),
      ),
    );
  }
}

class SideBar extends StatelessWidget {
  final Widget child;
  final String viewType;
  const SideBar({super.key, required this.child, required this.viewType});

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

class TopTabBar extends StatelessWidget {
  const TopTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar();
  }
}

class LogoAndTitle extends StatefulWidget {
  const LogoAndTitle({super.key});

  @override
  State<LogoAndTitle> createState() => _LogoAndTitleState();
}

class _LogoAndTitleState extends State<LogoAndTitle> {
  int itemCount =
      Uri.base.path.split("/").where((part) => part.isNotEmpty).toList().length;
  Uri uri = Uri.base;

  String getUri(int index) {
    if (itemCount == 0) return "Home";
    List<String> uriParts =
        uri.path.split("/").where((part) => part.isNotEmpty).toList();
    return uriParts.elementAt(index).trim();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.zero),
              boxShadow: [
                BoxShadow(
                    blurRadius: 4.0,
                    offset: const Offset(0, 4),
                    color: Colors.grey.shade300),
                const BoxShadow(offset: Offset(-4, 0), color: Colors.white),
                const BoxShadow(offset: Offset(0, 4), color: Colors.white)
              ]),
          width: 95,
          child: const Image(
            image: AssetImage("assets/ExDockLogo.png"),
            height: 90,
            width: 90,
          ),
        ),
        const Padding(padding: EdgeInsets.only(left: 20)),
        Column(
          children: [
            Builder(builder: (context) {
              if (itemCount < 2) {
                return const SizedBox();
              } else {
                return BreadCrumb.builder(
                  itemCount: itemCount - 1,
                  builder: (index) {
                    return BreadCrumbItem(content: Text(getUri(index)));
                  },
                  divider: const Icon(Icons.chevron_right),
                );
              }
            }),
            Text(getUri(itemCount - 1))
          ],
        )
      ],
    );
  }
}

class TemplateSearchBar extends StatefulWidget {
  const TemplateSearchBar({super.key});

  @override
  State<TemplateSearchBar> createState() => _TemplateSearchBarState();
}

class _TemplateSearchBarState extends State<TemplateSearchBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: SearchAnchor(
          builder: (BuildContext context, SearchController controller) {
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
                    onPressed: () {}, icon: const Icon(Icons.arrow_downward)),
              )
            ]);
      }, suggestionsBuilder:
              (BuildContext context, SearchController controller) {
        return List<ListTile>.generate(5, (int index) {
          final String item = 'item $index';
          return ListTile(
            title: Text(item),
            onTap: () {
              setState(() {
                controller.closeView(item);
              });
            },
          );
        });
      }),
    );
  }
}
