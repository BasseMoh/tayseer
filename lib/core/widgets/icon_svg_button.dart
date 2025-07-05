import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tayseer/core/utils/size_config.dart';

class IconSvgButton extends StatelessWidget {
  final String assetPath;
  final Color? color;
  final VoidCallback onPressed;
  final double size;

  const IconSvgButton({
    super.key,
    required this.assetPath,
    required this.onPressed,
    this.color,
    this.size = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return IconButton(
      icon: SvgPicture.asset(
        assetPath,
        height: size.h,
        width: size.w,
        color: color,
      ),
      onPressed: onPressed,
    );
  }
}