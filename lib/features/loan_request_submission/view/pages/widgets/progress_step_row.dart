// lib/core/widgets/progress_step_row.dart

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tayseer/core/widgets/progress_step.dart';

class ProgressStepRow extends StatelessWidget {
  const ProgressStepRow({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProgressStep(title: loc.verifyIdentity),
          ProgressStep(title: loc.personalInformation),
          ProgressStep(title: loc.jobInformation),
          ProgressStep(title: loc.incomeInfo),
          ProgressStep(title: loc.financingProgram),
          ProgressStep(title: loc.bankData, isLast: true),
        ],
      ),
    );
  }
}
