import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tayseer/core/utils/size_config.dart';
import 'package:tayseer/core/widgets/custom_elevated_button.dart';
import 'package:tayseer/core/widgets/dismiss_keyboared_scroll_view.dart';
import 'package:tayseer/core/widgets/error_dialog.dart';
import 'package:tayseer/core/widgets/confirmation_dialog.dart';
import 'package:tayseer/features/login/view/pages/widgets/contact_us_section.dart';
import 'package:tayseer/features/login/view/pages/widgets/create_account_section.dart';
import 'package:tayseer/features/login/view/pages/widgets/footer_links.dart';
import 'package:tayseer/features/login/view/pages/widgets/login_form.dart';
import 'package:tayseer/features/login/view/pages/widgets/top_bar.dart';
import 'package:tayseer/features/login/view/pages/widgets/welcome_header.dart';
import '../provider/login_view_model.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    final loc = AppLocalizations.of(context)!;
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    double heightSpacer = 20.h;
    return Scaffold(
      body: DismissKeyboardScrollView(
        child: Padding(
          padding:   EdgeInsets.all(20.0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: heightSpacer),

              TopBar(),

              SizedBox(height: heightSpacer),

              WelcomeHeader(),

              LoginForm(
                emailController: emailController,
                passwordController: passwordController,
                isArabic: isArabic,
              ),

              SizedBox(height: heightSpacer),

              Consumer<LoginViewModel>(
                builder: (context, viewModel, _) {
                  if (viewModel.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return CustomElevatedButton(
                    text: loc.login,
                    onPressed:
                        () => {
                          FocusScope.of(context).unfocus(),
                          _login(context),
                        },
                    isLoading: viewModel.isLoading,
                  );
                },
              ),

              CreateAccountSection(),

              /// Loan request button
              CustomElevatedButton(
                isOutlined: true,
                text: loc.loanRequest,
                onPressed: () {},
              ),

              ContactUsSection(),
              const Spacer(),
              Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: const FooterLinks(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _login(BuildContext context) async {
    final viewModel = Provider.of<LoginViewModel>(context, listen: false);

    await viewModel.login(
      context,
      emailController.text.trim(),
      passwordController.text.trim(),
    );

    if (viewModel.errorMessage == null) {
      // Show confirmation dialog and freeze screen
      showDialog(
        context: context,
        barrierDismissible: false, // Prevent user from closing it
        builder:
            (context) => ConfirmationDialog(
              title: AppLocalizations.of(context)!.loginSuccessMessage,
              lottieAsset: 'assets/images/success.json',
            ),
      );

      // Wait 5 seconds, then close the dialog and navigate
      await Future.delayed(const Duration(seconds: 5));

      if (context.mounted) {
        Navigator.of(context).pop(); // Close the dialog
        Navigator.pushReplacementNamed(context, '/loan-submission');
      }
    } else {
      errorDialog(context, viewModel.errorMessage!);
    }
  }
}
