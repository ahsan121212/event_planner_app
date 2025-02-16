import 'package:flutter/material.dart';
import '../widgets/sidebar.dart';
import '../widgets/topbar.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const Sidebar(),
          Expanded(
            child: Column(
              children: const [
                TopBar(title: "Users Management"),
                Expanded(
                  child: Center(child: Text("Manage Users Here")),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
