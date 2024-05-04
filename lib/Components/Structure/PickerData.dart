import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PickerData {
  String title;
  DateTime dateTime;
  VoidCallback abortFunc;
  VoidCallback validateFunc;
  Function(DateTime) onTimeChanged;
  bool selected;
  bool time;
  PickerData({
    required this.title,
    required this.dateTime,
    required this.abortFunc,
    required this.validateFunc,
    required this.onTimeChanged,
    required this.selected,
    this.time = false
  });
}