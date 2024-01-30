///isCodingWorkCompleted? => "yes, completed";
library;

import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/models/profile.dart';

class AuthController extends GetxController {
  static String? token;
   Profile? profile;

  Future<void> saveUserDetails(String t, Profile p) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString("token", t);
    await sharedPreferences.setString("profile", jsonEncode(p.toJson()));

    token = t;
    profile = p;
  }

  Future<void> initialize() async {
    token = await _getToken();
    profile = await _getProfile();
  }

  //isLoggedIn is an interface method, which has need to show others
  Future<bool> isLoggedIn() async {
    await initialize();
    return token != null;
  }

  bool get isTokenNotNull=>token!=null;

  //_getToken is an implementation method, which has no need to show others
  Future<String?> _getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString("token");
  }

  Future<Profile?> _getProfile() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final String? strProfile = sharedPreferences.getString("profile");
    if (strProfile == null) {
      return null;
    } else {
      return Profile.fromJson(jsonDecode(strProfile));
    }
  }

  Future<void> clearAuthData()async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }
}
