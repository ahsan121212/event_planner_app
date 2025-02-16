import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import 'package:go_router/go_router.dart';

class TopBar extends StatelessWidget {
  final String title;
  const TopBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        TextButton(
          onPressed: () {
            Provider.of<AuthProvider>(context, listen: false).logout();
            GoRouter.of(context).go('/login');
          },
          child: const Text("Logout", style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
