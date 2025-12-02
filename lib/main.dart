
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import 'package:paytech_mobile/core/theme/app_theme.dart';

import 'package:paytech_mobile/features/onboarding/presentation/screens/splash_screen.dart';



void main() {

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(

    statusBarColor: Colors.transparent,

    statusBarIconBrightness: Brightness.light,

  ));

  runApp(const PaytechApp());

}



class PaytechApp extends StatelessWidget {

  const PaytechApp({super.key});



  @override

  Widget build(BuildContext context) {

    return MaterialApp(

      title: 'PAYTECH',

      debugShowCheckedModeBanner: false,

      theme: AppTheme.lightTheme,

      // App starts at Splash Screen now

      home: const SplashScreen(),

    );

  }

}

