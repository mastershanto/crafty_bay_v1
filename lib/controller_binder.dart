///todo: isCodingWorkCompleted?=>"no, work in progress!";
library;

import 'presentation/state_holders/auth_controller.dart';
import 'package:crafty_bay_v1/presentation/state_holders/read_profile_data_controller.dart';

import 'presentation/state_holders/verify_otp_controller.dart';
import 'package:get/get.dart';

import 'presentation/state_holders/main_bottom_nav_controller.dart';
import 'presentation/state_holders/send_email_otp_controller.dart';


class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavController(),);
    Get.put(SendEmailOtpController(),);
    Get.put(VerifyOtpController(),);
    Get.put(ReadProfileDataController(),);
    Get.put(AuthController(),);

  }

}


