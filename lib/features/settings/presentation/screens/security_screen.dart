
import 'package:flutter/material.dart';

import 'package:paytech_mobile/core/theme/app_theme.dart';



class SecurityScreen extends StatefulWidget {

  const SecurityScreen({super.key});



  @override

  State<SecurityScreen> createState() => _SecurityScreenState();

}



class _SecurityScreenState extends State<SecurityScreen> {

  bool _biometrics = true;

  bool _twoFactor = false;



  @override

  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: const Text('Security & Privacy'),

        backgroundColor: AppTheme.primaryBlue,

        foregroundColor: Colors.white,

      ),

      body: ListView(

        padding: const EdgeInsets.all(16),

        children: [

          const Text('Access', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),

          SwitchListTile(

            title: const Text('Biometric Login'),

            subtitle: const Text('FaceID / Fingerprint'),

            value: _biometrics,

            activeColor: AppTheme.primaryBlue,

            onChanged: (val) => setState(() => _biometrics = val),

          ),

          ListTile(

            title: const Text('Change App PIN'),

            trailing: const Icon(Icons.chevron_right),

            onTap: () {},

          ),

          const Divider(),

          const Text('Transactions', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),

           SwitchListTile(

            title: const Text('2-Factor for Payments'),

            subtitle: const Text('Require OTP for transactions over R500'),

            value: _twoFactor,

            activeColor: AppTheme.primaryBlue,

            onChanged: (val) => setState(() => _twoFactor = val),

          ),

          const Divider(),

          const Text('Devices', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),

          ListTile(

            title: const Text('Manage Linked Devices'),

            subtitle: const Text('iPhone 16 Pro Max (Current)'),

            trailing: const Icon(Icons.chevron_right),

            onTap: () {},

          ),

        ],

      ),

    );

  }

}

