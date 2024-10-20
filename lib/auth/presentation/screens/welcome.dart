import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(children: [
          InkWell(
              onTap: () => GoRouter.of(context).go('/'),
              child: Icon(Icons.arrow_back)),
          SizedBox(
            width: 30,
          ),
          Text('Welcome to Aladia')
        ]),
      ),
    );
  }
}
