///todo: isCodingWorkCompleted?=>"no, work in progress!";
library;

import 'package:flutter/material.dart';

class ColorSelector extends StatefulWidget {
  const ColorSelector(
      {super.key, required this.colors, required this.onChange});

  final List<Color> colors;
  final Function(Color) onChange;

  @override
  State<ColorSelector> createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {
  late Color _selectedColor;

  @override
  void initState() {
    // TODO: implement initState
    _selectedColor = Colors.purple;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: widget.colors
          .map(
            (c) => InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () {
            _selectedColor = c;
            widget.onChange(c);
            setState(() {});
          },
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: CircleAvatar(
              radius: 15,
              backgroundColor: c,
              child: _selectedColor == c
                  ? const Icon(Icons.done, color: Colors.white)
                  : null,
            ),
          ),
        ),
      )
          .toList(),
    );
  }
}