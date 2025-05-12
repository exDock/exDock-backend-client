import 'dart:async';

import 'package:exdock_backend_client/globals/globals.dart';
import 'package:exdock_backend_client/utils/HTTP/connect_websocket_stream.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  bool isExpanded = false; // To track whether the list is expanded
  List<String> _notifications = []; // Sample notifications

  OverlayEntry? _overlayEntry;
  ValueNotifier<List<String>>? _notificationsNotifier;

  void connectToWebsocket() {}

  late Widget notificationIcon = Icon(
    Symbols.notifications_rounded,
    color: Theme.of(context).primaryColor,
  );

  Future<String> getToken() async {
    FlutterSecureStorage storage = FlutterSecureStorage();
    String? token = await storage.read(key: "jwt");
    return token!;
  }

  @override
  void initState() {
    super.initState();
    _notificationsNotifier = ValueNotifier<List<String>>(_notifications);
    getWebsocketChannel(
        "ws://127.0.0.1/api/v1/ws/error", _notificationsNotifier!);
  }

  @override
  void dispose() {
    _overlayEntry?.remove();
    _notificationsNotifier?.dispose();
    super.dispose();
  }

  OverlayEntry _createOverlayEntry() {
    final renderBox = context.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Positioned(
        // 8 below the notification bar
        top: position.dy + renderBox.size.height + 8,
        left: position.dx,
        width: renderBox.size.width,
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 200, // Fixed height for the expandable section
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: ValueListenableBuilder<List<String>>(
                valueListenable: _notificationsNotifier!,
                builder: (context, value, child) {
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(value[index]),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _toggleOverlay() {
    setState(() {
      if (isExpanded) {
        _overlayEntry?.remove();
        _overlayEntry = null;
      } else {
        // Create the overlay dynamically
        _overlayEntry = _createOverlayEntry();
        Overlay.of(context).insert(_overlayEntry!);
      }
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: ValueListenableBuilder(
        valueListenable: _notificationsNotifier!,
        builder: (context, value, child) => GestureDetector(
          onTap: _toggleOverlay,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: kBoxShadowList,
            ),
            padding: EdgeInsets.all(14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (value.isEmpty)
                  notificationIcon
                else
                  Badge(
                      label: Text("${value.length}"), child: notificationIcon),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      value.isEmpty ? "No unread notifications" : value.first,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                Icon(
                  isExpanded
                      ? Symbols.keyboard_arrow_up_rounded
                      : Symbols.keyboard_arrow_down_rounded,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
