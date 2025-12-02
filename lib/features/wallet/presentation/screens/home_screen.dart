
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_animate/flutter_animate.dart';

import 'package:paytech_mobile/core/theme/app_theme.dart';

import 'package:paytech_mobile/core/widgets/paytech_card.dart';

import 'package:paytech_mobile/features/payments/presentation/screens/qr_screen.dart';

import 'package:paytech_mobile/features/banking/presentation/screens/link_bank_screen.dart';

import 'package:paytech_mobile/features/services/presentation/screens/telco_screen.dart';

import 'package:paytech_mobile/features/ticketing/presentation/screens/ticketing_screen.dart';

import 'package:paytech_mobile/features/utilities/presentation/screens/electricity_screen.dart';

import 'package:paytech_mobile/features/kyc/presentation/screens/kyc_screen.dart';

import 'package:paytech_mobile/features/merchant/presentation/screens/receive_screen.dart';

import 'package:paytech_mobile/features/wallet/presentation/widgets/transfer_sheet.dart';

import 'package:paytech_mobile/features/notifications/presentation/screens/notifications_screen.dart';



class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});



  @override

  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: const Row(

          children: [

            Icon(FontAwesomeIcons.wallet, size: 20),

            SizedBox(width: 10),

            Text('PAYTECH'),

          ],

        ),

        actions: [

          IconButton(

            icon: const Icon(FontAwesomeIcons.bell),

            onPressed: () => _nav(context, const NotificationsScreen()),

          ),

          const SizedBox(width: 8),

        ],

      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(20),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            PaytechBalanceCard(

              currency: 'ZAR',

              amount: 14500.50,

              onTopUp: () => _nav(context, const ReceivePaymentScreen()),

            ),

            const SizedBox(height: 30),

            Text(

              'Quick Actions',

              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),

            ),

            const SizedBox(height: 16),

            GridView.count(

              shrinkWrap: true,

              physics: const NeverScrollableScrollPhysics(),

              crossAxisCount: 4,

              mainAxisSpacing: 16,

              crossAxisSpacing: 16,

              children: [

                _buildQuickAction(context, 'Scan', FontAwesomeIcons.qrcode, Colors.blue, () => _nav(context, const QRScannerScreen())),

                _buildQuickAction(context, 'Pay', FontAwesomeIcons.moneyBillWave, Colors.green, () => _showTransfer(context)),

                _buildQuickAction(context, 'Airtime', FontAwesomeIcons.mobileScreen, Colors.orange, () => _nav(context, const TelcoScreen())),

                _buildQuickAction(context, 'Tickets', FontAwesomeIcons.ticket, Colors.purple, () => _nav(context, const TicketingScreen())),

                _buildQuickAction(context, 'Elec', FontAwesomeIcons.bolt, Colors.amber, () => _nav(context, const ElectricityScreen())),

                _buildQuickAction(context, 'Bank', FontAwesomeIcons.buildingColumns, Colors.indigo, () => _nav(context, const LinkBankScreen())),

                _buildQuickAction(context, 'Receive', FontAwesomeIcons.handHoldingDollar, Colors.pink, () => _nav(context, const ReceivePaymentScreen())),

                _buildQuickAction(context, 'Verify', FontAwesomeIcons.idCard, Colors.grey, () => _nav(context, const KYCScreen())),

              ],

            ),

            const SizedBox(height: 30),

            Text(

              'Recent Transactions',

              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),

            ),

            const SizedBox(height: 16),

            ListView.builder(

              shrinkWrap: true,

              physics: const NeverScrollableScrollPhysics(),

              itemCount: 5,

              itemBuilder: (context, index) {

                return Card(

                  elevation: 0,

                  margin: const EdgeInsets.only(bottom: 12),

                  shape: RoundedRectangleBorder(

                    borderRadius: BorderRadius.circular(12),

                    side: BorderSide(color: Colors.grey.shade200),

                  ),

                  child: ListTile(

                    leading: CircleAvatar(

                      backgroundColor: index.isEven ? Colors.green.shade50 : Colors.red.shade50,

                      child: Icon(

                        index.isEven ? FontAwesomeIcons.arrowDown : FontAwesomeIcons.arrowUp,

                        color: index.isEven ? Colors.green : Colors.red,

                        size: 16,

                      ),

                    ),

                    title: Text(index.isEven ? 'Received from John' : 'Checkers Payment'),

                    subtitle: const Text('Today, 10:30 AM'),

                    trailing: Text(

                      index.isEven ? '+ R 500.00' : '- R 240.50',

                      style: TextStyle(

                        fontWeight: FontWeight.bold,

                        color: index.isEven ? Colors.green : Colors.black,

                      ),

                    ),

                  ),

                ).animate().fadeIn(delay: Duration(milliseconds: index * 100));

              },

            ),

          ],

        ),

      ),

    );

  }



  void _nav(BuildContext context, Widget screen) {

    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));

  }



  void _showTransfer(BuildContext context) {

    showModalBottomSheet(

      context: context,

      isScrollControlled: true,

      backgroundColor: Colors.transparent,

      builder: (context) => const TransferBottomSheet(),

    );

  }



  Widget _buildQuickAction(BuildContext context, String label, IconData icon, Color color, VoidCallback onTap) {

    return GestureDetector(

      onTap: onTap,

      child: Column(

        children: [

          Container(

            height: 56,

            width: 56,

            decoration: BoxDecoration(

              color: color.withOpacity(0.1),

              borderRadius: BorderRadius.circular(16),

            ),

            child: Icon(icon, color: color, size: 24),

          ),

          const SizedBox(height: 8),

          Text(

            label,

            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),

            textAlign: TextAlign.center,

          ),

        ],

      ),

    );

  }

}

