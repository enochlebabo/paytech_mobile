import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:paytech_mobile/core/theme/app_theme.dart';
import 'package:paytech_mobile/features/payments/presentation/screens/payment_success_screen.dart';

class TelcoScreen extends StatefulWidget {
  const TelcoScreen({super.key});

  @override
  State<TelcoScreen> createState() => _TelcoScreenState();
}

class _TelcoScreenState extends State<TelcoScreen> {
  String _selectedProvider = 'Vodacom';
  
  final List<String> _providers = ['Vodacom', 'MTN', 'Cell C', 'Telkom', 'Rain'];
  final List<Map<String, String>> _bundles = [
    {'amt': 'R 29.00', 'desc': 'Airtime'},
    {'amt': 'R 55.00', 'desc': 'Airtime'},
    {'amt': 'R 110.00', 'desc': 'Airtime'},
    {'amt': 'R 99.00', 'desc': '1GB Data'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buy Airtime & Data'),
        backgroundColor: AppTheme.primaryBlue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Select Provider', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 12),
            SizedBox(
              height: 90,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: _providers.length,
                separatorBuilder: (c, i) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  final isSelected = _selectedProvider == _providers[index];
                  return GestureDetector(
                    onTap: () => setState(() => _selectedProvider = _providers[index]),
                    child: Container(
                      width: 80,
                      decoration: BoxDecoration(
                        color: isSelected ? AppTheme.primaryBlue : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: isSelected ? AppTheme.primaryBlue : Colors.grey.shade300),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.network_cell, 
                            color: isSelected ? Colors.white : Colors.grey
                          ),
                          const SizedBox(height: 8),
                          Text(
                            _providers[index],
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            const TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                hintText: '072 123 4567',
                prefixIcon: Icon(Icons.phone_android),
                suffixIcon: Icon(Icons.contacts),
              ),
            ),
            const SizedBox(height: 24),
            const Text('Popular Bundles', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 12),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _bundles.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: Colors.grey.shade200),
                  ),
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Colors.redAccent,
                      child: Icon(Icons.flash_on, color: Colors.white, size: 20),
                    ),
                    title: Text(_bundles[index]['amt']!),
                    subtitle: Text(_bundles[index]['desc']!),
                    trailing: ElevatedButton(
                      onPressed: () {
                         Navigator.push(context, MaterialPageRoute(builder: (c) => const PaymentSuccessScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primaryBlue,
                        minimumSize: const Size(80, 36),
                        padding: EdgeInsets.zero,
                      ),
                      child: const Text('Buy'),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
