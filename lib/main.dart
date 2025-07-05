import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tayseer/features/loan_request_submission/view/pages/loan_submission_page.dart';
import 'package:tayseer/features/loan_request_submission/view/provider/loan_submission_view_model.dart';
import 'package:tayseer/features/login/view/pages/login_page.dart';
import 'package:tayseer/core/widgets/splash_screen.dart';  
import 'config/theme_controller.dart';
import 'core/localization/localization_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'config/app_theme.dart';
import 'features/login/view/provider/login_view_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeController()),
        ChangeNotifierProvider(create: (_) => LocalizationController()),
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => LoanSubmissionViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Provider.of<ThemeController>(context);
    final localeController = Provider.of<LocalizationController>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tayseer App',
      theme: AppTheme.light(),
      
      darkTheme: AppTheme.dark(),
      themeMode: themeController.themeMode,
      locale: localeController.locale,
      supportedLocales: const [Locale('en'), Locale('ar')],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),  
        '/login': (context) => LoginPage(), 
        '/loan-submission': (context) =>   LoanSubmissionPage(),   
      },
      builder: (context, child) {
        final locale = Localizations.localeOf(context);
        return Directionality(
          textDirection: locale.languageCode == 'ar'
              ? TextDirection.rtl
              : TextDirection.ltr,
          child: child!,
        );
      },
    );
  }
}
