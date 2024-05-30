import 'package:flutter/material.dart';

class ColorProvider with ChangeNotifier {
  int _selectedIndex = -1;

  int get selectedIndex => _selectedIndex;

  void toggleColor(int index) {
    if (_selectedIndex == index) {
      _selectedIndex = -1;
    } else {
      _selectedIndex = index;
    }
    notifyListeners();
  }
}
