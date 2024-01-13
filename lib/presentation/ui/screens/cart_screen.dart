import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../state_holders/main_bottom_nav_controller.dart';
import '../utility/app_colors.dart';

import '../widgets/cart/cart_product_item.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (value) {
        Get.find<MainBottomNavController>().backToHome();
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Get.find<MainBottomNavController>().backToHome();
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
            title: const Text("Cart"),
            // backgroundColor: Colors.grey.shade200,'
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                cartProductItemList,
                const SizedBox(height: 4,),
                totalPriceAndCheckoutSection,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Expanded get cartProductItemList {
    return Expanded(
                child: ListView.separated(
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    return const CartProductItem();
                  },
                  separatorBuilder: (_, __) {
                    return const SizedBox(
                      height: 8,
                    );
                  },
                ),
              );
  }

  Container get totalPriceAndCheckoutSection {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(.2),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Total Price",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "\$10000",
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 28,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 70,
            /*decoration: BoxDecoration(
                        color: AppColors.primaryColor.withOpacity(.2),
                      ),*/
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                ),
                onPressed: () {},
                child: const Text(
                  "Checkout",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
