///todo: isCodingWorkCompleted?=>"no, work in progress!";
library;


import 'package:crafty_bay_v1/presentation/state_holders/auth_controller.dart';
import 'package:crafty_bay_v1/presentation/ui/screens/main_bottom_nav_screen.dart';
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
    await Future.delayed(const Duration(seconds: 1));

    final bool isLoggedIn=await Get.find<AuthController>().isLoggedIn();

    if(isLoggedIn){
      Get.offAll(const MainBottomNavScreen());
    } else{
      Get.offAll(const VerifyEmailScreen());
    }
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
