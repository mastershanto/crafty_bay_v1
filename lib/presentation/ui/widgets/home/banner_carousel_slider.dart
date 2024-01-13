import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../utility/app_colors.dart';

class BannerCarouselSlider extends StatefulWidget {
  const BannerCarouselSlider({super.key, this.height});

  final double? height;

  @override
  State<BannerCarouselSlider> createState() => _BannerCarouselSliderState();
}

class _BannerCarouselSliderState extends State<BannerCarouselSlider> {
  final ValueNotifier<int> _currentIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: widget.height ?? 180.0,
            onPageChanged: (index, reason) {
              _currentIndex.value = index;
            },
            // viewportFraction: 1,
            viewportFraction: 3,
            // autoPlay: true,
            // enableInfiniteScroll: false,
          ),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 1.0),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'text $i',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: Colors.white),
                  ),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 6),
        ValueListenableBuilder(
            valueListenable: _currentIndex,
            builder: (context, index, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 5; i++)
                    Container(
                      height: 12,
                      width: 12,
                      margin: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: i == index
                            ? AppColors.primaryColor
                            : Colors.transparent,
                        border: Border.all(
                          color:
                              i == index ? AppColors.primaryColor : Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                ],
              );
            }),
      ],
    );
  }
}
