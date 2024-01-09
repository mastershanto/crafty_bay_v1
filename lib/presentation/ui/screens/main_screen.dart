import 'package:crafty_bay_v1/presentation/ui/utility/assets_path.dart';
import 'package:flutter/material.dart';
import '../utility/app_colors.dart';
import '../widgets/home/circle_icon_button.dart';
import '../widgets/banner_carousel_slider.dart';
import '../widgets/home/section_title.dart';

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
                  onTapSeeAll: () {},
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 100,
                    itemBuilder: (context,index) {
                      return Card(
                        elevation:0,
                        color: AppColors.primaryColor.withOpacity(.2),
                        child: const Padding(
                          padding: EdgeInsets.all(24.0),
                          child: Icon(Icons.computer,size:30,color:AppColors.primaryColor),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
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
      title: Image.asset(AssetsPath.logoNav),
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
