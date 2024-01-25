import 'package:crafty_bay_v1/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:crafty_bay_v1/presentation/ui/screens/cart_screen.dart';
import 'package:crafty_bay_v1/presentation/ui/screens/categories_screen.dart';
import 'package:crafty_bay_v1/presentation/ui/screens/home_screen.dart';
import 'package:crafty_bay_v1/presentation/ui/screens/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui_utility/app_colors.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {


  final List<Widget> _screens=const[
    HomeScreen(),
    CategoriesScreen(),
    CartScreen(),
    WishlistScreen(),
  ];

  @override
  Widget build(BuildContext context) {

    return GetBuilder<MainBottomNavController>(
      builder: (controller) {
        return Scaffold(
          body: _screens[controller.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex,
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            onTap: (index){
              controller.changeIndex(index);
              },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home",),
              BottomNavigationBarItem(icon: Icon(Icons.dashboard),label: "Categories"),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: "Cart"),
              BottomNavigationBarItem(icon: Icon(Icons.favorite_outline),label: "Wishlist"),
            ],
          ),
        );
      }
    );
  }
}
