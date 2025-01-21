import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _isAcceptTermAndCond = false;
  bool get isAcceptTermAndCond => _isAcceptTermAndCond;

  void toggleTermsCondition() {
    _isAcceptTermAndCond = !_isAcceptTermAndCond;
    notifyListeners();
  }

  bool _isObsecure = true;
  bool get isObsecure => _isObsecure;
  toggleObsecure() {
    _isObsecure = !_isObsecure;
    notifyListeners();
  }

  bool _isObsecure1 = true;
  bool get isObsecure1 => _isObsecure1;
  toggleObsecure1() {
    _isObsecure1 = !_isObsecure1;
    notifyListeners();
  }

  bool _isObsecure2 = true;
  bool get isObsecure2 => _isObsecure2;
  toggleObsecure2() {
    _isObsecure2 = !_isObsecure2;
    notifyListeners();
  }
}
