import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:paytech_mobile/core/theme/app_theme.dart';

class LinkBankScreen extends StatefulWidget {
  const LinkBankScreen({super.key});

  @override
  State<LinkBankScreen> createState() => _LinkBankScreenState();
}

class _LinkBankScreenState extends State<LinkBankScreen> {
  int _selectedBankIndex = -1;
  bool _isLoading = false;

  final List<Map<String, dynamic>> _banks = [
    {'name': 'Capitec', 'color': Colors.blue},
    {'name': 'FNB', 'color': Colors.cyan},
    {'name': 'Standard Bank', 'color': Colors.blueAccent},
    {'name': 'Absa', 'color': Colors.red},
    {'name': 'Nedbank', 'color': Colors.green},
    {'name': 'TymeBank', 'color': Colors.orange},
  ];

  void _linkBank() async {
    if (_selectedBankIndex == -1) return;
    
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 2)); // Simulate API
    
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Successfully linked ${_banks[_selectedBankIndex]['name']}'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Link Bank Account'),
        backgroundColor: AppTheme.primaryBlue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.blue.shade50,
            child: Row(
              children: [
                const Icon(Icons.security, color: AppTheme.primaryBlue),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Your credentials are encrypted and never stored. We use bank-grade security.',
                    style: TextStyle(color: Colors.blue.shade900, fontSize: 13),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.3,
              ),
              itemCount: _banks.length,
              itemBuilder: (context, index) {
                final isSelected = _selectedBankIndex == index;
                return GestureDetector(
                  onTap: () => setState(() => _selectedBankIndex = index),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isSelected ? AppTheme.primaryBlue : Colors.grey.shade200,
                        width: isSelected ? 2 : 1,
                      ),
                      boxShadow: [
                        if (isSelected)
                          BoxShadow(
                            color: AppTheme.primaryBlue.withOpacity(0.2),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          )
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: _banks[index]['color'].withOpacity(0.1),
                          child: Icon(FontAwesomeIcons.buildingColumns, color: _banks[index]['color']),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          _banks[index]['name'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: isSelected ? AppTheme.primaryBlue : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                onPressed: _selectedBankIndex == -1 || _isLoading ? null : _linkBank,
                style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primaryBlue),
                child: _isLoading 
                  ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                  : const Text('Continue to Secure Login'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
