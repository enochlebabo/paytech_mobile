
import 'package:flutter/material.dart';

import 'package:paytech_mobile/core/theme/app_theme.dart';



class KYCScreen extends StatefulWidget {

  const KYCScreen({super.key});



  @override

  State<KYCScreen> createState() => _KYCScreenState();

}



class _KYCScreenState extends State<KYCScreen> {

  int _currentStep = 0;



  @override

  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: const Text('Verify Identity'),

        backgroundColor: AppTheme.primaryBlue,

        foregroundColor: Colors.white,

      ),

      body: Stepper(

        currentStep: _currentStep,

        onStepContinue: () {

          if (_currentStep < 2) {

            setState(() => _currentStep += 1);

          } else {

            ScaffoldMessenger.of(context).showSnackBar(

              const SnackBar(content: Text('Documents submitted for review!')),

            );

            Navigator.pop(context);

          }

        },

        onStepCancel: () {

          if (_currentStep > 0) setState(() => _currentStep -= 1);

        },

        steps: [

          Step(

            title: const Text('Personal Details'),

            content: Column(

              children: const [

                TextField(decoration: InputDecoration(labelText: 'Legal Name')),

                TextField(decoration: InputDecoration(labelText: 'ID Number')),

              ],

            ),

            isActive: _currentStep >= 0,

          ),

          Step(

            title: const Text('Upload ID'),

            content: Container(

              height: 100,

              color: Colors.grey.shade200,

              child: const Center(child: Text('Tap to Scan ID')),

            ),

            isActive: _currentStep >= 1,

          ),

          Step(

            title: const Text('Selfie'),

            content: const CircleAvatar(radius: 30, child: Icon(Icons.camera_alt)),

            isActive: _currentStep >= 2,

          ),

        ],

      ),

    );

  }

}

