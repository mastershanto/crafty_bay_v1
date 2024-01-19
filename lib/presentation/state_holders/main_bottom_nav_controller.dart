import 'package:get/get.dart';

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

}