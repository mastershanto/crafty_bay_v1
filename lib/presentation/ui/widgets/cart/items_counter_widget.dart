import 'package:flutter/material.dart';

import '../../ui_utility/app_colors.dart';

class ItemsCounterWidget extends StatefulWidget {
   ItemsCounterWidget(
      {super.key,
      required this.initialValue,
      required this.minValue,
      required this.maxValue,
      required this.color,
      required this.onTapGetValue});

  int initialValue;
  int minValue;
  int maxValue;
  Color color;
  Function(int) onTapGetValue;

  @override
  State<ItemsCounterWidget> createState() => _ItemsCounterWidgetState();
}

class _ItemsCounterWidgetState extends State<ItemsCounterWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          minusCounterButton,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.initialValue.toString(),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          plusCounterButton,
        ],
      ),
    );
  }

  InkWell get minusCounterButton {
    return InkWell(
      onTap: () {
        if (widget.initialValue == widget.minValue) {
          return;
        }
        widget.initialValue--;
        if (mounted) {
          setState(() {});
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: widget.initialValue == widget.minValue
              ? Colors.red
              : AppColors.primaryColor.withOpacity(.5),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            bottomLeft: Radius.circular(8),
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.all(4.0),
          child: Text("-",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  InkWell get plusCounterButton {
    return InkWell(
      onTap: () {
        if (widget.initialValue == widget.maxValue) {
          return;
        }
        widget.initialValue++;
        if (mounted) {
          setState(() {});
        }

      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: widget.initialValue == widget.maxValue
              ? Colors.red
              : AppColors.primaryColor,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.all(4.0),
          child: Text("+", style: TextStyle(fontSize: 20)),
        ),
      ),
    );
  }
}
