import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb/flutter_breadcrumb.dart';

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
