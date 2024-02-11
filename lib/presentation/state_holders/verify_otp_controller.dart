///todo: isCodingWorkCompleted? => "no, have some problem";
library;



import 'package:crafty_bay_v1/data/models/response_data.dart';
import 'package:crafty_bay_v1/data/services/network_caller.dart';
import 'package:crafty_bay_v1/data/data_utility/urls.dart';
import 'package:crafty_bay_v1/presentation/state_holders/auth_controller.dart';
import 'package:crafty_bay_v1/presentation/state_holders/read_profile_data_controller.dart';
import 'package:get/get.dart';

class VerifyOtpController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String _errorMessage="";
  String get errorMessage=>_errorMessage;

  bool _shouldNavigateToCompleteProfile=true;
  bool get shouldNavigateToCompleteProfile=>_shouldNavigateToCompleteProfile;


  Future<bool> verifyOtp(String email, String otp) async {
    _inProgress = true;
    update();

    final ResponseData response =
        await NetworkCaller().getRequest(Urls.verifyOtp(email, otp));
    _inProgress = false;

    if (response.isSuccess) {

      final token=response.responseData["data"];
      await Future.delayed(const Duration(seconds: 3),);
      final bool result= await Get.find<ReadProfileDataController>().readProfileData(token);
      if(result){
        _shouldNavigateToCompleteProfile= await Get.find<ReadProfileDataController>().isProfileCompleted==false;

        if(_shouldNavigateToCompleteProfile){
          await Get.find<AuthController>().saveUserDetails(token, Get.find<ReadProfileDataController>().profile);
        }

      }else{
        _errorMessage=Get.find<ReadProfileDataController>().errorMessage;
        update();
        return false;
      }


      //todo: save to local cache

      update();
      return true;
    } else {
      _errorMessage=response.errorMessage;
      update();
      return false;
    }
  }
}
