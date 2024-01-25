import 'package:flutter/material.dart';

import '../../ui_utility/app_colors.dart';

class SizeSelector extends StatefulWidget {
  const SizeSelector({super.key, required this.sizes, required this.onChange});

  final List<String> sizes;
  final Function(String) onChange;

  @override
  State<SizeSelector> createState() => _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {
  late String _selectedSize;

  @override
  void initState() {
    _selectedSize = "M";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: widget.sizes
          .map(
            (s) => InkWell(
          onTap: () {
            _selectedSize = s;
            widget.onChange(s);
            setState(() {});
          },
          borderRadius: BorderRadius.circular(15),
          child: Container(
            margin: const EdgeInsets.all(4),
            padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                  width: 2,
                  color: _selectedSize == s
                      ? AppColors.primaryColor
                      : Colors.grey),
              color: _selectedSize == s
                  ? AppColors.primaryColor
                  : Colors.transparent,
            ),
            child: ClipOval(
              child: Text(s,
                  style: TextStyle(
                      color: _selectedSize == s ? Colors.white : Colors.grey,fontWeight:FontWeight.w600
                  )),
            ),
          ),
        ),
      )
          .toList(),
    );
  }
}