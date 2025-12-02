
import 'package:flutter/material.dart';

import 'package:paytech_mobile/core/theme/app_theme.dart';

import 'package:paytech_mobile/features/payments/presentation/screens/payment_success_screen.dart';



class ElectricityScreen extends StatefulWidget {

  const ElectricityScreen({super.key});



  @override

  State<ElectricityScreen> createState() => _ElectricityScreenState();

}



class _ElectricityScreenState extends State<ElectricityScreen> {

  String? _selectedAmount;

  final List<String> _amounts = ['R 50', 'R 100', 'R 200', 'R 500'];



  @override

  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: const Text('Prepaid Electricity'),

        backgroundColor: AppTheme.primaryBlue,

        foregroundColor: Colors.white,

      ),

      body: Padding(

        padding: const EdgeInsets.all(20),

        child: Column(

          children: [

            const TextField(

              decoration: InputDecoration(

                labelText: 'Meter Number',

                prefixIcon: Icon(Icons.electric_meter),

                border: OutlineInputBorder(),

              ),

            ),

            const SizedBox(height: 20),

            GridView.builder(

              shrinkWrap: true,

              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(

                crossAxisCount: 2,

                childAspectRatio: 2.5,

                crossAxisSpacing: 10,

                mainAxisSpacing: 10,

              ),

              itemCount: _amounts.length,

              itemBuilder: (context, index) {

                final isSelected = _selectedAmount == _amounts[index];

                return GestureDetector(

                  onTap: () => setState(() => _selectedAmount = _amounts[index]),

                  child: Container(

                    decoration: BoxDecoration(

                      color: isSelected ? AppTheme.primaryBlue : Colors.white,

                      border: Border.all(color: AppTheme.primaryBlue),

                      borderRadius: BorderRadius.circular(8),

                    ),

                    alignment: Alignment.center,

                    child: Text(

                      _amounts[index],

                      style: TextStyle(

                        color: isSelected ? Colors.white : Colors.black,

                        fontWeight: FontWeight.bold,

                      ),

                    ),

                  ),

                );

              },

            ),

            const Spacer(),

            SizedBox(

              width: double.infinity,

              child: ElevatedButton(

                onPressed: _selectedAmount == null ? null : () {

                   Navigator.push(context, MaterialPageRoute(builder: (c) => const PaymentSuccessScreen()));

                },

                style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primaryBlue),

                child: const Text('Purchase'),

              ),

            )

          ],

        ),

      ),

    );

  }

}

