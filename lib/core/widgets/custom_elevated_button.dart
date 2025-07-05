import 'package:flutter/material.dart';
import 'package:tayseer/config/app_theme.dart';
import 'package:tayseer/core/utils/size_config.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final double height;
  final double? width;
  final bool isOutlined;  

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.height = 50,
    this.width,
    this.isOutlined = false,  
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    final buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: isOutlined ? Colors.white : AppTheme.primaryColor,
      minimumSize: Size(width ?? double.infinity, height),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: isOutlined
            ? const BorderSide(color: AppTheme.primaryColor, width: 1)
            : BorderSide.none,
      ),
      foregroundColor: isOutlined ? AppTheme.primaryColor : Colors.white,
    );

    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: buttonStyle,
      child: isLoading
          ?   SizedBox(
              height: 24.h,
              width: 24.w,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : Text(
              text,
              style: TextStyle(
                fontSize: 16.h,
                fontWeight: FontWeight.w700,
                color: isOutlined ? AppTheme.primaryColor : Colors.white,
              ),
            ),
    );
  }
}
