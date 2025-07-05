import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginViewModel with ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;
  
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> login(BuildContext context, String email, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));

    final loc = AppLocalizations.of(context)!;

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email)) {
      _errorMessage = loc.invalidEmail;
    } else if (password != "123456") {
      _errorMessage = loc.invalidPassword;
    } else {
      _errorMessage = null;
    }

    _isLoading = false;
    notifyListeners();
  }

  
}
