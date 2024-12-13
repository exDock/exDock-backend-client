import 'package:exdock_backend_client/template/sidebar.dart';
import 'package:exdock_backend_client/template/template_searchbar.dart';
import 'package:flutter/material.dart';

import 'logo_and_title.dart';

void main() {
  runApp(const Template(
    viewType: "global",
    child: SizedBox(),
  ));
}

class Template extends StatelessWidget {
  const Template({super.key, required this.child, required this.viewType});

  final Widget child;
  final String viewType;

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
