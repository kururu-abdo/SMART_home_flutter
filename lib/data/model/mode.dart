import 'package:flutter/material.dart';

class Mode {
  final String? title;
  final String? icon;
  final ValueNotifier<int>? selectedMode;

  Mode({required this.title, required this.icon,
   required this.selectedMode});

}