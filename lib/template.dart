import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: SideBar()));
}

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xFF2A9D8F),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton.icon(
            onPressed: () {},
            label: Text('Home'),
            icon: Icon(Icons.home),
          ),
          TextButton.icon(
            onPressed: () {},
            label: Text('Sales'),
            icon: Icon(Icons.attach_money),
          ),
          TextButton.icon(
            onPressed: () {},
            label: Text('Catalog'),
            icon: Icon(Icons.inventory),
          )
        ],
      ),
    );
  }
}
