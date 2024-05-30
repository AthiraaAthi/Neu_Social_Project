import 'package:flutter/material.dart';

class ColorProvider with ChangeNotifier {
  bool _isSelected = false;

  bool get isSelected => _isSelected;

  void toggleColor() {
    _isSelected = !_isSelected;
    notifyListeners();
  }
}
