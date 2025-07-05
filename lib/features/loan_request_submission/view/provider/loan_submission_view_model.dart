import 'package:flutter/material.dart';

class LoanSubmissionViewModel extends ChangeNotifier {
  String? selectedBranch;
  String? selectedSource;
  String? selectedPurpose;
  bool? isRelated;
  bool? selectedOption;
  final salesEmployeeCodeController = TextEditingController();

  void setBranch(String? value) {
    selectedBranch = value;
    notifyListeners();
  }

  void setSource(String? value) {
    selectedSource = value;
    notifyListeners();
  }

  void setPurpose(String? value) {
    selectedPurpose = value;
    notifyListeners();
  }

  void setIsRelated(bool value) {
    isRelated = value;
    notifyListeners();
  }
  void setSelectedOption(bool value) {
    selectedOption = value;
    notifyListeners();
  }
   
void reset() {
  selectedBranch = null;
  selectedSource = null;
  selectedPurpose = null;
  isRelated = null;
  selectedOption = null;
  salesEmployeeCodeController.clear();
  notifyListeners();
}

  @override
  void dispose() {
     // Reset all fields
    selectedBranch = null;
    selectedSource = null;
    selectedPurpose = null;
    isRelated = null;
    selectedOption = null;
    salesEmployeeCodeController.clear();

  
   
    super.dispose();
  }
}
