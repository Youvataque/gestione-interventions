import 'package:flutter/cupertino.dart';

class DoubleTextfield {
  final String title1;
  final String title2;
  final TextEditingController controller1;
  final TextEditingController controller2;
  const DoubleTextfield({
    required this.title1,
    required this.title2,
    required this.controller1,
    required this.controller2
  });
}