
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestionnaire_interventions/Components/Structure/PickerData.dart';
import 'package:gestionnaire_interventions/Components/ViewTemplates/DatePickerView.dart';

///////////////////////////////////////////////////////////////
/// Sélectionne la date avec style :)
class PickerButton extends StatefulWidget {
  final PickerData data;
  const PickerButton({
    super.key,
    required this.data
  });

  @override
  State<PickerButton> createState() => _PickerButtonState();
}

class _PickerButtonState extends State<PickerButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          showCupertinoModalPopup(
            context: context,
            builder: (context) => DatePickerView(
              dateTime: widget.data.dateTime,
              abortFunc: widget.data.abortFunc,
              validateFunc: widget.data.validateFunc,
              onTimeChanged: (p0) {
                widget.data.dateTime = p0;
              },
              time: widget.data.time,
            )
          );
        },
        style: buttonStyle(),
        child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Align(
            alignment: Alignment.centerLeft,
            child: theText(),
          ),
        )
    );
  }

///////////////////////////////////////////////////////////////
/// text du bouton
Text theText() {
  return Text(
    widget.data.title,
    style: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 16,
      color: widget.data.selected? Theme.of(context).colorScheme.background : Theme.of(context).colorScheme.tertiary
    ),
  );
}

///////////////////////////////////////////////////////////////
/// Style du bouton
  ButtonStyle buttonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: widget.data.selected? Theme.of(context).primaryColor : Theme.of(context).colorScheme.background,
      foregroundColor: widget.data.selected? Theme.of(context).scaffoldBackgroundColor : Theme.of(context).primaryColor,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      padding: const EdgeInsets.symmetric(vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: widget.data.selected? Theme.of(context).primaryColor : Theme.of(context).dividerColor,
          width: 2
        )
      )
    );
  }
}