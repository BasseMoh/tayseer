import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tayseer/config/app_theme.dart';
import 'package:tayseer/core/utils/size_config.dart';
import 'package:tayseer/core/widgets/custom_text_field.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool isArabic;

  const LoginForm({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.isArabic,
  });

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    SizeConfig.init(context);
    return Column(
      children: [
        CustomTextField(
          controller: emailController,
          title: loc.email,
          hintText: loc.enterEmail,
   
          isRTL: isArabic,
        ),

          SizedBox(height: 20.h),
        CustomTextField(
          controller: passwordController,
          title: loc.password,
          hintText: loc.enterPassword,
          isPassword: true,
          isRTL: isArabic,
        ),

        Padding(
          padding:   EdgeInsets.symmetric(vertical: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {},
                child: Text(
                  loc.forgotPassword,
                  style: TextStyle(
                    color: AppTheme.primaryColor,
                    fontSize: 14.h,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
