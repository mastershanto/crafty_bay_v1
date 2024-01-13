
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_holders/main_bottom_nav_controller.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (value){
        Get.find<MainBottomNavController>().backToHome();
      },

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
            title: const Text("Category"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              itemCount: 100,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: .70,
                crossAxisSpacing: 8,
                mainAxisSpacing: 12,
              ),
              itemBuilder: (context, index) {
                return const CategoryItem(title: "Electronics\nOthers");
              },
            ),
          ),
        ),
      ),
    );
  }
}
