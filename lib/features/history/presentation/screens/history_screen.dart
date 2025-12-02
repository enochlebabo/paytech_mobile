import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:paytech_mobile/core/theme/app_theme.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions'),
        centerTitle: false,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: 10,
        separatorBuilder: (c, i) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final isReceived = index % 2 == 0;
          return ListTile(
            contentPadding: const EdgeInsets.symmetric(vertical: 8),
            leading: CircleAvatar(
              radius: 24,
              backgroundColor: isReceived ? Colors.green.shade50 : Colors.blue.shade50,
              child: Icon(
                isReceived ? FontAwesomeIcons.arrowDown : FontAwesomeIcons.arrowUp,
                color: isReceived ? Colors.green : Colors.blue,
                size: 18,
              ),
            ),
            title: Text(
              isReceived ? 'Received from Sarah' : 'Paid to Woolworths',
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: Text('Oct 12, 2025 • 14:30'),
            trailing: Text(
              isReceived ? '+ R 250.00' : '- R 1,200.00',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isReceived ? Colors.green : Colors.black,
                fontSize: 16,
              ),
            ),
          );
        },
      ),
    );
  }
}
