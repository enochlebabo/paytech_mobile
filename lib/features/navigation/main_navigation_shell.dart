
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:paytech_mobile/core/theme/app_theme.dart';

import 'package:paytech_mobile/features/wallet/presentation/screens/home_screen.dart';

import 'package:paytech_mobile/features/history/presentation/screens/history_screen.dart';

import 'package:paytech_mobile/features/profile/presentation/screens/profile_screen.dart';

import 'package:paytech_mobile/features/payments/presentation/screens/qr_screen.dart';



class MainNavigationShell extends StatefulWidget {

  const MainNavigationShell({super.key});



  @override

  State<MainNavigationShell> createState() => _MainNavigationShellState();

}



class _MainNavigationShellState extends State<MainNavigationShell> {

  int _currentIndex = 0;



  final List<Widget> _screens = [

    const HomeScreen(),

    const HistoryScreen(),

    const ProfileScreen(),

  ];



  @override

  Widget build(BuildContext context) {

    return Scaffold(

      body: IndexedStack(

        index: _currentIndex,

        children: _screens,

      ),

      floatingActionButton: FloatingActionButton(

        onPressed: () {

          Navigator.of(context).push(

            MaterialPageRoute(builder: (context) => const QRScannerScreen()),

          );

        },

        backgroundColor: AppTheme.primaryBlue,

        child: const Icon(Icons.qr_code_scanner, color: Colors.white),

      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(

        shape: const CircularNotchedRectangle(),

        notchMargin: 8.0,

        child: Row(

          mainAxisAlignment: MainAxisAlignment.spaceAround,

          children: [

            IconButton(

              icon: Icon(Icons.home, color: _currentIndex == 0 ? AppTheme.primaryBlue : Colors.grey),

              onPressed: () => setState(() => _currentIndex = 0),

            ),

             IconButton(

              icon: Icon(Icons.history, color: _currentIndex == 1 ? AppTheme.primaryBlue : Colors.grey),

              onPressed: () => setState(() => _currentIndex = 1),

            ),

            const SizedBox(width: 48), // Spacer for FAB

            IconButton(

              icon: const Icon(Icons.credit_card, color: Colors.grey),

              onPressed: () {},

            ),

            IconButton(

              icon: Icon(Icons.person, color: _currentIndex == 2 ? AppTheme.primaryBlue : Colors.grey),

              onPressed: () => setState(() => _currentIndex = 2),

            ),

          ],

        ),

      ),

    );

  }

}

