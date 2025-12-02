
import 'package:flutter/material.dart';

import 'package:paytech_mobile/core/theme/app_theme.dart';

import 'package:paytech_mobile/features/payments/presentation/screens/payment_success_screen.dart';



class TicketingScreen extends StatefulWidget {

  const TicketingScreen({super.key});



  @override

  State<TicketingScreen> createState() => _TicketingScreenState();

}



class _TicketingScreenState extends State<TicketingScreen> with SingleTickerProviderStateMixin {

  late TabController _tabController;



  @override

  void initState() {

    super.initState();

    _tabController = TabController(length: 2, vsync: this);

  }



  @override

  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: const Text('Marketplace'),

        backgroundColor: AppTheme.primaryBlue,

        foregroundColor: Colors.white,

        bottom: TabBar(

          controller: _tabController,

          labelColor: Colors.white,

          unselectedLabelColor: Colors.white70,

          indicatorColor: Colors.white,

          tabs: const [

            Tab(text: 'Events'),

            Tab(text: 'Transport'),

          ],

        ),

      ),

      body: TabBarView(

        controller: _tabController,

        children: [

          _buildEventsList(context),

          _buildTransportList(context),

        ],

      ),

    );

  }



  Widget _buildEventsList(BuildContext context) {

    final events = [

      {'title': 'Cape Town Jazz Fest', 'date': '25 Dec', 'price': 'R 850'},

      {'title': 'Soweto Derby', 'date': '12 Jan', 'price': 'R 120'},

      {'title': 'Lesotho Sky Run', 'date': '05 Feb', 'price': 'R 450'},

    ];



    return ListView.builder(

      padding: const EdgeInsets.all(16),

      itemCount: events.length,

      itemBuilder: (context, index) {

        return Card(

          margin: const EdgeInsets.only(bottom: 16),

          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),

          child: ListTile(

            leading: Container(

              width: 50, height: 50,

              color: Colors.grey.shade300,

              child: const Icon(Icons.event),

            ),

            title: Text(events[index]['title']!, style: const TextStyle(fontWeight: FontWeight.bold)),

            subtitle: Text(events[index]['date']!),

            trailing: ElevatedButton(

              onPressed: () => _buy(context),

              style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primaryBlue),

              child: Text(events[index]['price']!),

            ),

          ),

        );

      },

    );

  }



  Widget _buildTransportList(BuildContext context) {

    final transport = [

      {'route': 'JHB - Maseru', 'operator': 'Intercape', 'time': '08:00 AM', 'price': 'R 450'},

      {'route': 'CPT - Durban', 'operator': 'Greyhound', 'time': '18:00 PM', 'price': 'R 620'},

    ];



    return ListView.builder(

      padding: const EdgeInsets.all(16),

      itemCount: transport.length,

      itemBuilder: (context, index) {

        return Card(

          child: ListTile(

            leading: const Icon(Icons.directions_bus, color: Colors.orange),

            title: Text(transport[index]['route']!),

            subtitle: Text(transport[index]['operator']!),

            trailing: Text(transport[index]['price']!, style: const TextStyle(fontWeight: FontWeight.bold)),

            onTap: () => _buy(context),

          ),

        );

      },

    );

  }



  void _buy(BuildContext context) {

    Navigator.push(context, MaterialPageRoute(builder: (c) => const PaymentSuccessScreen()));

  }

}

