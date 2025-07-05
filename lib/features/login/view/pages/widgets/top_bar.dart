import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tayseer/core/localization/localization_controller.dart';
import 'package:tayseer/config/theme_controller.dart';
import 'package:tayseer/core/widgets/icon_svg_button.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeController = Provider.of<ThemeController>(context);
    final locController = Provider.of<LocalizationController>(context);

    final themeIconColor = themeController.themeMode == ThemeMode.dark
        ? Colors.yellow[700]
        : theme.iconTheme.color;

    final localizationIconColor = locController.locale.languageCode == 'ar'
        ? Colors.blue
        : theme.iconTheme.color;

    return Row(
      children: [
        // Theme Toggle Icon
        IconSvgButton(
          assetPath: 'assets/icons/theme_icon.svg',
          color: themeIconColor,
          onPressed: () => themeController.toggleTheme(),
        ),
        
        // Localization Toggle Icon
        IconSvgButton(
          assetPath: 'assets/icons/localization_icon.svg',
          color: localizationIconColor,
          onPressed: () => toggleLocalization(context),
        ),
        
        const Spacer(),
        
        // Location Icon
        IconSvgButton(
          assetPath: 'assets/icons/location_icon.svg',
          color: theme.iconTheme.color,
          onPressed: () {},
        ),
      ],
    );
  }

 
}