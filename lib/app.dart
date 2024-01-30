///todo: isCodingWorkCompleted?=>"no, work in progress!";
library;

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller_binder.dart';
import 'presentation/ui/screens/auth/splash_screen.dart';
import 'presentation/ui/ui_utility/app_theme_data.dart';

class CraftyBay extends StatefulWidget {
  const CraftyBay({super.key});

  @override
  State<CraftyBay> createState() => _CraftyBayState();
}

class _CraftyBayState extends State<CraftyBay> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.lightThemeData,
      home: const SplashScreen(),
      initialBinding:ControllerBinder(),


    );
  }
}


