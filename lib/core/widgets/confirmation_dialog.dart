import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tayseer/core/utils/size_config.dart';

class ConfirmationDialog extends StatelessWidget {
  final String title;
  final String lottieAsset;

  const ConfirmationDialog({
    super.key,
    required this.title,
    required this.lottieAsset,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
     // insetPadding: const EdgeInsets.all(24),
      child: Padding(
        padding:   EdgeInsets.all(24.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(
              lottieAsset,
              width: 120.w,
              height: 120.h,
              fit: BoxFit.contain,
            ),
              SizedBox(height: 20.h),
            Text(
              title,
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
}
