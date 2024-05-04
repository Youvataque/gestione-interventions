import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SquareButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback func;
  const SquareButton({
    super.key,
    required this.icon,
    required this.func
  });

  @override
  State<SquareButton> createState() => _SquareButtonState();
}

class _SquareButtonState extends State<SquareButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: 55,
      child: IconButton(
        style: IconButton.styleFrom(
          surfaceTintColor: Colors.transparent,
          backgroundColor: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          )
        ),
        onPressed: () => widget.func(),
        icon: Icon(
          widget.icon,
          color: Theme.of(context).scaffoldBackgroundColor,
          size: 25,
        ),
        iconSize: 45,
      )
    );
  }
}