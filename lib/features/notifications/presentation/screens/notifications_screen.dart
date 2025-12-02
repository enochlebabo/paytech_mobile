
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:paytech_mobile/core/theme/app_theme.dart';



class NotificationsScreen extends StatelessWidget {

  const NotificationsScreen({super.key});



  @override

  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: const Text('Notifications'),

        backgroundColor: AppTheme.primaryBlue,

        foregroundColor: Colors.white,

      ),

      body: ListView(

        children: [

          _buildNotificationItem(

            title: 'Payment Received',

            body: 'You received R 500.00 from John Doe.',

            time: '2 mins ago',

            isUnread: true,

            icon: FontAwesomeIcons.arrowDown,

            color: Colors.green,

          ),

          _buildNotificationItem(

            title: 'Security Alert',

            body: 'New login detected from iPhone 13.',

            time: '1 hour ago',

            isUnread: true,

            icon: FontAwesomeIcons.shieldHalved,

            color: Colors.orange,

          ),

          _buildNotificationItem(

            title: 'Airtime Recharge',

            body: 'Successful recharge of R 29.00 for 072...',

            time: 'Yesterday',

            isUnread: false,

            icon: FontAwesomeIcons.mobileScreen,

            color: Colors.blue,

          ),

          _buildNotificationItem(

            title: 'Monthly Statement',

            body: 'Your transaction history for Sept is ready.',

            time: '2 days ago',

            isUnread: false,

            icon: FontAwesomeIcons.fileInvoice,

            color: Colors.grey,

          ),

        ],

      ),

    );

  }



  Widget _buildNotificationItem({

    required String title,

    required String body,

    required String time,

    required bool isUnread,

    required IconData icon,

    required Color color,

  }) {

    return Container(

      color: isUnread ? Colors.blue.withOpacity(0.05) : Colors.white,

      child: ListTile(

        leading: CircleAvatar(

          backgroundColor: color.withOpacity(0.1),

          child: Icon(icon, color: color, size: 16),

        ),

        title: Text(

          title,

          style: TextStyle(fontWeight: isUnread ? FontWeight.bold : FontWeight.normal),

        ),

        subtitle: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            const SizedBox(height: 4),

            Text(body),

            const SizedBox(height: 4),

            Text(time, style: TextStyle(fontSize: 12, color: Colors.grey[600])),

          ],

        ),

        isThreeLine: true,

      ),

    );

  }

}

