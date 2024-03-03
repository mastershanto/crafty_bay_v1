///todo: isCodingWorkCompleted?=>"no, work in progress!";
library;



import 'dart:async';

import 'package:crafty_bay_v1/data/models/create_profile_params.dart';
import 'package:crafty_bay_v1/data/services/network_caller.dart';
import 'package:crafty_bay_v1/data/data_utility/urls.dart';
import 'package:crafty_bay_v1/presentation/state_holders/auth_controller.dart';
import 'package:get/get.dart';
import '../../data/models/profile.dart';

class CompleteProfileController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  Profile _profile = Profile();

  Profile get profile => _profile;

  Future<bool> createProfileData(String token, CreateProfileParams params) async {
    _inProgress = true;
    update();
    final response = await NetworkCaller()
        .postRequest(Urls.createProfile, token: token, body: params.toJson());
    _inProgress = false;
    if (response.isSuccess) {
      _profile = Profile.fromJson(response.responseData['data']);
      await Get.find<AuthController>().saveUserDetails(token, _profile);
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }
}




// class CompleteProfileController extends GetxController {
//   bool _inProgress = false;
//
//   bool get inProgress => _inProgress;
//
//   String _errorMessage = "";
//
//   String get errorMessage => _errorMessage;
//
//   Profile _profile = Profile();
//
//   Profile get profile => _profile;
//
//   // bool _isProfileCompleted = false;
//   //
//   // bool get isProfileCompleted => _isProfileCompleted;
//
//   Future<bool> createProfileData(
//       String token, CreateProfileParams params) async {
//     _inProgress = true;
//     update();
//
//     final ResponseData response = await NetworkCaller()
//         .postRequest(Urls.createProfile, token: token, body: params.toJson());
//
//     _inProgress = false;
//     if (response.isSuccess) {
//       _profile = Profile.fromJson(response.responseData["data"]);
//       await Get.find<AuthController>().saveUserDetails(token, _profile);
//       update();
//       return true;
//     } else {
//       _errorMessage = response.errorMessage;
//       update();
//       return false;
//     }
//   }
// }
