import 'package:flutter/material.dart';
import '../widgets/sidebar.dart';
import '../widgets/topbar.dart';

class ComplaintsScreen extends StatelessWidget {
  const ComplaintsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const Sidebar(),
          Expanded(
            child: Column(
              children: const [
                TopBar(title: "Complaints Management"),
                Expanded(
                  child: Center(child: Text("Handle Complaints Here")),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
