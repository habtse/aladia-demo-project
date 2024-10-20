import 'package:aladia_demo_app/auth/presentation/bloc/auth_bloc.dart';
import 'package:aladia_demo_app/auth/presentation/bloc/auth_state.dart';
import 'package:aladia_demo_app/auth/presentation/bloc/bloc/verify_bloc.dart';
import 'package:aladia_demo_app/auth/presentation/bloc/bloc/verify_state.dart';
import 'package:aladia_demo_app/auth/presentation/widget/custom_form_field.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isPasswordFieldVisible = false;
  bool isLoading = false;
  String? verifiedEmail;

  void _handleEnter(BuildContext context) {
    setState(() {
      isLoading = true;
    });

    if (!isPasswordFieldVisible) {
      context.read<VerifyBloc>().add(
            VerifiedEvent(email: _emailController.text.trim()),
          );
    } else {
      context.read<AuthBloc>().add(
            LogInEvent(
              email: verifiedEmail!,
              password: _passwordController.text.trim(),
            ),
          );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<VerifyBloc, VerifyState>(
      listener: (context, state) {
        if (state is VerifyLoadingState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Checking email')),
          );
        } else if (state is VerifyLoaded) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        } else if (state is VerifySuccess) {
          setState(() {
            isLoading = false;
            isPasswordFieldVisible = true;
            verifiedEmail = _emailController.text.trim();
          });
        } else if (state is VerifyError) {
          setState(() {
            isLoading = false;
          });
          GoRouter.of(context).go('/signup');
        }
      },
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccessState) {
            setState(() {
              isLoading = false;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Login successful')),
            );
            GoRouter.of(context).go('/welcome');
          } else if (state is AuthErrorState) {
            setState(() {
              isLoading = false;
            });
            isPasswordFieldVisible = false;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message ?? 'Login failed')),
            );
          }
        },
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () => GoRouter.of(context).go('/'),
                      child: const Icon(Icons.arrow_back_ios),
                    ),
                    const SizedBox(width: 15),
                    const Text('Log In'),
                  ],
                ),
                SizedBox(
                  height: 150,
                ),
                if (!isPasswordFieldVisible) ...[
                  const Text(
                    "Enter your email",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomInputField(
                    label: 'E-mail',
                    controller: _emailController,
                    fieldType: 'email',
                  ),
                ] else ...[
                  const Text("Enter your password"),
                  CustomInputField(
                    label: 'Password',
                    controller: _passwordController,
                    fieldType: 'password',
                  ),
                ],
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: isLoading ? null : () => _handleEnter(context),
                  child: isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : const Text('Enter'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
