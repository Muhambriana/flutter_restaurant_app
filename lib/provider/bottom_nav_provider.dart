
import 'package:flutter/material.dart';

class BottomNavProvider extends ChangeNotifier {

  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  int get selectedIndex => _selectedIndex;
  PageController get pageController => _pageController;

  set setIndexBottomNavBar(int index) {
    if (_selectedIndex != index) {
      _selectedIndex = index;
      notifyListeners();
    }
  }

  void onTap(int index) {
    if (_selectedIndex != index) {
      _pageController.jumpToPage(index);
      _selectedIndex = index;
    }
  }

  void onPageChanged(int index) {
    _selectedIndex = index;
  }
}