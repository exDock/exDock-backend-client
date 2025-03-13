import 'package:exdock_backend_client/globals/globals.dart';
import 'package:flutter/material.dart';

class Scope extends StatefulWidget {
  const Scope({super.key});

  @override
  State<Scope> createState() => _ScopeState();
}

class _ScopeState extends State<Scope> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(10),
        ),
        boxShadow: kBoxShadowList,
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Text("scope"),
      ),
    );
  }
}
