import 'package:exdock_backend_client/pages/page_wrapper/side_bar.dart';
import 'package:exdock_backend_client/pages/page_wrapper/top_bar/top_bar.dart';
import 'package:flutter/material.dart';

class MainPageWrapper extends StatefulWidget {
  const MainPageWrapper({super.key});

  @override
  State<MainPageWrapper> createState() => _MainPageWrapperState();
}

class _MainPageWrapperState extends State<MainPageWrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideBar(width: 100),
          Column(
            children: [
              TopBar(
                height: 100,
                pageName: "pageNameTest",
                breadCrumbs: "test > bread > crumbs",
              ),
            ],
          )
        ],
      ),
    );
  }
}
