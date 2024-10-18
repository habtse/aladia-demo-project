import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import '../screens/landing_screen.dart';

class AppRouter {
  static final GoRouter router =
      GoRouter(initialLocation: '/', debugLogDiagnostics: true, routes: [
    GoRoute(path: '/', builder: (context, state) => const LandingScreen()),
  ]);
}
