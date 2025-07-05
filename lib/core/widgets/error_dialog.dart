import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tayseer/core/utils/size_config.dart';

void errorDialog(BuildContext context, String message) {
  SizeConfig.init(context);
  showDialog(
    context: context,
    builder:
        (context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          contentPadding:   EdgeInsets.all(24.h),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset('assets/images/error.json', height: 120.h, width: 120.w),
                SizedBox(height: 20.h),
              Text(
                message,
                textAlign: TextAlign.center,
                style:   TextStyle(
                  fontSize: 16.h,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
  );
}
