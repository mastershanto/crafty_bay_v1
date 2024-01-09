import 'package:crafty_bay_v1/presentation/ui/screens/cart_screen.dart';
import 'package:crafty_bay_v1/presentation/ui/screens/categories_screen.dart';
import 'package:crafty_bay_v1/presentation/ui/screens/main_screen.dart';
import 'package:crafty_bay_v1/presentation/ui/screens/wishlist_screen.dart';
import 'package:flutter/material.dart';

import '../utility/app_colors.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {

  int _selectedIndex=0;

  final List<Widget> _screens=const[
    HomeScreen(),
    CategoriesScreen(),
    CartScreen(),
    WishlistScreen(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: (index){
          _selectedIndex=index;
          if(mounted){
            setState(() {
            });
          }
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
}
