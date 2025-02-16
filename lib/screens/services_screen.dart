import 'package:flutter/material.dart';
import '../widgets/sidebar.dart';
import '../widgets/topbar.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const Sidebar(),
          Expanded(
            child: Column(
              children: const [
                TopBar(title: "Services Management"),
                Expanded(
                  child: Center(child: Text("Manage Services Here")),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
