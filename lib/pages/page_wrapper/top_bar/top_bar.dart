import 'package:exdock_backend_client/globals/globals.dart';
import 'package:exdock_backend_client/pages/page_wrapper/top_bar/account_widget.dart';
import 'package:exdock_backend_client/pages/page_wrapper/top_bar/notifications.dart';
import 'package:exdock_backend_client/pages/page_wrapper/top_bar/page_name.dart';
import 'package:exdock_backend_client/pages/page_wrapper/top_bar/search.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).indicatorColor,
        boxShadow: kBoxShadowList,
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PageName(pageName: pageName, breadCrumbs: breadCrumbs),
            Row(
              children: [
                Search(width: 400),
                SizedBox(width: 24),
                Notifications(),
                SizedBox(width: 24),
                AccountWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
