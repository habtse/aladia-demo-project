import 'package:aladia_demo_app/auth/presentation/bloc/auth_bloc.dart';
import 'package:aladia_demo_app/auth/presentation/bloc/auth_state.dart';
import 'package:aladia_demo_app/auth/presentation/bloc/bloc/verify_bloc.dart';
import 'package:aladia_demo_app/auth/presentation/bloc/bloc/verify_state.dart';
import 'package:aladia_demo_app/auth/presentation/widget/custom_form_field.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:ionicons/ionicons.dart';
import 'package:aladia_demo_app/auth/presentation/widget/social_buttons.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isPasswordFieldVisible = false;
  ThemeMode themeMode = ThemeMode.system;
  bool _passwordvisible = false;
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
          appBar: AppBar(
            leading: GestureDetector(
              onTap: () => setState(() {
                if (themeMode == ThemeMode.dark) {
                  themeMode = ThemeMode.light;
                } else {
                  themeMode = ThemeMode.dark;
                }
              }),
              child: !(themeMode == ThemeMode.dark)
                  ? Icon(Ionicons.sunny)
                  : Icon(Ionicons.moon),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    GlassContainer(
                      gradient: LinearGradient(
                          colors: [Colors.white, Colors.black, Colors.white],
                          stops: List.generate(3, (int index) => index * 0.5,
                              growable: true)),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              // Logo section
                              Image.asset(
                                'assets/aladia_logo.png', // Replace with your logo image
                                height: 150,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              // Welcome text
                              const Text(
                                'Welcome to Aladia,',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                'Create or access your account from here',
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    if (!isPasswordFieldVisible) ...[
                      // Email input field
                      const Text(
                        'Enter your email',
                        // style: TextStyle(color: Colors.white),
                      ),

                      const SizedBox(height: 30),

                      TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'Email Address',
                          prefixIcon: Icon(
                            Icons.mail_outline,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Enter button
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          overlayColor: Colors.white,
                          shadowColor: Colors.white,
                          backgroundColor: Color.fromARGB(84, 7, 7, 7),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 150, vertical: 15),
                        ),
                        onPressed:
                            isLoading ? null : () => _handleEnter(context),
                        child: isLoading
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                ),
                              )
                            : Text(
                                'Enter',
                                style: TextStyle(color: Colors.white),
                              ),
                      ),

                      const SizedBox(height: 20),

                      // Or divider
                      const Row(
                        children: [
                          Expanded(
                            child: Divider(),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              'Or',
                              // style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Expanded(
                            child: Divider(),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Social login buttons
                      BuildSocialButton(
                        icon: Ionicons.logo_google,
                        text: 'Continue with Google',
                        color: Colors.red,
                      ),
                      const SizedBox(height: 10),
                      BuildSocialButton(
                        icon: Icons.facebook,
                        text: 'Continue with Facebook',
                        color: Colors.blue,
                      ),
                      const SizedBox(height: 10),
                      BuildSocialButton(
                        icon: Icons.apple,
                        text: 'Continue with Apple',
                        color: Colors.white,
                      ),
                      const SizedBox(height: 30),

                      // Terms & Conditions text
                      GestureDetector(
                        onTap: () {
                          // Handle terms & conditions tap
                        },
                        child: const Text(
                          'Terms & Conditions',
                          style: TextStyle(
                              color: Colors.white70,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ] else ...[
                      const Text(
                        "Enter your password",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: _passwordController,
                        obscureText: _passwordvisible,
                        decoration: InputDecoration(
                          filled: true,

                          fillColor:
                              Colors.white, // White background for the input
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'Password',

                          prefixIcon: Icon(
                            Icons.key,
                            color: Colors.grey,
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _passwordvisible = !_passwordvisible;
                                });
                              },
                              icon: !_passwordvisible
                                  ? Icon((Ionicons.eye))
                                  : Icon((Ionicons.eye_off))),
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          overlayColor: Colors.white,
                          shadowColor: Colors.white,
                          backgroundColor: Color.fromARGB(197, 7, 7, 7),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 150, vertical: 15),
                        ),
                        onPressed:
                            isLoading ? null : () => _handleEnter(context),
                        child: isLoading
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                ),
                              )
                            : Text(
                                'Enter',
                                style: TextStyle(color: Colors.white),
                              ),
                      ),
                      // CustomInputField(
                      //   label: 'Password',
                      //   controller: _passwordController,
                      //   fieldType: 'password',
                      // ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
