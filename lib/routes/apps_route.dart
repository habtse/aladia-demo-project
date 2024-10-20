import 'package:aladia_demo_app/auth/presentation/screens/log_in.dart';
import 'package:aladia_demo_app/auth/presentation/screens/sign_in.dart';
import 'package:aladia_demo_app/auth/presentation/screens/welcome.dart';
import 'package:go_router/go_router.dart';
import '../screens/landing_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const LandingScreen()),
      GoRoute(path: '/login', builder: (context, state) => const LogIn()),
      GoRoute(
          path: '/welcome', builder: (context, state) => const WelcomePage()),
      GoRoute(path: '/signUp', builder: (context, state) => const SignUP()),
    ],
  );
}
