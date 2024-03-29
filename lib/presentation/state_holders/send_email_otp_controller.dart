///isCodingWorkCompleted? => "yes, completed";
library;


import 'package:crafty_bay_v1/data/services/network_caller.dart';
import 'package:get/get.dart';

import '../../data/models/response_data.dart';
import '../../data/data_utility/urls.dart';

class SendEmailOtpController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  Future<bool> sendOtpToEmail(String email) async {
    _inProgress = true;
    update();
    final ResponseData response = await NetworkCaller().getRequest(Urls.sentEmailOtp(email));
    _inProgress = false;
    if (response.isSuccess) {
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }
}
