import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String fieldType; // 'email' or 'password'

  const CustomInputField({
    Key? key,
    required this.label,
    required this.controller,
    required this.fieldType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isPassword = fieldType == 'password';

    return TextField(
      controller: controller,
      obscureText: isPassword, // Hide text for password field
      keyboardType: isPassword
          ? TextInputType.visiblePassword
          : TextInputType.emailAddress, // Email keyboard type
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        hintText: isPassword ? 'Enter your password' : 'Enter your email',
      ),
    );
  }
}
