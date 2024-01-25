
import 'package:flutter/material.dart';

import '../ui_utility/assets_path.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key,this.width,this.height});
final double? width;
final double? height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(AssetsPath.logoPng,width:width??120, height:height??120);
  }
}
