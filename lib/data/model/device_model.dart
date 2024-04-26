
import 'package:flutter/material.dart';

class DeviceModel {
  final String? title;
  final int? numOfDevices;
  final String? icon;
   ValueNotifier<bool>? isEnabled;

   DeviceModel({required this.title,
   required this.numOfDevices, 
   required this.icon,
     this.isEnabled });
}