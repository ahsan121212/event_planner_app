import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'providers/auth_provider.dart';
import 'screens/dashboard_screen.dart';
import 'screens/login_screen.dart';
import 'screens/users_screen.dart';
import 'screens/vendors_screen.dart';
import 'screens/services_screen.dart';
import 'screens/complaints_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isAuthenticated = prefs.getBool("isAuthenticated") ?? false;

  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthProvider()..checkLoginStatus(),
      child: AdminApp(isAuthenticated: isAuthenticated),
    ),
  );
}

class AdminApp extends StatelessWidget {
  final bool isAuthenticated;
  const AdminApp({super.key, required this.isAuthenticated});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        return MaterialApp.router(
          title: 'Admin Panel',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.blue),
          routerConfig: _router(authProvider),
        );
      },
    );
  }
}

// ✅ Define Routes with Force Login After Refresh
GoRouter _router(AuthProvider authProvider) {
  return GoRouter(
    redirect: (context, state) {
      // ✅ Check if user is authenticated before allowing access
      if (!authProvider.isAuthenticated && state.matchedLocation != '/login') {
        return '/login';
      }
      return null;
    },
    routes: [
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      GoRoute(path: '/', builder: (context, state) => const DashboardScreen()),
      GoRoute(path: '/users', builder: (context, state) => const UsersScreen()),
      GoRoute(path: '/vendors', builder: (context, state) => const VendorsScreen()),
      GoRoute(path: '/services', builder: (context, state) => const ServicesScreen()),
      GoRoute(path: '/complaints', builder: (context, state) => const ComplaintsScreen()),
    ],
  );
}
