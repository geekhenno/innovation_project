import 'package:flutter/material.dart';

class BottomItemData {
  final Widget view;
  final String title;
  final String selectedIcon;
  final String unSelectedIcon;

  const BottomItemData({
    required this.view,
    required this.title,
    required this.selectedIcon,
    required this.unSelectedIcon,
  });
}
