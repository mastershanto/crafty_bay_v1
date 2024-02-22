///todo: isCodingWorkCompleted?=>"No, work in progress";
library;

import 'package:crafty_bay_v1/data/models/product_details_data.dart';
import 'package:crafty_bay_v1/presentation/state_holders/product_details_controller.dart';
import 'package:crafty_bay_v1/presentation/ui/ui_utility/app_colors.dart';
import 'package:crafty_bay_v1/presentation/ui/widgets/cart/items_counter_widget.dart';
import 'package:crafty_bay_v1/presentation/ui/widgets/center_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/product_details/color_selector.dart';
import '../widgets/product_details/product_image_carousel_slider.dart';
import '../widgets/product_details/size_selector.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  final int productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  ValueNotifier<int> noOfItems = ValueNotifier(0);

  List<Color> colors = [
    Colors.purple,
    Colors.black,
    Colors.amber,
    Colors.red,
    Colors.lightGreen,
  ];
  List<String> sizes = [
    "S",
    "M",
    "L",
    "XL",
    "XXL",
    "XXXL",
  ];

  Color _selectedColor = Colors.purple;
  String? _selectedSize;

  @override
  void initState() {
    super.initState();

    Get.find<ProductDetailsController>().getProductDetails(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Product Details Page"),
          ),
          body: GetBuilder<ProductDetailsController>(
              builder: (productDetailsController) {
            return Visibility(
              visible: productDetailsController.inProgress == false,
              replacement: const CenterCircularProgressIndicator(),
              child: SizedBox(
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            ProductImageCarouselSlider(
                              urls: [
                                productDetailsController.productDetails.img1 ??
                                    "",
                                productDetailsController.productDetails.img2 ??
                                    "",
                                productDetailsController.productDetails.img3 ??
                                    "",
                                productDetailsController.productDetails.img4 ??
                                    "",
                              ],
                            ),
                            productDetailsBody(
                                productDetailsController.productDetails),
                          ],
                        ),
                      ),
                    ),
                    priceAndAddToCartSection,
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Padding productDetailsBody(ProductDetailsData productDetails) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  productDetails.product?.title ?? "",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              ItemsCounterWidget(
                  initialValue: 1,
                  minValue: 0,
                  maxValue: 5,
                  color: AppColors.primaryColor,
                  onTapGetValue: (value) {}),
            ],
          ),
          reviewAndRatingRow(productDetails.product?.star??0),
          const SizedBox(
            height: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              selectorTitle(title: "Colors"),
              const SizedBox(
                height: 8,
              ),
              ColorSelector(
                colors: productDetails.color
                        ?.split(",")
                        .map((colorCode) => getColorFromString(colorCode))
                        .toList() ??
                    [] /*colors*/,
                onChange: (selectedColor) {
                  _selectedColor = selectedColor;
                },
              ),
              const SizedBox(
                height: 8,
              ),
              selectorTitle(title: "Sizes"),
              const SizedBox(
                height: 8,
              ),
              SizeSelector(
                sizes: productDetails.size?.split(",") ?? [],
                onChange: (size) {
                  _selectedSize = size;
                },
              ),
              const SizedBox(
                height: 8,
              ),
              selectorTitle(title: "Description"),
              const SizedBox(
                height: 8,
              ),
              Text(
                productDetails.des ?? "",
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Row reviewAndRatingRow(num rating) {
    return Row(
      children: [
        const SizedBox(
          width: 8,
        ),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            const Icon(
              Icons.star,
              size: 18,
              color: Colors.amber,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              rating.toStringAsPrecision(2),
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black45),
            ),
          ],
        ),
        const SizedBox(
          width: 8,
        ),
        const Text(
          'Reviews',
          style: TextStyle(
              fontSize: 16,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          width: 8,
        ),
        Card(
          color: AppColors.primaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          child: const Padding(
            padding: EdgeInsets.all(2.0),
            child: Icon(
              Icons.favorite_outline_rounded,
              size: 18,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  Text selectorTitle({required title}) {
    return Text(
      title,
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }

  Container get priceAndAddToCartSection {
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
                  "Add to Cart",
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

  Color getColorFromString(String colorCode) {
    String code = colorCode.replaceAll("#", "");
    // String haxCode="FF$code";
    return Color(int.parse("0xFF$code"));
  }
}
