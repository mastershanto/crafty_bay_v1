///todo: isCodingWorkCompleted?=>"No, work in progress";
library;

import 'package:crafty_bay_v1/presentation/ui/ui_utility/app_colors.dart';
import 'package:crafty_bay_v1/presentation/ui/widgets/product_card_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_holders/main_bottom_nav_controller.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (value){
        Get.find<MainBottomNavController>().backToHome();
      },
      child: Container(
        color: AppColors.primaryColor,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              elevation:3,
              leading: IconButton(
                onPressed: () {
                  Get.find<MainBottomNavController>().backToHome();
                },
                icon: const Icon(Icons.arrow_back_ios),
              ),
              title: const Text("Wishlist"),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: 100,
                primary: false,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: .5, //It's important for making good shape for grid items
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                ),
                itemBuilder: (context, index) {
                  // return const ProductCardItem();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
