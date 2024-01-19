import 'package:flutter/material.dart';
// import 'package:item_count_number_button/item_count_number_button.dart';

import '../../utility/app_colors.dart';
import '../../utility/assets_path.dart';
import 'items_counter_widget.dart';

class CartProductItem extends StatefulWidget {
  const CartProductItem({
    super.key,
  });

  @override
  State<CartProductItem> createState() => _CartProductItemState();
}

class _CartProductItemState extends State<CartProductItem> {
  var callBackValue=0;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Row(
        children: [
          Image.asset(
            AssetsPath.dummyShoeImageJpg,
            width: 100,
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: Column(
                        children: [
                          Text(
                            "Nike show 12ksm 2021 Edition",
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Row(
                            children: [
                              Text("Color: Red,"),
                              SizedBox(width: 8),
                              Text("Size: XL"),
                            ],
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.delete_forever_outlined,
                        size: 25,
                        color: Colors.redAccent,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "\$120",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    ItemsCounterWidget(
                      initialValue: 1,
                      minValue: 0,
                      maxValue: 5,
                      color: AppColors.primaryColor,
                      onTapGetValue: (int v) {
                        // print(v);
                        // setState(() {
                        // });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/*
class _CartProductItemState extends State<CartProductItem> {
  ValueNotifier<int> noOfItems=ValueNotifier(1);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Row(
        children: [
          Image.asset(
            AssetsPath.dummyShoeImageJpg,
            width: 100,
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: Column(
                        children: [
                          Text(
                            "Nike show 12ksm 2021 Edition",
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Row(
                            children: [
                              Text("Color: Red,"),
                              SizedBox(width: 8),
                              Text("Size: XL"),
                            ],
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.delete_forever_outlined,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "\$120",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    Row(
                      children: [
                        ValueListenableBuilder(
                          valueListenable:noOfItems,
                          builder: (context,value,_) {
                            return ItemCount(
                              initialValue: value,
                              minValue: 1,
                              maxValue: 20,
                              decimalPlaces: 0,
                              color: AppColors.primaryColor,
                              onChanged: (v) {
                                // Handle counter value changes
                                noOfItems.value=v.toInt();
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}*/
