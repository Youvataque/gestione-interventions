import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

///////////////////////////////////////////////////////////////
/// Picker style apple avec un bouton de retour et un bouton de validation
class DatePickerView extends StatefulWidget {
  final DateTime dateTime;
  final VoidCallback abortFunc;
  final VoidCallback validateFunc;
  final Function(DateTime) onTimeChanged;
  final bool time;
  const DatePickerView({
    super.key,
    required this.dateTime,
    required this.abortFunc,
    required this.validateFunc,
    required this.onTimeChanged,
    required this.time
  });

  @override
  State<DatePickerView> createState() => _DatePickerViewState();
}

class _DatePickerViewState extends State<DatePickerView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 410,
        width: 350,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          children: [
            SizedBox(
              height: 350,
              width: 350,
              child: CupertinoDatePicker(
                initialDateTime: widget.dateTime,
                onDateTimeChanged: (DateTime newTime) {
                  setState(() {
                    widget.onTimeChanged(newTime);
                  });
                },
                use24hFormat: true,
                mode: widget.time? CupertinoDatePickerMode.time : CupertinoDatePickerMode.date,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                abortButton(),
                const Gap(50),
                validateButton()
              ],
            )
          ],
        )
      )
    );
  }

///////////////////////////////////////////////////////////////
/// création du bouton
  SizedBox button(VoidCallback func, String title, bool main) {
    return SizedBox(
      height: 40,
      width: 125,
      child: ElevatedButton(
        onPressed: () {
          func();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: main? Theme.of(context).primaryColor : Theme.of(context).colorScheme.tertiary,
          foregroundColor: Theme.of(context).scaffoldBackgroundColor,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
          )
        ),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
            color: Theme.of(context).scaffoldBackgroundColor
          ),
        ),
      ),
    );
  }

///////////////////////////////////////////////////////////////
/// bouton de retour
  SizedBox abortButton() {
    return button(
      () {
        widget.abortFunc();
        Navigator.pop(context);
      },
      "Maintenant",
      false
    );
  }

///////////////////////////////////////////////////////////////
/// bouton de validation
  SizedBox validateButton() {
    return button(
      () {
        widget.validateFunc();
        Navigator.pop(context);
      },
      "Valider",
      true
    );
  }
}