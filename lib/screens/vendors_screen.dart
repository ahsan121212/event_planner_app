
import 'package:flutter/material.dart';
import '../widgets/sidebar.dart';
import '../widgets/topbar.dart';

class VendorsScreen extends StatelessWidget {
  const VendorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const Sidebar(),
          Expanded(
            child: Column(
              children: const [
                TopBar(title: "Vendors Management"),
                Expanded(
                  child: Center(child: Text("Manage Vendors Here")),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
