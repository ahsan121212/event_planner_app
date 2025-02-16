import 'package:flutter/material.dart';
import '../widgets/sidebar.dart';
import '../widgets/topbar.dart';
import '../widgets/dashboard_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const Sidebar(),
          Expanded(
            child: Column(
              children: [
                const TopBar(title: "Admin Dashboard"),
                Expanded(
                  child: GridView.count(
                    padding: const EdgeInsets.all(16),
                    crossAxisCount: 3,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    children: const [
                      DashboardCard(title: "Total Users", count: 120),
                      DashboardCard(title: "Total Vendors", count: 50),
                      DashboardCard(title: "Total Bookings", count: 300),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
