import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tayseer/config/app_theme.dart';
import 'package:tayseer/core/utils/size_config.dart';

class CreateAccountSection extends StatelessWidget {
  const CreateAccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    SizeConfig.init(context);
    return Padding(
      padding:   EdgeInsets.symmetric(vertical: 22.h),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: loc.dontHaveAcc,
              style:   TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16.h,
              ),
            ),
            TextSpan(
              text: loc.createAcc,
              style: TextStyle(
                color: AppTheme.primaryColor,
                fontWeight: FontWeight.w700,
                fontSize: 16.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}