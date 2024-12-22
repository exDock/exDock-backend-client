import 'package:flutter/material.dart';
import 'package:exdock_backend_client/globals/globals.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  bool isExpanded = false; // To track whether the list is expanded
  List<String> notifications = [
    "Notification 1",
    "Notification 2",
    "Notification 3",
    "Notification 4",
    "Notification 5",
    "Notification 6",
    "Notification 7",
    "Notification 8",
    "Notification 9",
    "Notification 10",
    "Notification 11",
    "Notification 12",
    "Notification 13",
    "Notification 14",
  ]; // Sample notifications

  late Widget notificationIcon = Icon(
    Symbols.notifications_rounded,
    color: Theme.of(context).primaryColor,
  );

  OverlayEntry? _overlayEntry;

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
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(notifications[index]),
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
  void dispose() {
    _overlayEntry?.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: GestureDetector(
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
              if (notifications.isEmpty)
                notificationIcon
              else
                Badge(
                    label: Text("${notifications.length}"),
                    child: notificationIcon),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    notifications.isEmpty
                        ? "No unread notifications"
                        : notifications.first,
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
    );
  }
}
