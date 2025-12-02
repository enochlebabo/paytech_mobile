
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:paytech_mobile/core/theme/app_theme.dart';

import 'package:paytech_mobile/features/auth/presentation/screens/login_screen.dart';



class OnboardingScreen extends StatefulWidget {

  const OnboardingScreen({super.key});



  @override

  State<OnboardingScreen> createState() => _OnboardingScreenState();

}



class _OnboardingScreenState extends State<OnboardingScreen> {

  final PageController _pageController = PageController();

  int _currentPage = 0;



  final List<Map<String, dynamic>> _pages = [

    {

      'title': 'Send Money Instantly',

      'desc': 'Transfer funds to anyone in South Africa and Lesotho using just their phone number or Paytech ID.',

      'icon': FontAwesomeIcons.paperPlane,

    },

    {

      'title': 'Pay Bills & Top Up',

      'desc': 'Buy electricity, airtime, and pay for tickets directly from your wallet. No extra fees.',

      'icon': FontAwesomeIcons.bolt,

    },

    {

      'title': 'Bank Grade Security',

      'desc': 'Your money is safe with us. We use biometric security and encrypted transactions.',

      'icon': FontAwesomeIcons.shieldHalved,

    },

  ];



  @override

  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.white,

      body: SafeArea(

        child: Column(

          children: [

            Expanded(

              child: PageView.builder(

                controller: _pageController,

                onPageChanged: (index) => setState(() => _currentPage = index),

                itemCount: _pages.length,

                itemBuilder: (context, index) {

                  return Padding(

                    padding: const EdgeInsets.all(40.0),

                    child: Column(

                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [

                        Container(

                          padding: const EdgeInsets.all(40),

                          decoration: BoxDecoration(

                            color: AppTheme.primaryBlue.withOpacity(0.1),

                            shape: BoxShape.circle,

                          ),

                          child: Icon(

                            _pages[index]['icon'],

                            size: 80,

                            color: AppTheme.primaryBlue,

                          ),

                        ),

                        const SizedBox(height: 40),

                        Text(

                          _pages[index]['title'],

                          textAlign: TextAlign.center,

                          style: const TextStyle(

                            fontSize: 24,

                            fontWeight: FontWeight.bold,

                            color: AppTheme.primaryBlue,

                          ),

                        ),

                        const SizedBox(height: 16),

                        Text(

                          _pages[index]['desc'],

                          textAlign: TextAlign.center,

                          style: const TextStyle(

                            fontSize: 16,

                            color: Colors.grey,

                            height: 1.5,

                          ),

                        ),

                      ],

                    ),

                  );

                },

              ),

            ),

            // Indicators

            Row(

              mainAxisAlignment: MainAxisAlignment.center,

              children: List.generate(

                _pages.length,

                (index) => AnimatedContainer(

                  duration: const Duration(milliseconds: 300),

                  margin: const EdgeInsets.symmetric(horizontal: 4),

                  height: 8,

                  width: _currentPage == index ? 24 : 8,

                  decoration: BoxDecoration(

                    color: _currentPage == index ? AppTheme.primaryBlue : Colors.grey.shade300,

                    borderRadius: BorderRadius.circular(4),

                  ),

                ),

              ),

            ),

            const SizedBox(height: 40),

            // Buttons

            Padding(

              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),

              child: Row(

                children: [

                  if (_currentPage != _pages.length - 1)

                    TextButton(

                      onPressed: () {

                         _pageController.animateToPage(

                          _pages.length - 1, 

                          duration: const Duration(milliseconds: 400), 

                          curve: Curves.easeInOut

                        );

                      },

                      child: const Text('Skip', style: TextStyle(color: Colors.grey)),

                    ),

                  const Spacer(),

                  ElevatedButton(

                    onPressed: () {

                      if (_currentPage < _pages.length - 1) {

                        _pageController.nextPage(

                          duration: const Duration(milliseconds: 300),

                          curve: Curves.easeIn,

                        );

                      } else {

                        Navigator.pushReplacement(

                          context,

                          MaterialPageRoute(builder: (context) => const LoginScreen()),

                        );

                      }

                    },

                    style: ElevatedButton.styleFrom(

                      backgroundColor: AppTheme.primaryBlue,

                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),

                    ),

                    child: Text(_currentPage == _pages.length - 1 ? 'Get Started' : 'Next'),

                  ),

                ],

              ),

            ),

          ],

        ),

      ),

    );

  }

}

