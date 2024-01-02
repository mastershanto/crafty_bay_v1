
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'presentation/ui/screens/splash_screen.dart';
import 'presentation/ui/utility/app_theme_data.dart';

class CraftyBay extends StatefulWidget {
  const CraftyBay({super.key});

  @override
  State<CraftyBay> createState() => _CraftyBayState();
}

class _CraftyBayState extends State<CraftyBay> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppThemeData.lightThemeData,
      home: const SplashScreen(),
    );
  }
}

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
  }
}
