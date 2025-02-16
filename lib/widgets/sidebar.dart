import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // ✅ Improved Sidebar Header
          Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            color: Colors.blue,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.admin_panel_settings, size: 40, color: Colors.blue),
                ),
                SizedBox(height: 10),
                Text(
                  'Admin Panel',
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 10),
              children: [
                _buildMenuItem(Icons.dashboard, "Dashboard", context, '/'),
                _buildMenuItem(Icons.people, "Users", context, '/users'),
                _buildMenuItem(Icons.business, "Vendors", context, '/vendors'),
                _buildMenuItem(Icons.home_repair_service, "Services", context, '/services'),
                _buildMenuItem(Icons.report, "Complaints", context, '/complaints'),
              ],
            ),
          ),
          // ✅ Styled Logout Button
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Logout', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
            onTap: () {
              Provider.of<AuthProvider>(context, listen: false).logout();
              GoRouter.of(context).go('/login');
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, BuildContext context, String route) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      onTap: () => GoRouter.of(context).go(route),
    );
  }
}
