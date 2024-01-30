///todo: isCodingWorkCompleted?=>"no, work in progress!";
///isCodingWorkCompleted? => "yes, completed";
library;

import 'package:crafty_bay_v1/data/models/response_data.dart';
import 'package:crafty_bay_v1/data/services/network_caller.dart';
import 'package:crafty_bay_v1/data/data_utility/urls.dart';
import 'package:get/get.dart';

import '../../data/models/create_profile_params.dart';
import '../../data/models/profile.dart';

class CompleteProfileController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _errorMessage = "";

  String get errorMessage => _errorMessage;

  Profile _profile = Profile();

  Profile get profile => _profile;

  bool _isProfileCompleted = false;

  bool get isProfileCompleted => _isProfileCompleted;

  Future<bool> createProfileData(String token,CreateProfileParams params) async {
    _inProgress = true;
    update();

    final ResponseData response =
    await NetworkCaller().postRequest(Urls.readProfile, token: token);

    _inProgress = false;
    if (response.isSuccess) {
      final profileData = response.responseData["data"];
      if (profileData.isEmpty) {
        _isProfileCompleted = false;
      } else {
        _profile = Profile.fromJson(profileData[0]);
        _isProfileCompleted = true;
      }
      update();
      return true;
    } else {
      _errorMessage=response.errorMessage;
      update();
      return false;
    }
  }
}
