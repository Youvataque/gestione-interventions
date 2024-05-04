import 'package:flutter/material.dart';

///////////////////////////////////////////////////////////////
/// encart d'info
class InfoDoubleText extends StatelessWidget {
  final String title;
  final String content;
  const InfoDoubleText({
    super.key,
    required this.title,
    required this.content
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).textTheme.labelLarge!.color
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Align(
            alignment: Alignment.center,
            child: SelectableText(
              content,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).primaryColor
              ),
            ),
          )
        )
      ],
    );
  }
}