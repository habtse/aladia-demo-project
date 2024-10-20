import 'dart:io';

import 'package:aladia_demo_app/auth/presentation/widget/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUP extends StatefulWidget {
  const SignUP({super.key});

  @override
  _SignUPState createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () => GoRouter.of(context).go('/'),
                    child: Icon(Icons.arrow_back_ios)),
                const SizedBox(height: 15),
                Center(child: Text('SignUp')),
              ]),
        ),
      )),
    );
  }
}
