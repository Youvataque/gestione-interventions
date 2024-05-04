import 'package:flutter/material.dart';

///////////////////////////////////////////////////////////////
/// structure des datas pour les textfields 
class TextFieldData {
  TextEditingController controller;
  String hintText;
  bool hintType;
  TextInputType inputType;
  List<String> autoFill;
  TextFieldData({
    required this.controller,
    required this.hintText,
    required this.hintType,
    required this.inputType,
    required this.autoFill,
  });
}