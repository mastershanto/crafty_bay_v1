import 'package:crafty_bay_v1/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:crafty_bay_v1/presentation/ui/screens/product_list_screen.dart';
import 'package:crafty_bay_v1/presentation/ui/utility/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/category_item.dart';
import '../widgets/home/circle_icon_button.dart';
import '../widgets/home/banner_carousel_slider.dart';
import '../widgets/home/section_title.dart';
import '../widgets/product_card_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const SizedBox(height: 8),
                searchTextFormField,
                const SizedBox(height: 16),
                const BannerCarouselSlider(
                  height: 180,
                ),
                const SizedBox(height: 16),
                SectionTitle(
                  title: "All Categories",
                  onTapSeeAll: () {
                    Get.find<MainBottomNavController>().changeIndex(1);
                  },
                ),
                const SizedBox(height: 8),
                categoryList,
                const SizedBox(height: 8),
                SectionTitle(
                    title: "Popular",
                    onTapSeeAll: () {
                      // Get.find<MainBottomNavController>().changeIndex(3);
                      Get.to(
                        ProductListScreen(),
                      );
                    }),
                productList,
                const SizedBox(height: 8),
                SectionTitle(
                  title: "Special",
                  onTapSeeAll: () {
                    // Get.find<MainBottomNavController>().changeIndex(3);
                    Get.to(
                      ProductListScreen(category:"Special"),
                    );
                  },
                ),
                productList,
                const SizedBox(height: 16),
                SectionTitle(
                  title: "New",
                  onTapSeeAll: () {
                    // Get.find<MainBottomNavController>().changeIndex(3);
                    Get.to(
                      ProductListScreen(category:"New"),
                    );
                  },
                ),
                productList,
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox get productList {
    return SizedBox(
      height: 190,
      child: ListView.separated(
        itemCount: 100,
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const ProductCardItem();
        },
        separatorBuilder: (_, __) {
          return const SizedBox(
            width: 8,
          );
        },
      ),
    );
  }

  SizedBox get categoryList {
    return SizedBox(
      height: 135,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 100,
        primary: false,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return const CategoryItem(title: "Electronics\nOthers",);
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 8,
          );
        },
      ),
    );
  }

  TextFormField get searchTextFormField {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Search",
        filled: true,
        fillColor: Colors.grey.shade200,
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.grey,
        ),

        // border: InputBorder.none,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),

        // enabledBorder:InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),

        // disabledBorder: InputBorder.none,
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),

        // errorBorder: InputBorder.none,
        /*errorBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius:BorderRadius.circular(8),

                  ),*/
      ),
    );
  }

  AppBar get appBar {
    return AppBar(
      title: Image.asset(AssetsPath.logoNavPng),
      actions: [
        CircleIconButton(
          onTap: () {},
          iconData: Icons.person,
        ),
        const SizedBox(
          width: 16,
        ),
        CircleIconButton(
          onTap: () {},
          iconData: Icons.call,
        ),
        const SizedBox(
          width: 16,
        ),
        CircleIconButton(
          onTap: () {},
          iconData: Icons.notifications_active_outlined,
        ),
        const SizedBox(
          width: 16,
        ),
      ],
    );
  }
}
