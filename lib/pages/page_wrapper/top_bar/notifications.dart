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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Column(
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
                    style: TextStyle(color: Colors.white),
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
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: isExpanded ? 200 : 0, // Adjust the height for expansion
            child: Container(
              decoration: BoxDecoration(color: Theme.of(context).canvasColor),
              child: notifications.isEmpty
                  ? Center(child: Text("No notifications"))
                  : ListView.builder(
                      itemCount: notifications.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(notifications[index]),
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
