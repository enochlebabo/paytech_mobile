import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:paytech_mobile/core/theme/app_theme.dart';
import 'package:paytech_mobile/features/payments/presentation/screens/payment_success_screen.dart';

class TransferBottomSheet extends StatelessWidget {
  const TransferBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        top: 24,
        left: 24,
        right: 24,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Send Money',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Recipient ID or Phone',
              hintText: '@username or +27...',
              prefixIcon: Icon(FontAwesomeIcons.at, size: 16),
            ),
          ),
          const SizedBox(height: 16),
          const TextField(
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              labelText: 'Amount (ZAR)',
              hintText: '0.00',
              prefixIcon: Icon(FontAwesomeIcons.moneyBill, size: 16),
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 54,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Close sheet
                // Navigate to success screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PaymentSuccessScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryBlue,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('Confirm Transfer'),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
