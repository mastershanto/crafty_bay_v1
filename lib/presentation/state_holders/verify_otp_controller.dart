import 'package:crafty_bay_v1/data/models/response_data.dart';
import 'package:crafty_bay_v1/data/services/network_caller.dart';
import 'package:crafty_bay_v1/data/data_utility/urls.dart';
import 'package:get/get.dart';

class VerifyOtpController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  Future<bool> verifyOtp(String email, String otp) async {
    _inProgress = true;
    update();

    final ResponseData response =
        await NetworkCaller().getRequest(Urls.verifyOtp(email, otp));

    _inProgress=false;
    if(response.isSuccess){

      final token=response.responseData["data"];

      update();
      return true;
    }else{

      update();
      return false;
    }

  }
}
