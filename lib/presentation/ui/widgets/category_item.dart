import 'package:crafty_bay_v1/presentation/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utility/app_colors.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          ProductListScreen(
            category: "Electronics",
          ),
        );
      },
      child: Column(
        children: [
          Card(
            elevation: 0,
            color: AppColors.primaryColor.withOpacity(.2),
            child: const Padding(
              padding: EdgeInsets.all(20.0),
              child: Icon(
                Icons.computer,
                size: 30,
                color: AppColors.primaryColor,
              ),
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryColor,
              // overflow: TextOverflow.ellipsis
            ),
          ),
        ],
      ),
    );
  }
}
