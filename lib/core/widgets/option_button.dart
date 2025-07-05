import 'package:flutter/material.dart';
import 'package:tayseer/config/app_theme.dart';
import 'package:tayseer/core/utils/size_config.dart';

Widget optionButton(String text, bool isSelected, VoidCallback onTap, BuildContext context) {
  final isDarkMode = Theme.of(context).brightness == Brightness.dark;
SizeConfig.init(context);
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding:   EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: isSelected ? AppTheme.primaryColor : const Color(0xFFE3E5E5),
          width: 1.5,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 14.h,
              fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
            ),
          ),
          const Spacer(),
          Container(
            width: 18.w,
            height: 18.h,
            margin:   EdgeInsets.only(right: 8.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected
                    ? AppTheme.primaryColor
                    : (isDarkMode ? Colors.white : Colors.black),
                width: 1.5,
              ),
            ),
            child: isSelected
                ? Center(
                    child: Container(
                      width: 10.w,
                      height: 10.h,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppTheme.primaryColor,
                      ),
                    ),
                  )
                : null,
          ),
        ],
      ),
    ),
  );
}
