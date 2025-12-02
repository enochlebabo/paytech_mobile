
import 'package:flutter/material.dart';

import 'package:paytech_mobile/core/theme/app_theme.dart';

import 'package:paytech_mobile/features/auth/presentation/screens/login_screen.dart';

import 'package:paytech_mobile/features/settings/presentation/screens/security_screen.dart';



class ProfileScreen extends StatelessWidget {

  const ProfileScreen({super.key});



  @override

  Widget build(BuildContext context) {

    return Scaffold(

      body: SingleChildScrollView(

        child: Column(

          children: [

            Container(

              padding: const EdgeInsets.only(top: 60, bottom: 30, left: 20, right: 20),

              decoration: const BoxDecoration(

                color: AppTheme.primaryBlue,

                borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),

              ),

              child: Row(

                children: [

                  Container(

                    padding: const EdgeInsets.all(3),

                    decoration: BoxDecoration(

                      shape: BoxShape.circle,

                      border: Border.all(color: Colors.white, width: 2),

                    ),

                    child: const CircleAvatar(

                      radius: 35,

                      backgroundColor: Colors.white,

                      child: Icon(Icons.person, size: 40, color: Colors.grey),

                    ),

                  ),

                  const SizedBox(width: 20),

                  Expanded(

                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [

                        const Text(

                          'John Doe',

                          style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),

                        ),

                        const SizedBox(height: 4),

                        Row(

                          children: [

                            Text(

                              'john@paytech',

                              style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 14),

                            ),

                            const SizedBox(width: 8),

                            Container(

                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),

                              decoration: BoxDecoration(

                                color: Colors.greenAccent,

                                borderRadius: BorderRadius.circular(10),

                              ),

                              child: const Text(

                                'VERIFIED',

                                style: TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold),

                              ),

                            )

                          ],

                        ),

                      ],

                    ),

                  ),

                ],

              ),

            ),

            const SizedBox(height: 20),

            _buildSectionHeader('Account'),

            _buildMenuItem(context, Icons.account_balance, 'Linked Bank Accounts', 'Capitec, FNB Linked', null),

            _buildMenuItem(context, Icons.credit_card, 'Saved Cards', 'Visa ending 4242', null),

            _buildMenuItem(context, Icons.qr_code, 'My Paytech QR', 'Share your code', null),

            _buildSectionHeader('Settings'),

            _buildMenuItem(context, Icons.notifications_outlined, 'Notifications', 'On', null),

            // Link Security Screen Here

            _buildMenuItem(context, Icons.lock_outline, 'Security & Privacy', 'Biometrics enabled', const SecurityScreen()),

            _buildMenuItem(context, Icons.language, 'Language', 'English (South Africa)', null),

            _buildSectionHeader('Support'),

            _buildMenuItem(context, Icons.headset_mic_outlined, 'Help Center', '24/7 Support', null),

            Padding(

              padding: const EdgeInsets.all(24.0),

              child: OutlinedButton(

                onPressed: () {

                  // Log out logic

                  Navigator.of(context, rootNavigator: true).pushReplacement(

                    MaterialPageRoute(builder: (context) => const LoginScreen()),

                  );

                },

                style: OutlinedButton.styleFrom(

                  foregroundColor: Colors.red,

                  side: const BorderSide(color: Colors.red),

                  minimumSize: const Size(double.infinity, 50),

                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),

                ),

                child: const Text('Log Out'),

              ),

            ),

            const SizedBox(height: 20),

          ],

        ),

      ),

    );

  }



  Widget _buildSectionHeader(String title) {

    return Padding(

      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),

      child: Align(

        alignment: Alignment.centerLeft,

        child: Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey)),

      ),

    );

  }



  Widget _buildMenuItem(BuildContext context, IconData icon, String title, String subtitle, Widget? targetScreen) {

    return ListTile(

      leading: Container(

        padding: const EdgeInsets.all(8),

        decoration: BoxDecoration(

          color: AppTheme.primaryBlue.withOpacity(0.1),

          borderRadius: BorderRadius.circular(8),

        ),

        child: Icon(icon, color: AppTheme.primaryBlue, size: 20),

      ),

      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),

      subtitle: subtitle.isNotEmpty ? Text(subtitle, style: const TextStyle(fontSize: 12)) : null,

      trailing: const Icon(Icons.chevron_right, size: 20, color: Colors.grey),

      onTap: () {

        if (targetScreen != null) {

          Navigator.push(context, MaterialPageRoute(builder: (context) => targetScreen));

        } else {

          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Feature coming soon!')));

        }

      },

    );

  }

}

