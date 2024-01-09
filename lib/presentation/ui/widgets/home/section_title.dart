import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key, required this.title, required this.onTapSeeAll,
  });

  final String title;
  final VoidCallback onTapSeeAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
         Text(title,
          style: const TextStyle(
              fontWeight: FontWeight.w600, fontSize: 20),
        ),
        TextButton(
          onPressed: onTapSeeAll,
          child: const Text(
            "Sell All",
          ),
        )
      ],
    );
  }
}