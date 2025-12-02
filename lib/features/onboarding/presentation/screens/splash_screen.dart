
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_animate/flutter_animate.dart';

import 'package:paytech_mobile/core/theme/app_theme.dart';

import 'package:paytech_mobile/features/onboarding/presentation/screens/onboarding_screen.dart';



class SplashScreen extends StatefulWidget {

  const SplashScreen({super.key});



  @override

  State<SplashScreen> createState() => _SplashScreenState();

}



class _SplashScreenState extends State<SplashScreen> {

  @override

  void initState() {

    super.initState();

    _navigate();

  }



  void _navigate() async {

    await Future.delayed(const Duration(seconds: 3));

    if (mounted) {

      Navigator.pushReplacement(

        context,

        MaterialPageRoute(builder: (context) => const OnboardingScreen()),

      );

    }

  }



  @override

  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: AppTheme.primaryBlue,

      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            Container(

              padding: const EdgeInsets.all(24),

              decoration: const BoxDecoration(

                color: Colors.white,

                shape: BoxShape.circle,

              ),

              child: const Icon(FontAwesomeIcons.wallet, size: 60, color: AppTheme.primaryBlue),

            ).animate()

             .scale(duration: 600.ms, curve: Curves.easeOutBack)

             .then(delay: 200.ms) // Wait a bit

             .shimmer(duration: 1200.ms, color: Colors.blue.shade100), // Shimmer effect

            

            const SizedBox(height: 24),

            

            const Text(

              'PAYTECH',

              style: TextStyle(

                fontSize: 32,

                fontWeight: FontWeight.bold,

                color: Colors.white,

                letterSpacing: 2,

              ),

            ).animate().fadeIn(delay: 400.ms).moveY(begin: 20, end: 0),

            

            const SizedBox(height: 8),

            

            const Text(

              'Unified Payments for SADC',

              style: TextStyle(color: Colors.white70, fontSize: 16),

            ).animate().fadeIn(delay: 600.ms),

          ],

        ),

      ),

    );

  }

}

