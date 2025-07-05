import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:tayseer/core/utils/size_config.dart';
import 'package:tayseer/core/widgets/custom_elevated_button.dart';
import 'package:tayseer/core/widgets/confirmation_dialog.dart';
import 'package:tayseer/core/widgets/dismiss_keyboared_scroll_view.dart';
import 'package:tayseer/features/loan_request_submission/view/pages/widgets/loan_additional_info_section.dart';
import 'package:tayseer/features/loan_request_submission/view/provider/loan_submission_view_model.dart';
import 'package:tayseer/features/loan_request_submission/view/pages/widgets/progress_step_row.dart';

class LoanSubmissionPage extends StatelessWidget {
  LoanSubmissionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final loanViewModel = context.watch<LoanSubmissionViewModel>();
    double heightSpacer = 20.h;
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(loc.loanRequestSubmission),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pushNamed(context, '/login');
          },
        ),
      ),
      body: DismissKeyboardScrollView(
        child: Column(
          children: [
            SizedBox(height: heightSpacer),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ProgressStepRow(),

                  SizedBox(height: heightSpacer),
                  Text(
                    loc.howDidYouKnowAboutUs,
                    style: TextStyle(fontSize: 16.h, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 12.h),

                  LoanAdditionalInfoSection(
                    selectedBranch: loanViewModel.selectedBranch,
                    selectedSource: loanViewModel.selectedSource,
                    selectedPurpose: loanViewModel.selectedPurpose,
                    selectedOption: loanViewModel.selectedOption,
                    onBranchChanged: loanViewModel.setBranch,
                    onSourceChanged: loanViewModel.setSource,
                    onPurposeChanged: loanViewModel.setPurpose,
                    onOptionSelected: loanViewModel.setSelectedOption,
                    salesEmployeeCodeController:
                        loanViewModel.salesEmployeeCodeController,
                  ),
                    SizedBox(height: 50.h),

                  CustomElevatedButton(
                    text: loc.continueText,
                    onPressed: () async {
                      // Show confirmation dialog and freeze screen
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder:
                            (context) => ConfirmationDialog(
                              title:
                                  AppLocalizations.of(context)!.loanSubmitted,
                              lottieAsset: 'assets/images/success.json',
                            ),
                      );
                      // Wait 5 seconds, then close the dialog and navigate
                      await Future.delayed(const Duration(seconds: 5));

                      if (context.mounted) {
                        Navigator.of(context).pop(); // Close the dialog
                        Navigator.pushReplacementNamed(context, '/login');
                        loanViewModel.dispose();
                      }
                    },
                  ),
                  SizedBox(height: heightSpacer),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Center(
                      child: Text(
                        loc.followUpLater,
                        style: TextStyle(
                          fontSize: 16.h,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                   
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
