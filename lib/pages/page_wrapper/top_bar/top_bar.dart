import 'package:exdock_backend_client/pages/page_wrapper/top_bar/account_widget.dart';
import 'package:exdock_backend_client/pages/page_wrapper/top_bar/notifications.dart';
import 'package:exdock_backend_client/pages/page_wrapper/top_bar/page_name.dart';
import 'package:exdock_backend_client/pages/page_wrapper/top_bar/search.dart';
import 'package:flutter/material.dart';

class TopBar extends StatefulWidget {
  const TopBar({
    super.key,
    required this.height,
    required this.pageName,
    this.breadCrumbs,
  });

  final double height;
  final String pageName;
  final String? breadCrumbs;

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(blurRadius: 15)],
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PageName(
                pageName: widget.pageName, breadCrumbs: widget.breadCrumbs),
            Row(
              children: [
                Search(),
                Notifications(),
                AccountWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
