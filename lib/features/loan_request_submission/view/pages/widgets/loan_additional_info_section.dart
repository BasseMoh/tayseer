import 'package:flutter/material.dart';
import 'package:tayseer/core/utils/size_config.dart';
import 'package:tayseer/core/widgets/custom_text_field.dart';
import 'package:tayseer/core/widgets/dropdown_field.dart';
import 'package:tayseer/core/widgets/option_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoanAdditionalInfoSection extends StatelessWidget {
  final String? selectedBranch;
  final String? selectedSource;
  final String? selectedPurpose;
  final ValueChanged<String?> onBranchChanged;
  final ValueChanged<String?> onSourceChanged;
  final ValueChanged<String?> onPurposeChanged;
  final bool? selectedOption;
  final ValueChanged<bool> onOptionSelected;
  final TextEditingController salesEmployeeCodeController;

  const LoanAdditionalInfoSection({
    super.key,
    required this.selectedBranch,
    required this.selectedSource,
    required this.selectedPurpose,
    required this.onBranchChanged,
    required this.onSourceChanged,
    required this.onPurposeChanged,
    required this.selectedOption,
    required this.onOptionSelected,
    required this.salesEmployeeCodeController,
  });

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    SizeConfig.init(context);
    double heightSpacer = 20.h;

    final List<String> branches = [ loc.branchCairo,
  loc.branchRiyadh,
  loc.branchDubai,];
    final List<String> sources = [
      loc.sourceLinkedin,
      loc.sourceFacebook,
      loc.sourceTwitter,
      loc.sourceFriend,
      loc.sourceAdvertisement,
    ];
    final List<String> purposes = [
      loc.purposePersonalLoan,
      loc.purposeBusinessLoan,
      loc.purposeEducation,
      loc.purposeMedical,
      loc.purposeHomeRenovation,
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        dropdownField(
          title: loc.branch,
          value: selectedBranch,
          hint: loc.select,
          items: branches,
          onChanged: onBranchChanged,
          context: context,
        ),
        SizedBox(height: heightSpacer),
        dropdownField(
          title: loc.howDidYouKnowAboutUs,
          value: selectedSource,
          hint: loc.select,
          items: sources,
          onChanged: onSourceChanged,
          context: context,
        ),
        SizedBox(height: heightSpacer),
        dropdownField(
          title: loc.financingPurpose,
          value: selectedPurpose,
          hint: loc.select,
          items: purposes,
          onChanged: onPurposeChanged,
          context: context,
        ),
        SizedBox(height: heightSpacer),
        CustomTextField(
          controller: salesEmployeeCodeController,
          title: loc.salesEmployeeCode,
          hintText: loc.enterEmployeeCode,
          isRTL: false,
          isOptional: true,
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: heightSpacer),
        Text(
          loc.relatedPartyQuestion,
          style:   TextStyle(fontSize: 16.h),
        ),
          SizedBox(height: 15.h),
        Row(
          children: [
            Expanded(
              child: optionButton(
                loc.yes,
                selectedOption == true,
                () => onOptionSelected(true),
                context,
              ),
            ),
              SizedBox(width: 16.w),
            Expanded(
              child: optionButton(
                loc.no,
                selectedOption == false,
                () => onOptionSelected(false),
                context,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
