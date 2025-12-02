
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:paytech_mobile/core/theme/app_theme.dart';

import 'package:paytech_mobile/features/navigation/main_navigation_shell.dart';



class LoginScreen extends StatefulWidget {

  const LoginScreen({super.key});



  @override

  State<LoginScreen> createState() => _LoginScreenState();

}



class _LoginScreenState extends State<LoginScreen> {

  final _phoneController = TextEditingController();

  bool _isLoading = false;



  void _handleLogin() async {

    setState(() => _isLoading = true);

    // Simulate network delay

    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {

      // Navigate to Main App

      Navigator.of(context).pushReplacement(

        MaterialPageRoute(builder: (context) => const MainNavigationShell()),

      );

    }

  }



  @override

  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: AppTheme.primaryBlue,

      body: SafeArea(

        child: Padding(

          padding: const EdgeInsets.all(24.0),

          child: Column(

            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [

              const Spacer(),

              const Icon(FontAwesomeIcons.wallet, size: 64, color: Colors.white),

              const SizedBox(height: 24),

              const Text(

                'PAYTECH',

                textAlign: TextAlign.center,

                style: TextStyle(

                  fontSize: 32,

                  fontWeight: FontWeight.bold,

                  color: Colors.white,

                  letterSpacing: 1.5,

                ),

              ),

              const Text(

                'Unified Payments for SADC',

                textAlign: TextAlign.center,

                style: TextStyle(color: Colors.white70, fontSize: 16),

              ),

              const Spacer(),

              Card(

                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

                child: Padding(

                  padding: const EdgeInsets.all(24.0),

                  child: Column(

                    children: [

                      const Text(

                        'Welcome Back',

                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),

                      ),

                      const SizedBox(height: 20),

                      TextField(

                        controller: _phoneController,

                        keyboardType: TextInputType.phone,

                        decoration: const InputDecoration(

                          labelText: 'Phone Number',

                          prefixIcon: Icon(Icons.phone),

                          hintText: '+27 71 123 4567',

                        ),

                      ),

                      const SizedBox(height: 24),

                      SizedBox(

                        width: double.infinity,

                        height: 50,

                        child: ElevatedButton(

                          onPressed: _isLoading ? null : _handleLogin,

                          child: _isLoading

                              ? const CircularProgressIndicator(color: Colors.white)

                              : const Text('Continue Securely'),

                        ),

                      ),

                    ],

                  ),

                ),

              ),

              const SizedBox(height: 20),

              const Text(

                'Secured by Bank-Grade Encryption',

                textAlign: TextAlign.center,

                style: TextStyle(color: Colors.white54, fontSize: 12),

              ),

            ],

          ),

        ),

      ),

    );

  }

}

