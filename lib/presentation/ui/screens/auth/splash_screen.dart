


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ui_utility/app_colors.dart';
import '../../widgets/app_logo.dart';
// import '../main_bottom_nav_screen.dart';
import 'verify_email_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Future<void> moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.offAll(const VerifyEmailScreen());
    // Get.offAll(const MainBottomNavScreen());
  }

  @override
  void initState() {
    moveToNextScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      child: const SafeArea(
        child: Scaffold(
          body: Center(
            child: Column(
              children: [
                Spacer(),
                AppLogo(),
                Spacer(),
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text("Version 1.0"),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
