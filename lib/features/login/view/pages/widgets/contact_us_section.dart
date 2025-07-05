import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tayseer/core/utils/size_config.dart';

class ContactUsSection extends StatelessWidget {
  const ContactUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    SizeConfig.init(context);
    return Padding(
      padding:   EdgeInsets.symmetric(vertical: 22.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            loc.contactUs,
            style:   TextStyle(
              fontSize: 16.h,
              fontWeight: FontWeight.w500,
            ),
          ),
            SizedBox(width: 8.w),
          SvgPicture.asset(
            'assets/icons/contact_us_icon.svg',
            height: 24.h,
            width: 24.w,
          ),
        ],
      ),
    );
  }
}