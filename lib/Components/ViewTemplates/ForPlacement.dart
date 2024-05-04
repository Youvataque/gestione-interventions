import 'package:flutter/material.dart';

///////////////////////////////////////////////////////////////
/// permet de placer correctement les texts buttons
class ForPlacement extends StatelessWidget {
  final Widget content;
  const ForPlacement({
    super.key,
    required this.content
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        width: double.infinity,
        child: content,
      ),
    );
  }
}