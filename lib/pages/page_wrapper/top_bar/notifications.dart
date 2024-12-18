import 'package:flutter/material.dart';

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
  double dropdownHeight = 200;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Stack(
        clipBehavior: Clip.none, // Allow overflow
        children: [
          // Notification Bar
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(blurRadius: 15)],
              ),
              padding: EdgeInsets.all(14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    notifications.isEmpty
                        ? "No unread notifications"
                        : notifications.first,
                    style: TextStyle(color: Colors.black),
                  ),
                  Icon(
                    isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
          // Expandable List
          if (isExpanded)
            Positioned(
              top: 60, // Position below the notification bar
              left: 0,
              right: 0,
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: dropdownHeight,
                  decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: notifications.isEmpty
                      ? Center(child: Text("No notifications"))
                      : SizedBox(
                          height: dropdownHeight,
                          child: ListView.builder(
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
        ],
      ),
    );
  }
}
