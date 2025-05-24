// Flutter imports:
import 'package:flutter/material.dart';

class System extends StatefulWidget {
  const System({super.key});

  @override
  State<System> createState() => _SystemState();
}

class _SystemState extends State<System> {
  Future<String> getSystemData() async {
    // Simulate a network request or data fetching
    await Future.delayed(const Duration(seconds: 2));
    return "System Data Loaded";
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getSystemData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text("Error loading system data"));
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: Text(
                snapshot.data ?? "No data available",
                style: const TextStyle(fontSize: 20),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
