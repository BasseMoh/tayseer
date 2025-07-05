import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tayseer/config/app_theme.dart';
import 'package:tayseer/core/utils/size_config.dart';

class WelcomeHeader extends StatelessWidget {
  const WelcomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    SizeConfig.init(context);
    return Column(
      children: [
        
        Text(
          loc.welcome,
          style:   TextStyle(fontSize: 16.h, fontWeight: FontWeight.w500),
        ),
          SizedBox(height: 5.h),
        Text(
          loc.logToAcc,
          style: TextStyle(
            color: AppTheme.primaryColor,
            fontSize: 16.h,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}