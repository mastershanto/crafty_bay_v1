///todo: isCodingWorkCompleted?=>"no, work in progress!";
library;

import 'package:get/get.dart';

import 'auth_controller.dart';
class MainBottomNavController extends GetxController {
  int _selectedIndex = 0;

  int get currentIndex => _selectedIndex;

  void changeIndex(int index) {
    if (_selectedIndex == index) {
      return;
    }

    if (index == 2 || index == 3) {
      if (Get.find<AuthController>().isTokenNotNull == false) {
        AuthController.goToLogin();
        return;
      }
    }

    _selectedIndex = index;
    update();
  }

  void backToHome() {
    changeIndex(0);
  }
}

/*
class MainBottomNavController extends GetxController{
  int _selectedIndex=0;

  int get currentIndex=>_selectedIndex; /// for using the index value

  void changeIndex(int index){   /// for setting the index value to _selectedIndex
    if(_selectedIndex==index){
      return;
    }
    _selectedIndex=index;
    update();
  }

  void backToHome(){
    changeIndex(0);
  }

}*/
