import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tayseer/core/utils/size_config.dart';

class SupportButton extends StatelessWidget {
  final String text;
  final String? iconPath;
  final VoidCallback onPressed;
  final bool hasIcon;

  const SupportButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.iconPath,
    this.hasIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    SizeConfig.init(context);
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: isDark ? Colors.transparent : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),

          side: const BorderSide(color: Color(0xFFE3E5E5)),
        ),
        padding:   EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (hasIcon && iconPath != null)
            Padding(
              padding:   EdgeInsets.only(right: 8.w),
              child: SvgPicture.asset(
                iconPath!,
                height: 24.h,
                width: 24.w,
                color: isDark ? Colors.white : const Color(0xFF3F4040),
              ),
            ),
          SizedBox(width: 8.w),
          Flexible(
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16.h,
                color: isDark ? Colors.white : const Color(0xFF3F4040),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
