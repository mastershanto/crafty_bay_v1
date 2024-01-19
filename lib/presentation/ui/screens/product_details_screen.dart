import 'package:crafty_bay_v1/presentation/ui/utility/app_colors.dart';
import 'package:crafty_bay_v1/presentation/ui/widgets/cart/items_counter_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/product_details/color_selector.dart';
import '../widgets/product_details/product_image_carousel_slider.dart';
import '../widgets/product_details/size_selector.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

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
  String _selectedSize = "M";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Product Details Page"),
          ),
          body: SizedBox(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        const ProductImageCarouselSlider(),
                        productDetailsBody,
                      ],
                    ),
                  ),
                ),
                priceAndAddToCartSection,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding get productDetailsBody {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  "Nike Sport Shoe 2024 Edition ED24R - Save 30%",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
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
          reviewAndRatingRow,
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
                colors: colors,
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
                sizes: sizes,
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
              const Text(
                '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.''',
                style: TextStyle(
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

  Row get reviewAndRatingRow {
    return Row(
      children: [
        const SizedBox(
          width: 8,
        ),
        const Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Icon(
              Icons.star,
              size: 18,
              color: Colors.amber,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              '4.4',
              style: TextStyle(
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
}
