
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:paytech_mobile/core/theme/app_theme.dart';



class ReceivePaymentScreen extends StatefulWidget {

  const ReceivePaymentScreen({super.key});



  @override

  State<ReceivePaymentScreen> createState() => _ReceivePaymentScreenState();

}



class _ReceivePaymentScreenState extends State<ReceivePaymentScreen> {

  final _amountController = TextEditingController();

  bool _qrGenerated = false;



  @override

  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: const Text('Receive Payment'),

        backgroundColor: AppTheme.primaryBlue,

        foregroundColor: Colors.white,

      ),

      body: Padding(

        padding: const EdgeInsets.all(24.0),

        child: Column(

          children: [

            if (!_qrGenerated) ...[

              const Icon(FontAwesomeIcons.store, size: 60, color: AppTheme.primaryBlue),

              const SizedBox(height: 24),

              const Text('Enter Amount', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

              const SizedBox(height: 16),

              TextField(

                controller: _amountController,

                keyboardType: const TextInputType.numberWithOptions(decimal: true),

                textAlign: TextAlign.center,

                style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),

                decoration: const InputDecoration(prefixText: 'R ', hintText: '0.00'),

              ),

              const Spacer(),

              SizedBox(

                width: double.infinity,

                height: 50,

                child: ElevatedButton(

                  onPressed: () => setState(() => _qrGenerated = true),

                  style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primaryBlue),

                  child: const Text('Generate QR'),

                ),

              ),

            ] else ...[

              const Spacer(),

              const Icon(Icons.qr_code_2, size: 200),

              Text(

                'R ${_amountController.text}',

                style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),

              ),

              const Spacer(),

              SizedBox(

                width: double.infinity,

                height: 50,

                child: OutlinedButton(

                  onPressed: () => setState(() => _qrGenerated = false),

                  child: const Text('New Payment'),

                ),

              ),

            ]

          ],

        ),

      ),

    );

  }

}

