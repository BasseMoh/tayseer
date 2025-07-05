import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tayseer/core/utils/size_config.dart';
import 'package:tayseer/core/widgets/support_button.dart';

class FooterLinks extends StatelessWidget {
  const FooterLinks({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    SizeConfig.init(context);
    return Column(
      children: [
        // First Row: WhatsApp New and Subscribe
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: SupportButton(
                text: loc.whatsNew,
                onPressed: () {},
                iconPath: 'assets/icons/what_is_new_icon.svg',
                hasIcon: true,
              ),
            ),
              SizedBox(width: 10.w),
            Expanded(
              child: SupportButton(
                text: loc.subscribe,
                onPressed: () {},
                iconPath: 'assets/icons/subscription_icon.svg',
                hasIcon: true,
              ),
            ),
          ],
        ),
          SizedBox(height: 10.h),
        
        // Second Row: Offers and About Us
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: SupportButton(
                text: loc.offers,
                onPressed: () {},
                iconPath: 'assets/icons/offers_icon.svg',
                hasIcon: true,
              ),
            ),
              SizedBox(width: 10.w),
            Expanded(
              child: SupportButton(
                text: loc.aboutUs,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}