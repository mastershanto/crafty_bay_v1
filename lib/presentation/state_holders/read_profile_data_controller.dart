///todo: isCodingWorkCompleted?=>"no, have some problem!";
library;


import 'package:crafty_bay_v1/data/models/response_data.dart';
import 'package:crafty_bay_v1/data/services/network_caller.dart';
import 'package:crafty_bay_v1/data/data_utility/urls.dart';
import 'package:get/get.dart';

import '../../data/models/profile.dart';

class ReadProfileDataController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _errorMessage = "";

  String get errorMessage => _errorMessage;

  Profile _profile=Profile();
  Profile get profile=>_profile;

  bool _isProfileCompleted=false;
  bool get isProfileCompleted=>_isProfileCompleted;


  Future<bool> readProfileData(String token) async {
    _inProgress = true;

    final ResponseData response =
        await NetworkCaller().getRequest(Urls.readProfile, token: token);

    _inProgress = false;
    if (response.isSuccess) {
        final profileData=response.responseData["data"];
        if(profileData.isEmpty){
          _isProfileCompleted=false;

        }else{
          _profile=Profile.fromJson(profileData[0]);
          _isProfileCompleted=true;

          //todo: save profile data;
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
